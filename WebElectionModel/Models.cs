using Helpers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Mvc;

namespace WebElectionModel
{
    #region Administration
    #region Excel
    public class AdminExcelButtons
    {
        public int Code { get; set; }
        public string Libelle { get; set; }
        public int IsActif { get; set; }
        public string ExecProcStockee { get; set; }
        public bool ParamRecherche { get; set; }
    }
    #endregion

    #region Scrutins
    public class AdminScrutinHeader
    {
        public int HeaderCode { get; set; }
        public int IsActif { get; set; }
        public string Libelle { get; set; }
        public int Ordre { get; set; }
        public string Champ { get; set; }
        public int ColonneSize { get; set; }
    }
    public class AdminScrutinList
    {
        public List<AdminScrutinHeader> Headers { get; set; }
        public List<AdminScrutin> Scrutins { get; set; }
        public List<AdminScrutinButtons> Buttons { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int Count { get; set; }
        public int FiltreCode { get; set; }
        public string Recherche { get; set; }

        public AdminScrutinList()
        {
            Page = 1;
            PageSize = 10;
            Count = 0;
            FiltreCode = 0;
            Scrutins = new List<AdminScrutin>();
            Recherche = "";
        }

        public AdminScrutinList(IEnumerable<AdminScrutin> liste, int page, int pagesize, int count)
        {
            Page = page;
            PageSize = pagesize;
            Scrutins = new List<AdminScrutin>(liste);
            Count = count;

        }
    }
    public class AdminScrutin
    {
        public List<string> Buttons { get; set; }
        public string CompanyName { get; set; }
        public string CodeAPE { get; set; }
        public List<AdminScrutinContact> Contacts { get; set; }
        public int IdElection { get; set; }
        public ListeTypeModel TypeScrutin { get; set; }
        public int NbSalaries { get; set; }
        public string AvancementScrutin { get; set; }
        public int Avancement { get; set; }
        public int Avancement1erTour { get; set; }
        public int Avancement2ndTour { get; set; }
        public DateTime? Date1erTourScellement { get; set; }
        public DateTime Date1erTourDebut { get; set; }
        public DateTime Date1erTourFin { get; set; }
        public DateTime? Date2emeTourScellement { get; set; }
        public DateTime? Date2emeTourDebut { get; set; }
        public DateTime? Date2emeTourFin { get; set; }
        public string Date1erTour
        {
            get
            {
                return (Date1erTourScellement != null ? Date1erTourScellement.ToStringNotNull("dd HH:mm") + " -> " : "")
                    + Date1erTourDebut.ToString("dd/MM/yyyy HH:mm") + "-"
                    + Date1erTourFin.ToString(
                        Date1erTourDebut.Date == Date1erTourFin.Date ? "HH:mm" :
                            (Date1erTourDebut.Month == Date1erTourFin.Month ? "dd HH:mm" :
                                (Date1erTourDebut.Year == Date1erTourFin.Year ? "dd/MM HH:mm" :
                                    "dd/MM/yyyy HH:mm"
                                )
                            )
                      )
                    + " + 15'";
            }
        }
        public string Date2emeTour
        {
            get
            {
                if (Date2emeTourDebut == null)
                { return ""; }
                else
                {
                    return (Date2emeTourScellement != null ? Date2emeTourScellement.ToStringNotNull("dd HH:mm") + " -> " : "")
                        + Date2emeTourDebut.ToStringNotNull("dd/MM/yyyy HH:mm") + "-"
                        + Date2emeTourFin.ToStringNotNull(
                            Date2emeTourDebut?.Date == Date2emeTourFin?.Date ? "HH:mm" :
                                (Date2emeTourDebut?.Month == Date2emeTourFin?.Month ? "dd HH:mm" :
                                    (Date2emeTourDebut?.Year == Date2emeTourFin?.Year ? "dd/MM HH:mm" :
                                        "dd/MM/yyyy HH:mm"
                                    )
                                )
                          )
                        + " + 15'";
                }
            }
        }
        public ListeTypeModel Statut { get; set; }
    }
    public class AdminScrutinContact
    {
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string Mail { get; set; }
        public string Telephone { get; set; }
        public string Qualite { get; set; }
    }
    public class AdminScrutinButtons
    {
        public string Code { get; set; }
        public string Libelle { get; set; }
    }
    #endregion

    #region Contacts
    public class AdminContactList
    {
        public List<AdminScrutinHeader> Headers { get; set; }
        public List<AdminExcelButtons> ExcelButtons { get; set; }
        public List<AdminContact> Contacts { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int Count { get; set; }
        public int FiltreCode { get; set; }
        public string Recherche { get; set; }

        public AdminContactList()
        {
            Page = 1;
            PageSize = 10;
            Count = 0;
            FiltreCode = 0;
            Contacts = new List<AdminContact>();
            Recherche = "";
        }

        public AdminContactList(IEnumerable<AdminContact> liste, int page, int pagesize, int count)
        {
            Page = page;
            PageSize = pagesize;
            Contacts = new List<AdminContact>(liste);
            Count = count;

        }
    }
    public class AdminContact
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Company { get; set; }
        public string Quality { get; set; }
        public string Email { get; set; }
        public string Telephone { get; set; }
        public string Adresse1 { get; set; }
        public string Adresse2 { get; set; }
        public string Adresse3 { get; set; }
        public string BoitePostale { get; set; }
        public string CodePostal { get; set; }
        public string Ville { get; set; }
        public string Pays { get; set; }
    }
    #endregion

    #region Support
    public class AdminSupportList
    {
        public List<AdminScrutinHeader> Headers { get; set; }
        public List<AdminSupport> Supports { get; set; }
        public List<AdminScrutinButtons> Buttons { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int Count { get; set; }
        public int FiltreCode { get; set; }
        public string Recherche { get; set; }

        public AdminSupportList()
        {
            Page = 1;
            PageSize = 10;
            Count = 0;
            FiltreCode = 0;
            Recherche = "";
            Supports = new List<AdminSupport>();
        }
        public AdminSupportList(IEnumerable<AdminSupport> liste, int page, int pagesize, int count)
        {
            Page = page;
            PageSize = pagesize;
            Supports = new List<AdminSupport>(liste);
            Count = count;
        }
    }
    public class AdminSupport
    {
        public List<string> Buttons { get; set; }
        public string Marque { get; set; }
        public string Company { get; set; }
        public string Etat { get; set; }
        public string CodeVote { get; set; }
        public string PAPDatabase { get; set; }
        public string VersionAPI { get; set; }
        public string Avancement { get; set; }
        public string Quand { get; set; }
        public string Securite { get; set; }
        public string TourLabel { get; set; }
        public int NBListe { get; set; }
        public int NBSalariesReels { get; set; }
        public int Votants { get; set; }
        public int Emargement { get; set; }
        public string Url { get; set; }
        public string PAPWebSite { get; set; }
        public ListeTypeModel Statut { get; set; }
        public int IdElection { get; set; }

    }
    #endregion

    #region Support Analyse
    public class AdminSupportAnalyseList
    {
        public int IdElection { get; set; }
        public List<AdminScrutinButtons> Buttons { get; set; }
        public List<AdminScrutinHeader> HeadersTour { get; set; }
        public List<AdminSupportAnalyseTour> Tour { get; set; }
        public List<AdminScrutinHeader> HeadersBureau { get; set; }
        public List<AdminSupportAnalyseBureau> Bureau { get; set; }
        public List<AdminScrutinHeader> HeadersUrnes { get; set; }
        public List<AdminSupportAnalyseUrnes> Urnes { get; set; }

        public AdminSupportAnalyseList(List<AdminSupportAnalyseTour> Tour, List<AdminSupportAnalyseBureau> Bureau, List<AdminSupportAnalyseUrnes> Urnes)
        {
            this.Tour = new List<AdminSupportAnalyseTour>(Tour);
            this.Bureau = new List<AdminSupportAnalyseBureau>(Bureau);
            this.Urnes = new List<AdminSupportAnalyseUrnes>(Urnes);

        }
        public AdminSupportAnalyseList(IEnumerable<AdminSupportAnalyseTour> liste)
        {
            Tour = new List<AdminSupportAnalyseTour>(liste);
        }
        public AdminSupportAnalyseList(IEnumerable<AdminSupportAnalyseBureau> liste)
        {
            Bureau = new List<AdminSupportAnalyseBureau>(liste);
        }
        public AdminSupportAnalyseList(IEnumerable<AdminSupportAnalyseUrnes> liste)
        {
            Urnes = new List<AdminSupportAnalyseUrnes>(liste);
        }
    }
    public class AdminSupportAnalyseTour
    {
        public string Tour { get; set; }
        public string ScrutinTour { get; set; }
        public string PAPDatabase { get; set; }
        public string NTourTour { get; set; }
        public string Horaire { get; set; }
        public string DateScellementUrnes { get; set; }
        public string Debut { get; set; }
        public string Fin { get; set; }
        public string EtatAvancement { get; set; }
        public string AvancementTour { get; set; }
        public string Categories { get; set; }
        public string CategoriesRepresentees { get; set; }
        public string DateDebutDepotListe { get; set; }
        public string DateMaxDepotListe { get; set; }
        public string RemoteInfo { get; set; }
        public string Libelle { get; set; }
        public string DelaiCloseScrutin { get; set; }
        public string Demo { get; set; }
        public string MDPSize { get; set; }
        public string MDPAlpha { get; set; }
        public string IdElection { get; set; }
        public string IdentificationElecteurs { get; set; }
    }
    public class AdminSupportAnalyseBureau
    {
        public string Bureau { get; set; }
        public string IdBureauBureau { get; set; }
        public string Collegial { get; set; }
        public string EtapeScellement { get; set; }
        public string EtapeDepouillement { get; set; }
        public string IdMembre { get; set; }
        public string President { get; set; }
        public string Nom { get; set; }
        public string Prenoms { get; set; }
        public string CheckInGenerationKey { get; set; }
        public string CheckInScellement { get; set; }
        public string CheckInDepouillement { get; set; }
        public string LastActionBureau { get; set; }
        public string IdCollaborateur { get; set; }
        public string CleScellement { get; set; }
        public string CleScellementHoraire { get; set; }
        public string CleDepouillement { get; set; }
        public string CleDepouillementHoraire { get; set; }
        public string MailProfessionnel { get; set; }
        public string MailPersonnel { get; set; }
        public string MobileProfessionnel { get; set; }
        public string RemoteInfo { get; set; }
        public string ModeTest { get; set; }
        public string DateNaissance { get; set; }
        public string Age { get; set; }
        public string IdElection { get; set; }
    }
    public class AdminSupportAnalyseUrnes
    {
        public string Urne { get; set; }
        public string IdBureauUrne { get; set; }
        public string ModeTest { get; set; }
        public string NTourUrne { get; set; }
        public string EtatUrne { get; set; }
        public string DateEtat { get; set; }
        public string Accord { get; set; }
        public string NbListes { get; set; }
        public string NbVotants { get; set; }
        public string NbNonVotants { get; set; }
        public string Etablissement { get; set; }
        public string College { get; set; }
        public string ScrutinUrne { get; set; }
        public string Participation { get; set; }
        public string Emargement { get; set; }
        public string Bulletins { get; set; }
        public string CoherenceVote { get; set; }
        public string DateVote { get; set; }
        public string LastActionUrne { get; set; }
        public string Blancs { get; set; }
        public string Nuls { get; set; }
        public string PbBulletins { get; set; }
        public string Quorum { get; set; }
        public string QuorumAtteint { get; set; }
        public string BureauMembresAction { get; set; }
        public string NbScellement { get; set; }
        public string NbDepouillement { get; set; }
        public string Vote { get; set; }
        public string IdUrne { get; set; }
        public string IdTour { get; set; }
        public string IdTourUrne { get; set; }
        public string HashDepouillement { get; set; }
        public string RemoteInfo { get; set; }
        public string IdElection { get; set; }
    }
    #endregion

    #region Scrutins Potentiels
    public class AdminScrutinPotentielList
    {
        public List<AdminScrutinHeader> Headers { get; set; }
        public List<AdminScrutinPotentiel> ScrutinsPotentiels { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int Count { get; set; }

        public AdminScrutinPotentielList()
        {

            Page = 1;
            PageSize = 10;
            Count = 0;
            ScrutinsPotentiels = new List<AdminScrutinPotentiel>();
        }

        public AdminScrutinPotentielList(IEnumerable<AdminScrutinPotentiel> liste, int page, int pagesize, int count)
        {
            Page = page;
            PageSize = pagesize;
            ScrutinsPotentiels = new List<AdminScrutinPotentiel>(liste);
            Count = count;
        }
    }
    public class AdminScrutinPotentiel
    {
        public DateTime Date { get; set; }
        public string Planning { get; set; }
        public int ElectionsPotentielles { get; set; }
        public int Elections { get; set; }
        public int ElecteursPotentiels { get; set; }
        public int ElecteursPrevus { get; set; }
        public int ElecteursConnectes { get; set; }
        public decimal Percentage { get; set; }
        public int DemandesDeCode { get; set; }
    }
    #endregion

    #region Scrutins MB
    public class AdminScrutinMBList
    {
        public List<AdminScrutinHeader> Headers { get; set; }
        public List<AdminScrutinMB> ScrutinsMB { get; set; }
        public List<AdminScrutinButtons> Buttons { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int Count { get; set; }
        public int FiltreCode { get; set; }
        public string Recherche { get; set; }

        public AdminScrutinMBList()
        {
            Page = 1;
            PageSize = 10;
            Count = 0;
            FiltreCode = 0;
            ScrutinsMB = new List<AdminScrutinMB>();
            Recherche = "";
        }

        public AdminScrutinMBList(IEnumerable<AdminScrutinMB> liste, int page, int pagesize, int count)
        {
            Page = page;
            PageSize = pagesize;
            ScrutinsMB = new List<AdminScrutinMB>(liste);
            Count = count;

        }
    }
    public class AdminScrutinMB
    {
        public List<string> Buttons { get; set; }
        public string CompanyName { get; set; }
        public List<AdminScrutinMBContact> ContactsMB { get; set; }
        public int IdElection { get; set; }
        public ListeTypeModel TypeScrutin { get; set; }
        public int NbSalaries { get; set; }
        public string AvancementScrutin { get; set; }
        public int Avancement { get; set; }
        public int Avancement1erTour { get; set; }
        public int Avancement2ndTour { get; set; }
        public DateTime? Date1erTourScellement { get; set; }
        public DateTime Date1erTourDebut { get; set; }
        public DateTime Date1erTourFin { get; set; }
        public DateTime? Date2emeTourScellement { get; set; }
        public DateTime? Date2emeTourDebut { get; set; }
        public DateTime? Date2emeTourFin { get; set; }
        public string Date1erTour
        {
            get
            {
                return (Date1erTourScellement != null ? Date1erTourScellement.ToStringNotNull("dd HH:mm") + " -> " : "")
                    + Date1erTourDebut.ToString("dd/MM/yyyy HH:mm") + "-"
                    + Date1erTourFin.ToString(
                        Date1erTourDebut.Date == Date1erTourFin.Date ? "HH:mm" :
                            (Date1erTourDebut.Month == Date1erTourFin.Month ? "dd HH:mm" :
                                (Date1erTourDebut.Year == Date1erTourFin.Year ? "dd/MM HH:mm" :
                                    "dd/MM/yyyy HH:mm"
                                )
                            )
                      )
                    + " + 15'";
            }
        }
        public string Date2emeTour
        {
            get
            {
                if (Date2emeTourDebut == null)
                { return ""; }
                else
                {
                    return (Date2emeTourScellement != null ? Date2emeTourScellement.ToStringNotNull("dd HH:mm") + " -> " : "")
                        + Date2emeTourDebut.ToStringNotNull("dd/MM/yyyy HH:mm") + "-"
                        + Date2emeTourFin.ToStringNotNull(
                            Date2emeTourDebut?.Date == Date2emeTourFin?.Date ? "HH:mm" :
                                (Date2emeTourDebut?.Month == Date2emeTourFin?.Month ? "dd HH:mm" :
                                    (Date2emeTourDebut?.Year == Date2emeTourFin?.Year ? "dd/MM HH:mm" :
                                        "dd/MM/yyyy HH:mm"
                                    )
                                )
                          )
                        + " + 15'";
                }
            }
        }
        public ListeTypeModel Statut { get; set; }
    }
    public class AdminScrutinMBContact
    {
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string Mail { get; set; }
        public string Telephone { get; set; }
    }
    #endregion
    
    #endregion
}