using Helpers;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebElectionModel;
using DataElection;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace DataElectionMetier
{
    public partial class ElectionServiceClient
    {
        #region Administration
        #region Phase
        public ProcessusElectionPhase GetAdministrationPhase(out FieldErrors Errors)
        {
            Errors = null;

            var Etapes = new ProcessusElectionPhase()
            {
                IdElection = -1,
                Phase = 0,
                Entete = new EnteteElection(),
                Bandeaux = new List<PhaseBandeau>()
            };
            var Lignes = Repository.f_Admin_General_Menu(Params.IdUser).ToList().OrderBy(L => L.Ordre);
            var Statut = ApplyExternalLibelle(new ListeTypeModel()
            {
                Code = (Lignes.FirstOrDefault()?.Statut) ?? 3, // if null : render 3 : green status
                Type = TypeListe.StatutProcessusPhase,
            });

            Etapes.Etapes.AddRange(Lignes.Select(L => new PhaseEtape()
            {
                Libelle = Dictionnaire(L.Libelle),
                Aide = new AideElement()
                {
                    HtmlContent = Dictionnaire(L.AideContent),
                    Titre = Dictionnaire(L.AideTitle)
                },
                Statut = ApplyExternalLibelle(new ListeTypeModel()
                {
                    Code = L.Statut,
                    Type = TypeListe.StatutProcessusPhase,
                }),
                Bouton = new PhaseProcessusBouton()
                {
                    Actif = true,
                    Route = L.Route,
                    Parametres = new Dictionary<string, object>()
                },
                Disabled = L.Disabled ?? false
            }));

            return Etapes;
        }
        #endregion

        #region Scrutins
        public AdminScrutinList GetAdminScrutins(out FieldErrors Errors, string Recherche, int FiltreCode, int Page, int PageSize)
        {
            Errors = null;

            ObjectParameter Count = new ObjectParameter("Count", typeof(int));

            // One line for each header/cell
            var Headers = Repository.f_Admin_Header(Params.IdUser, 1, 0).ToList().OrderBy(H => H.Ordre) //màj colonne ordre dans ettfmw
                .Select(H => new AdminScrutinHeader()
                {
                    HeaderCode = (int)H.HeaderCode,
                    IsActif = (int)H.IsActif,
                    Libelle = Dictionnaire(H.Libelle),
                    Ordre = (int)H.Ordre,
                    Champ = H.Champ,
                    ColonneSize = (int)H.ColonneSize
                });

            var Buttons = Repository.f_Admin_SAV_Scrutins_Buttons(1, 0).ToList().OrderBy(B => B.Code)
                .Select(B => new AdminScrutinButtons()
                {
                    Code = B.Code,
                    Libelle = Dictionnaire(B.Libelle)
                });


            var Lignes = Repository.f_Admin_SAV_Scrutins(Recherche, Params.IdUser, FiltreCode, Page, PageSize, Count).ToList()
                    .OrderByDescending(L => L.IdElection)
                    .GroupBy(L => L.IdElection, (G, LS) => new AdminScrutin()
                    {
                        Buttons = LS.First().Buttons.Split(',').Where(B => B != "").ToList(),
                        CompanyName = LS.First().CompanyName,
                        CodeAPE = LS.First().CodeAPE,
                        Contacts = LS.Select(C => new AdminScrutinContact()
                        {
                            Name = C.Nom,
                            FirstName = C.Prenoms,
                            Mail = C.Email,
                            Telephone = C.Telephone ?? "",
                            Qualite = C.Qualité
                        }).ToList(),
                        IdElection = G,
                        TypeScrutin = ApplyExternalLibelle(new ListeTypeModel() { Code = LS.First().TypeScrutin ?? 0, Type = TypeListe.TypeVote }),
                        NbSalaries = LS.First().NbSalaries ?? 0,
                        AvancementScrutin = LS.First().AvancementScrutin,
                        Avancement = LS.First().Avancement ?? 0,
                        Avancement1erTour = LS.First().Avancement1erTour ?? 0,
                        Avancement2ndTour = LS.First().Avancement2ndTour ?? 0,
                        Date1erTourScellement = LS.First().Date1erTourScellement,
                        Date1erTourDebut = LS.First().Date1erTourDebut,
                        Date1erTourFin = LS.First().Date1erTourFin,
                        Date2emeTourScellement = LS.First().Date2emeTourScellement,
                        Date2emeTourDebut = LS.First().Date2emeTourDebut,
                        Date2emeTourFin = LS.First().Date2emeTourFin,
                        Statut = ApplyExternalLibelle(new ListeTypeModel() { Code = LS.First().Statut ?? 3, Type = TypeListe.CodeErreurWarning }), //idem mais le type sera TypeListeWarning
                    }).ToList();

            return new AdminScrutinList(Lignes, Page, PageSize, (int)Count.Value)
            {
                FiltreCode = FiltreCode,
                Recherche = Recherche,
                Headers = new List<AdminScrutinHeader>(Headers),
                Buttons = new List<AdminScrutinButtons>(Buttons)
            };
        }
        #endregion

        #region Boutons
        public bool SetAdminButtonAction(out FieldErrors Errors, string ButtonCode, int IdElection, int HeaderType) //:bool
        {
            Errors = null;

            try
            {
                var passUpActions = Repository.f_Admin_SAV_Scrutins_Button_Phase(ButtonCode, IdElection, HeaderType).Select(p => new PassUpAction()
                {
                    NTour = p.NTour,
                    TypeAction = p.TypeAction
                }).ToList();

                foreach (var p in passUpActions)
                {
                    switch (p.TypeAction)
                    {
                        case 0:
                            Task.Run(() => CreateElectionDatabaseVote(Company.Database.Connection.Database, Company.Database.Connection.DataSource, p.NTour));
                            break;
                    }
                }

                return true;
            }
            catch (Exception e)
            {
                Log("SetAdminButtonAction.Erreur=<n°22>", e);
                Errors = new FieldErrors(22);
                return false;
            }
        }
        #endregion

        #region Contacts
        public AdminContactList GetAdminContacts(out FieldErrors Errors, string Recherche, int FiltreCode, int Page, int PageSize)
        {
            Errors = null;

            ObjectParameter Count = new ObjectParameter("Count", typeof(int));

            // One line for each header/cell
            var Headers = Repository.f_Admin_Header(Params.IdUser, 2, 0).ToList().OrderBy(H => H.Ordre) //màj colonne ordre dans ettfmw
                .Select(H => new AdminScrutinHeader()
                {
                    HeaderCode = (int)H.HeaderCode,
                    IsActif = (int)H.IsActif,
                    Libelle = Dictionnaire(H.Libelle),
                    Ordre = (int)H.Ordre,
                    Champ = H.Champ,
                    ColonneSize = (int)H.ColonneSize
                });

            var Lignes = Repository.f_Admin_SAV_Contacts(Recherche, Params.IdUser, FiltreCode, Page, PageSize, Count).ToList()
                    .OrderBy(L => L.Company).ThenBy(L => L.LastName).ThenBy(L => L.FirstName)
                    .Select(C => new AdminContact()
                    {
                        FirstName = C.FirstName,
                        LastName = C.LastName,
                        Company = C.Company,
                        Quality = C.Quality,
                        Email = C.Email,
                        Telephone = C.Telephone,
                        Adresse1 = C.Adresse1,
                        Adresse2 = C.Adresse2,
                        Adresse3 = C.Adresse3,
                        BoitePostale = C.BoitePostale,
                        CodePostal = C.CodePostal,
                        Ville = C.Ville,
                        Pays = C.Pays
                    }).ToList();

            var ExcelButtons = Repository.f_Admin_Excel_Buttons(Params.IdUser, 2).ToList().OrderBy(B => B.Code).Select(B => new AdminExcelButtons()
            {
                Code = B.Code,
                Libelle = Dictionnaire(B.Libelle),
                IsActif = B.IsActif,
                ExecProcStockee = B.ExecProcStockee,
                ParamRecherche = B.ParamRecherche
            });

            return new AdminContactList(Lignes, Page, PageSize, (int)Count.Value)
            {
                FiltreCode = FiltreCode,
                Recherche = Recherche,
                Headers = new List<AdminScrutinHeader>(Headers),
                ExcelButtons = new List<AdminExcelButtons>(ExcelButtons)
            };
        }
        #endregion

        #region Export
        private byte[] _GetAdminExport(out FieldErrors Errors, int Code, string Recherche)
        {
            Errors = null;
            byte[] tab = null;

            var buttons = Repository.f_Admin_Excel_Buttons(Params.IdUser, 0).FirstOrDefault(e => e.Code == Code);

            var export = Repository.f_Admin_Export(Code).Where(c => c.Visible).ToList();

            using (var newFile = new MemoryStream())
            using (var package = new ExcelPackage(newFile))
            {
                package.SupprimeProperties();
                var title = $"{export.FirstOrDefault()?.Title ?? "Les contacts par défaut"}";
                var MaxLetter = $"{(char)('A' + export.Count() - 1)}";

                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add($"{title}");
                int ligne = 1;

                //Title
                worksheet.Cells[$"A{ligne}"].Value = $"{title}";
                using (ExcelRange r = worksheet.Cells[$"A{ligne}:{MaxLetter}{ligne}"])
                {
                    r.Merge = true;
                    r.Style.Font.Size = 18;
                    r.Style.Font.Color.SetColor(FontBackgroundExcel);
                    r.Style.HorizontalAlignment = ExcelHorizontalAlignment.CenterContinuous;
                    r.Style.Fill.PatternType = ExcelFillStyle.Solid;
                    r.Style.Fill.BackgroundColor.SetColor(BackgroundExcel);
                    r.Style.Border.Bottom.Style = ExcelBorderStyle.Medium;
                    r.Style.Border.Bottom.Color.SetColor(BackgroundExcel);
                }

                // Header
                ligne++;

                // Arraw with 2 lines and insert row
                var range = worksheet.Cells[$"A{ligne}:{MaxLetter}{ligne + 1}"];
                var tbl = worksheet.Tables.Add(range.Offset(0, 0), $"Data");

                for (var k = 0; k < export.Count; k++)
                {
                    tbl.Columns[k].Name = $"{export[k].Libelle}";
                }

                ligne++;


                void AddData(SqlDataReader reader, int idx)
                {
                    worksheet.InsertRow(ligne + idx, 1);
                    worksheet.Row(ligne + idx).Style.VerticalAlignment = ExcelVerticalAlignment.Top;

                    var k = 0;

                    foreach (var value in export)
                    {
                        // Headers from SQL
                        var champ = export[k].Champ;
                        var format = export[k].FormatEcriture;
                        string[] subs = champ.Split(',');
                        // Read datas and match with headers
                        object[] liste = subs.Select(s => reader[s]).ToArray();

                        var val = "";

                        if (export[k].FormatEcriture != null)
                        {
                            val = string.Format(format, liste);
                        }
                        else
                        {
                            if (liste.Length > 0)
                            {
                                val = liste[0].ToString();
                            }
                        }
                        worksheet.Cells[$"{(char)('A' + k)}{ligne + idx}"].Value = val;
                        k++;
                    }
                }

                int NbLigne = 0;

                // SQL COMMAND
                string queryString = buttons.ExecProcStockee;

                if (buttons.ParamRecherche)
                {
                    queryString = string.Format(queryString, Recherche);
                }

                var RepositoryConnectionString = Common.RepositorySqlConnectionString();

                using (SqlConnection connection = new SqlConnection(RepositoryConnectionString))
                {
                    SqlCommand command = new SqlCommand(queryString, connection);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            AddData(reader, NbLigne);
                            NbLigne++;
                        }
                    }
                }
                if (NbLigne > 0)
                {
                    worksheet.DeleteRow(ligne + NbLigne); // Delete empty cell on the bottom
                    worksheet.Cells[$"A{ligne}:{MaxLetter}{ligne + NbLigne}"].Style.Numberformat.Format = "@";
                    worksheet.Cells[$"A{ligne}:{MaxLetter}{ligne + NbLigne}"].AutoFitColumns();
                }
                worksheet.Select("A1"); // Focus on top
                tab = package.GetAsByteArray();

                return tab;
            }
        }

        private byte[] InternalGetAdministrationExport(out FieldErrors Errors, int Code, string Recherche, bool PDF, out string Filename)
        {
            Filename = Dictionnaire($"FICHIER_ADMINISTRATION_EXPORT_{Code}") + ".xlsx";
            try
            {
                byte[] tab = _GetAdminExport(out Errors, Code, Recherche);
                if (Errors != null)
                    return null;
                if (PDF)
                    tab = TransformExcelToPDF(tab);

                return tab;
            }
            catch (Exception e)
            {
                Log("InternalGetAdministrationExport.Erreur=136", e);
                Errors = new FieldErrors(136);
                return null;
            }
        }
        #endregion

        #region Support
        public AdminSupportList GetAdminSupports(out FieldErrors Errors, string Recherche, int FiltreCode, int Page, int PageSize)
        {
            Errors = null;

            ObjectParameter Count = new ObjectParameter("Count", typeof(int));

            var Headers = Repository.f_Admin_Header(Params.IdUser, 3, 0).ToList().OrderBy(H => H.Ordre)
                .Select(H => new AdminScrutinHeader()
                {
                    HeaderCode = (int)H.HeaderCode,
                    IsActif = (int)H.IsActif,
                    Libelle = Dictionnaire(H.Libelle),
                    Ordre = (int)H.Ordre,
                    Champ = H.Champ,
                    ColonneSize = (int)H.ColonneSize
                });

            var Buttons = Repository.f_Admin_SAV_Scrutins_Buttons(3, 0).ToList().OrderBy(B => B.Code)
               .Select(B => new AdminScrutinButtons()
               {
                   Code = B.Code,
                   Libelle = Dictionnaire(B.Libelle)
               });

            var Lignes = Repository.f_Admin_SAV_Support(Recherche, Params.IdUser, FiltreCode, Page, PageSize, Count).ToList()
                    .GroupBy(L => L.IdElection, (G, LS) => new AdminSupport()
                    {
                        Buttons = LS.First().Buttons.Split(',').ToList(),
                        Marque = LS.First().Marque,
                        Company = LS.First().Company,
                        Etat = LS.First().Etat,
                        CodeVote = LS.First().CodeVote,
                        PAPDatabase = LS.First().PAPDatabase,
                        VersionAPI = LS.First().VersionAPI,
                        Avancement = LS.First().AVANCEMENT,
                        Quand = LS.First().QUAND,
                        Securite = LS.First().SECURITE,
                        TourLabel = LS.First().TourLabel,
                        NBListe = LS.First().NBListe,
                        NBSalariesReels = LS.First().NBSalariesReels,
                        Votants = LS.First().Votants,
                        Emargement = LS.First().Emargement,
                        Url = LS.First().URL,
                        PAPWebSite = LS.First().PAPWebSite,
                        Statut = ApplyExternalLibelle(new ListeTypeModel() { Code = LS.First().Statut, Type = TypeListe.CodeErreurWarning }), //idem mais le type sera TypeListeWarning
                        IdElection = G
                    }).ToList();

            return new AdminSupportList(Lignes, Page, PageSize, (int)Count.Value)
            {
                FiltreCode = FiltreCode,
                Recherche = Recherche,
                Headers = new List<AdminScrutinHeader>(Headers),
                Buttons = new List<AdminScrutinButtons>(Buttons)
            };
        }
        #endregion

        #region Analyse Vote
        private void GetAdminSupportsAnalyseVote(int IdElection)
        {
            try
            {
                Log($"Création du tableau d'analyse de l'élection : {IdElection}");
                var RepositoryConnectionString = Common.RepositorySqlConnectionString();
                using (var conn = new SqlConnection(RepositoryConnectionString))
                using (SqlCommand command = new SqlCommand($"EXEC [dbo].[_Admin_Support_Analyse_Vote] {IdElection}", conn))
                {
                    conn.Open();
                    command.CommandTimeout = 20 * 60;
                    command.ExecuteNonQuery();
                }
                Log("Création de l'analyse de l'élection");
            }
            catch (Exception e)
            {
                Log("Création de l'analyse de l'élection : erreur de création");
                Log("AnalyseElection.TaskAction", e);
            }
        }

        public void InternalGetSupportAnalyseVote(out FieldErrors Errors, int IdElection)
        {
            Errors = null;
            try
            {
                Task task = Task.Run(() => GetAdminSupportsAnalyseVote(IdElection));
            }
            catch (Exception e)
            {
                Log("SetAnalyseVote.Erreur=137", e);
                Errors = new FieldErrors(137);
            }
        }

        public AdminSupportAnalyseList GetAdminSupportsAnalyse(out FieldErrors Errors, int IdElection)
        {
            Errors = null;

            Log($"Paramètres: {IdElection}");

            GetAdminSupportsAnalyseVote(IdElection);

            var Buttons = Repository.f_Admin_SAV_Scrutins_Buttons(3, 1).ToList().OrderBy(B => B.Code)
               .Select(B => new AdminScrutinButtons()
               {
                   Code = B.Code,
                   Libelle = Dictionnaire(B.Libelle)
               });

            var HeadersTour = Repository.f_Admin_Header(Params.IdUser, 3, 1).ToList().OrderBy(H => H.Ordre)
               .Select(H => new AdminScrutinHeader()
               {
                   HeaderCode = (int)H.HeaderCode,
                   IsActif = (int)H.IsActif,
                   Libelle = Dictionnaire(H.Libelle),
                   Ordre = (int)H.Ordre,
                   Champ = H.Champ,
                   ColonneSize = (int)H.ColonneSize
               });

            var Tour = Repository.f_Admin_Support_Analyse_Vote_Tour(IdElection).ToList()
                    .OrderBy(T => T.ScrutinTour)
                    .Select(T => new AdminSupportAnalyseTour()
                    {
                        Tour = T.Tour ?? "",
                        ScrutinTour = T.ScrutinTour,
                        PAPDatabase = T.PAPDatabase,
                        NTourTour = T.NTourTour.ToString(),
                        Horaire = T.Horaire ?? "",
                        DateScellementUrnes = T.DateScellementUrnes ?? "",
                        Debut = T.Debut ?? "",
                        Fin = T.Fin ?? "",
                        EtatAvancement = T.EtatAvancement.ToString() ?? "0",
                        AvancementTour = T.AvancementTour.ToString() ?? "0",
                        Categories = T.Categories.ToString() ?? "0",
                        CategoriesRepresentees = T.CategoriesRepresentees.ToString() ?? "0",
                        DateDebutDepotListe = T.DateDebutDepotListe ?? "",
                        DateMaxDepotListe = T.DateMaxDepotListe ?? "",
                        RemoteInfo = T.RemoteInfo ?? "",
                        Libelle = T.Libelle ?? "",
                        DelaiCloseScrutin = T.DelaiCloseScrutin.ToString() ?? "0",
                        Demo = T.Demo.ToString() ?? "0",
                        MDPSize = T.MDPSize.ToString() ?? "0",
                        MDPAlpha = T.MDPAlpha.ToString() ?? "0",
                        IdElection = T.IdElection.ToString(),
                        IdentificationElecteurs = T.IdentificationElecteurs
                    }).ToList();

            Log($"TOUR: {Tour}");

            var HeadersBureau = Repository.f_Admin_Header(Params.IdUser, 3, 2).ToList().OrderBy(H => H.Ordre)
               .Select(H => new AdminScrutinHeader()
               {
                   HeaderCode = (int)H.HeaderCode,
                   IsActif = (int)H.IsActif,
                   Libelle = Dictionnaire(H.Libelle),
                   Ordre = (int)H.Ordre,
                   Champ = H.Champ,
                   ColonneSize = (int)H.ColonneSize
               });

            var Bureau = Repository.f_Admin_Support_Analyse_Vote_Bureau_Membres(IdElection).ToList()
                .OrderBy(B => B.IdMembre)
                .Select(B => new AdminSupportAnalyseBureau()
                {
                    Bureau = B.Bureau ?? "",
                    IdBureauBureau = B.IdBureauBureau.ToString() ?? "",
                    Collegial = B.Collegial ?? "",
                    EtapeScellement = B.EtapeScellement.ToString() ?? "0",
                    EtapeDepouillement = B.EtapeDepouillement.ToString() ?? "0",
                    IdMembre = B.IdMembre.ToString(),
                    President = B.President.ToString(),
                    Nom = B.Nom,
                    Prenoms = B.Prenoms,
                    CheckInGenerationKey = B.CheckInGenerationKey.ToString(),
                    CheckInScellement = B.CheckInScellement.ToString(),
                    CheckInDepouillement = B.CheckInDepouillement.ToString(),
                    LastActionBureau = B.LastActionBureau ?? "",
                    IdCollaborateur = B.IdCollaborateur.ToString(),
                    CleScellement = B.CleScellement ?? "",
                    CleScellementHoraire = B.CleScellementHoraire ?? "",
                    CleDepouillement = B.CleDepouillement ?? "",
                    CleDepouillementHoraire = B.CleDepouillementHoraire ?? "",
                    MailProfessionnel = B.MailProfessionnel ?? "",
                    MailPersonnel = B.MailPersonnel ?? "",
                    MobileProfessionnel = B.MobileProfessionnel ?? "",
                    RemoteInfo = B.RemoteInfo ?? "",
                    ModeTest = B.ModeTest.ToString() ?? "0",
                    DateNaissance = B.DateNaissance ?? "",
                    Age = B.Age.ToString() ?? "",
                    IdElection = B.IdElection.ToString()
                }).ToList();

            Log($"BUREAU: {Bureau}");

            var HeadersUrnes = Repository.f_Admin_Header(Params.IdUser, 3, 3).ToList().OrderBy(H => H.Ordre)
              .Select(H => new AdminScrutinHeader()
              {
                  HeaderCode = (int)H.HeaderCode,
                  IsActif = (int)H.IsActif,
                  Libelle = Dictionnaire(H.Libelle),
                  Ordre = (int)H.Ordre,
                  Champ = H.Champ,
                  ColonneSize = (int)H.ColonneSize
              });

            var Urnes = Repository.f_Admin_Support_Analyse_Vote_Urnes(IdElection).ToList()
                .OrderBy(U => U.IdBureauUrne)
                .Select(U => new AdminSupportAnalyseUrnes()
                {
                    Urne = U.Urne ?? "",
                    IdBureauUrne = U.IdBureauUrne.ToString() ?? "",
                    ModeTest = U.ModeTest.ToString() ?? "0",
                    NTourUrne = U.NTourUrne.ToString() ?? "0",
                    EtatUrne = U.EtatUrne ?? "",
                    DateEtat = U.DateEtat ?? "",
                    Accord = U.Accord ?? "",
                    NbListes = U.NbListes.ToString() ?? "0",
                    NbVotants = U.NbVotants ?? "0",
                    NbNonVotants = U.NbNonVotants.ToString() ?? "0",
                    Etablissement = U.Etablissement ?? "",
                    College = U.College ?? "",
                    ScrutinUrne = U.ScrutinUrne ?? "",
                    Participation = U.Participation.ToString() ?? "0",
                    Emargement = U.Emargement.ToString() ?? "0",
                    Bulletins = U.Bulletins.ToString() ?? "0",
                    CoherenceVote = U.CoherenceVote ?? "",
                    DateVote = U.DateVote ?? "",
                    LastActionUrne = U.LastActionUrne ?? "",
                    Blancs = U.Blancs ?? "",
                    Nuls = U.Nuls ?? "",
                    PbBulletins = U.PbBulletins ?? "",
                    Quorum = U.Quorum ?? "",
                    QuorumAtteint = U.QuorumAtteint ?? "",
                    BureauMembresAction = U.BureauMembresAction.ToString() ?? "0",
                    NbScellement = U.NbScellement.ToString() ?? "0",
                    NbDepouillement = U.NbDepouillement.ToString() ?? "0",
                    Vote = U.Vote ?? "",
                    IdUrne = U.IdUrne.ToString(),
                    IdTour = U.IdTour.ToString(),
                    IdTourUrne = U.IdTourUrne.ToString(),
                    HashDepouillement = U.HashDepouillement ?? "",
                    RemoteInfo = U.RemoteInfo ?? "",
                    IdElection = U.IdElection.ToString(),
                }).ToList();

            Log($"Urnes: {Urnes}");

            return new AdminSupportAnalyseList(Tour, Bureau, Urnes)
            {
                Buttons = new List<AdminScrutinButtons>(Buttons),
                HeadersTour = new List<AdminScrutinHeader>(HeadersTour),
                HeadersBureau = new List<AdminScrutinHeader>(HeadersBureau),
                HeadersUrnes = new List<AdminScrutinHeader>(HeadersUrnes)
            };
        }
        #endregion

        #region Scrutins Potentiels
        public AdminScrutinPotentielList GetAdminScrutinsPotentiels(out FieldErrors Errors, int Page, int PageSize)
        {
            Errors = null;

            ObjectParameter Count = new ObjectParameter("Count", typeof(int));

            var Headers = Repository.f_Admin_Header(Params.IdUser, 4, 0).ToList().OrderBy(H => H.Ordre)
                .Select(H => new AdminScrutinHeader()
                {
                    HeaderCode = (int)H.HeaderCode,
                    IsActif = (int)H.IsActif,
                    Libelle = Dictionnaire(H.Libelle),
                    Ordre = (int)H.Ordre,
                    Champ = H.Champ,
                    ColonneSize = (int)H.ColonneSize
                });

            var Lignes = Repository.f_Admin_Scrutins_Potentiels(Params.IdUser, Page, PageSize, Count)
                    .ToList()
                    .OrderBy(L => L.Date)
                    .GroupBy(L => L.Date, (G, LS) => new AdminScrutinPotentiel()
                    {
                        Date = LS.First().Date,
                        Planning = LS.First().Planning,
                        ElectionsPotentielles = LS.First().ElectionsPotentielles ?? 0,
                        Elections = LS.First().Elections ?? 0,
                        ElecteursPotentiels = LS.First().ElecteursPotentiels ?? 0,
                        ElecteursPrevus = LS.First().ElecteursPrevus ?? 0,
                        ElecteursConnectes = LS.First().ElecteursConnectes ?? 0,
                        Percentage = LS.First().Percentage ?? 0,
                        DemandesDeCode = LS.First().DemandesDeCode ?? 0
                    }).ToList();

            return new AdminScrutinPotentielList(Lignes, Page, PageSize, (int)Count.Value)
            {
                Headers = new List<AdminScrutinHeader>(Headers)
            };
        }
        #endregion

        #region Scrutins MB
        public AdminScrutinMBList GetAdminScrutinsMB(out FieldErrors Errors, string Recherche, int FiltreCode, int Page, int PageSize)
        {
            Errors = null;

            ObjectParameter Count = new ObjectParameter("Count", typeof(int));

            var Headers = Repository.f_Admin_Header(Params.IdUser, 5, 0).ToList().OrderBy(H => H.Ordre)
                .Select(H => new AdminScrutinHeader()
                {
                    HeaderCode = (int)H.HeaderCode,
                    IsActif = (int)H.IsActif,
                    Libelle = Dictionnaire(H.Libelle),
                    Ordre = (int)H.Ordre,
                    Champ = H.Champ,
                    ColonneSize = (int)H.ColonneSize
                });

            var Buttons = Repository.f_Admin_SAV_Scrutins_Buttons(5, 0).ToList().OrderBy(B => B.Code)
                .Select(B => new AdminScrutinButtons()
                {
                    Code = B.Code,
                    Libelle = Dictionnaire(B.Libelle)
                });


            var Lignes = Repository.f_Admin_SAV_Scrutins_MB(Recherche, Params.IdUser, FiltreCode, Page, PageSize, Count).ToList()
                    .OrderByDescending(L => L.IdElection)
                    .GroupBy(L => L.IdElection, (G, LS) => new AdminScrutinMB()
                    {
                        Buttons = LS.First().Buttons.Split(',').Where(B => B != "").ToList(),
                        CompanyName = LS.First().CompanyName,
                        ContactsMB = LS.Select(C => new AdminScrutinMBContact()
                        {
                            Name = C.Nom,
                            FirstName = C.Prenoms,
                            Mail = C.Email,
                            Telephone = C.Telephone ?? ""
                        }).ToList(),
                        IdElection = G,
                        TypeScrutin = ApplyExternalLibelle(new ListeTypeModel() { Code = LS.First().TypeScrutin ?? 0, Type = TypeListe.TypeVote }),
                        NbSalaries = LS.First().NbSalaries ?? 0,
                        AvancementScrutin = LS.First().AvancementScrutin,
                        Avancement = LS.First().Avancement ?? 0,
                        Avancement1erTour = LS.First().Avancement1erTour ?? 0,
                        Avancement2ndTour = LS.First().Avancement2ndTour ?? 0,
                        Date1erTourScellement = LS.First().Date1erTourScellement,
                        Date1erTourDebut = LS.First().Date1erTourDebut,
                        Date1erTourFin = LS.First().Date1erTourFin,
                        Date2emeTourScellement = LS.First().Date2emeTourScellement,
                        Date2emeTourDebut = LS.First().Date2emeTourDebut,
                        Date2emeTourFin = LS.First().Date2emeTourFin,
                        Statut = ApplyExternalLibelle(new ListeTypeModel() { Code = LS.First().Statut ?? 3, Type = TypeListe.CodeErreurWarning }), //idem mais le type sera TypeListeWarning
                    }).ToList();

            return new AdminScrutinMBList(Lignes, Page, PageSize, (int)Count.Value)
            {
                FiltreCode = FiltreCode,
                Recherche = Recherche,
                Headers = new List<AdminScrutinHeader>(Headers),
                Buttons = new List<AdminScrutinButtons>(Buttons),
            };
        }
        #endregion
        #endregion
    }
}