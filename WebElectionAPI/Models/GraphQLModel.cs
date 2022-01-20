using DataElectionMetier;
using GraphQL.Types;
using GraphQL;
using Helpers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using WebElectionAPI.App_GlobalResources;
using WebElectionModel;

namespace WebElectionAPI.Models
{
    [Serializable]

    public partial class GQLElectionQuery : ObjectGraphType
    {
        partial void CreateQueriesVotes();
        public GQLElectionQuery()
        {
            #region Administration
            Field<GQLProcessusElectionPhase>("administrationPhase",
                resolve: context =>
                {
                    ElectionServiceClient client = (ElectionServiceClient)context.UserContext["client"];
                    var Phases = client.GetAdministrationPhase(out FieldErrors ErrorCode);
                    ElectionServiceException.ThrowException(ErrorCode);
                    return Phases;
                });

            Field<GQLAdministrationScrutinsList>("administrationScrutin",
                arguments: new QueryArguments(
                        new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "recherche" }, //non null graph type : no null value, empty string is ok
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "filtreCode" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "page" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "pageSize" }),
                resolve: context =>
                {
                    ElectionServiceClient client = (ElectionServiceClient)context.UserContext["client"];
                    var Scrutins = client.GetAdminScrutins(out FieldErrors ErrorCode, context.GetArgument<string>("recherche"), context.GetArgument<int>("filtreCode"), context.GetArgument<int>("page"), context.GetArgument<int>("pageSize"));
                    return Scrutins;
                });

            Field<GQLAdministrationContactsList>("administrationContact",
                arguments: new QueryArguments(
                        new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "recherche" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "filtreCode" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "page" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "pageSize" }),
                resolve: context =>
                {
                    ElectionServiceClient client = (ElectionServiceClient)context.UserContext["client"];
                    var Contacts = client.GetAdminContacts(out FieldErrors ErrorCode, context.GetArgument<string>("recherche"), context.GetArgument<int>("filtreCode"), context.GetArgument<int>("page"), context.GetArgument<int>("pageSize"));
                    return Contacts;
                });

            Field<GQLAdministrationSupportsList>("administrationSupport",
                arguments: new QueryArguments(
                        new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "recherche" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "filtreCode" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "page" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "pageSize" }),
                resolve: context =>
                {
                    ElectionServiceClient client = (ElectionServiceClient)context.UserContext["client"];
                    var Supports = client.GetAdminSupports(out FieldErrors ErrorCode, context.GetArgument<string>("recherche"), context.GetArgument<int>("filtreCode"), context.GetArgument<int>("page"), context.GetArgument<int>("pageSize"));
                    return Supports;
                });

            Field<GQLAdministrationSupportsAnalyseList>("administrationSupportAnalyseVote",
                arguments: new QueryArguments(
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "idElection" }),
                resolve: context =>
                {
                    ElectionServiceClient client = (ElectionServiceClient)context.UserContext["client"];
                    var SupportsAnalyse = client.GetAdminSupportsAnalyse(out FieldErrors ErrorCode, context.GetArgument<int>("idElection"));
                    return SupportsAnalyse;
                });

            Field<GQLAdministrationScrutinsPotentielsList>("administrationScrutinPotentiel",
                arguments: new QueryArguments(
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "page" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "pageSize" }),
                resolve: context =>
                {
                    ElectionServiceClient client = (ElectionServiceClient)context.UserContext["client"];
                    var ScrutinsPotentiels = client.GetAdminScrutinsPotentiels(out FieldErrors ErrorCode, context.GetArgument<int>("page"), context.GetArgument<int>("pageSize"));
                    return ScrutinsPotentiels;
                });

            Field<GQLAdministrationScrutinsMBList>("administrationScrutinMB",
                arguments: new QueryArguments(
                        new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "recherche" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "filtreCode" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "page" },
                        new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "pageSize" }),
                resolve: context =>
                {
                    ElectionServiceClient client = (ElectionServiceClient)context.UserContext["client"];
                    var ScrutinsMB = client.GetAdminScrutinsMB(out FieldErrors ErrorCode, context.GetArgument<string>("recherche"), context.GetArgument<int>("filtreCode"), context.GetArgument<int>("page"), context.GetArgument<int>("pageSize"));
                    return ScrutinsMB;
                });
            #endregion
        }
    }
    public partial class GQLElectionMutation : ObjectGraphType
    {
        partial void CreateMutationsVotes();
        public GQLElectionMutation()
        {
            #region Administration

            Field<BooleanGraphType>("adminScrutinButtonsActions", //type de retour
            arguments: new QueryArguments(
                new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "ButtonCode" },
                new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "IdElection" },
                new QueryArgument<NonNullGraphType<IntGraphType>> { Name = "HeaderType" }
                ),
            resolve: context =>
            {
                ElectionServiceClient client = (ElectionServiceClient)context.UserContext["client"];
                var Result = client.SetAdminButtonAction(out FieldErrors ErrorCode, context.GetArgument<string>("buttonCode"), context.GetArgument<int>("idElection"), context.GetArgument<int>("headerType"));
                ElectionServiceException.ThrowException(ErrorCode);
                return Result;
            });

            #endregion
            CreateMutationsVotes();
        }
    }
    #region Administration
    
    #region Excel
    public class GQLAdministrationExcelButtons : ObjectGraphType<AdminExcelButtons>
    {
        public GQLAdministrationExcelButtons()
        {
            Field(x => x.Code);
            Field(x => x.Libelle);
            Field(x => x.IsActif);
            Field(x => x.ExecProcStockee);
            Field(x => x.ParamRecherche);
        }
    }
    #endregion

    #region Scrutins
    public class GQLAdministrationScrutinsList : ObjectGraphType<AdminScrutinList>
    {
        public GQLAdministrationScrutinsList()
        {
            Field<ListGraphType<GQLAdministrationScrutins>>("Scrutins", resolve: x => x.Source.Scrutins);
            Field<ListGraphType<GQLAdministrationHeaders>>("Headers", resolve: x => x.Source.Headers);
            //Field<ListGraphType<GQLAdministrationCheckBoxes>>("CheckBoxes", resolve: x => x.Source.CheckBoxes);
            Field<ListGraphType<GQLAdministrationScrutinsButtons>>("Buttons", resolve: x => x.Source.Buttons);
            //Field<ListGraphType<GQLAdministrationExcelButtons>>("ExcelButtons", resolve: x => x.Source.ExcelButtons);
            Field(x => x.Page);
            Field(x => x.PageSize);
            Field(x => x.FiltreCode);
            Field(x => x.Count);
            Field(x => x.Recherche);
        }
    }
    public class GQLAdministrationScrutins : ObjectGraphType<AdminScrutin>
    {
        public GQLAdministrationScrutins()
        {
            Field(x => x.CompanyName);
            Field(x => x.CodeAPE);
            Field<ListGraphType<GQLAdministrationScrutinsContact>>("Contacts", resolve: x => x.Source.Contacts);
            Field(x => x.IdElection);
            Field<GQLListeTypeModel>("TypeScrutin", resolve: x => x.Source.TypeScrutin);
            Field(x => x.NbSalaries);
            Field(x => x.AvancementScrutin);
            Field(x => x.Avancement);
            Field(x => x.Avancement1erTour);
            Field(x => x.Avancement2ndTour);
            Field("Date1erTour", x => x.Date1erTour);
            Field("Date2emeTour", x => x.Date2emeTour);
            Field<GQLListeTypeModel>("Statut", resolve: context => context.Source.Statut);
            Field<ListGraphType<StringGraphType>>("Buttons", resolve: x => x.Source.Buttons);
        }
    }
    public class GQLAdministrationScrutinsButtons : ObjectGraphType<AdminScrutinButtons>
    {
        public GQLAdministrationScrutinsButtons()
        {
            Field(x => x.Code);
            Field(x => x.Libelle);
        }
    }
    public class GQLAdministrationScrutinsContact : ObjectGraphType<AdminScrutinContact>
    {
        public GQLAdministrationScrutinsContact()
        {
            Field(x => x.Name);
            Field(x => x.FirstName);
            Field(x => x.Mail);
            Field("Telephone", x => x.Telephone.ToStringNotNull());
            Field("Qualite", x => x.Qualite.ToStringNotNull()); // n'est pas testé dans le site de paramétrage mais avant. ou ", nullable: true"
        }
    }
    public class GQLAdministrationHeaders : ObjectGraphType<AdminScrutinHeader>
    {
        public GQLAdministrationHeaders()
        {
            Field(x => x.HeaderCode);
            Field(x => x.IsActif);
            Field(x => x.Libelle);
            Field(x => x.Ordre);
            Field(x => x.Champ);
            Field(x => x.ColonneSize);
        }
    }
    #endregion

    #region Contacts
    public class GQLAdministrationContactsList : ObjectGraphType<AdminContactList>
    {
        public GQLAdministrationContactsList()
        {
            Field<ListGraphType<GQLAdministrationContacts>>("Contacts", resolve: x => x.Source.Contacts);
            Field<ListGraphType<GQLAdministrationHeaders>>("Headers", resolve: x => x.Source.Headers);
            Field<ListGraphType<GQLAdministrationExcelButtons>>("ExcelButtons", resolve: x => x.Source.ExcelButtons);
            Field(x => x.Page);
            Field(x => x.PageSize);
            Field(x => x.FiltreCode);
            Field(x => x.Count);
            Field(x => x.Recherche);
        }
    }
    public class GQLAdministrationContacts : ObjectGraphType<AdminContact>
    {
        public GQLAdministrationContacts()
        {
            Field(x => x.FirstName);
            Field(x => x.LastName);
            Field(x => x.Company);
            Field("Quality", x => x.Quality.ToStringNotNull());
            Field(x => x.Email);
            Field("Telephone", x => x.Telephone.ToStringNotNull());
            Field("Adresse1", x => x.Adresse1.ToStringNotNull());
            Field("Adresse2", x => x.Adresse2.ToStringNotNull());
            Field("Adresse3", x => x.Adresse3.ToStringNotNull());
            Field("BoitePostale", x => x.BoitePostale.ToStringNotNull());
            Field("CodePostal", x => x.CodePostal.ToStringNotNull());
            Field("Ville", x => x.Ville.ToStringNotNull());
            Field("Pays", x => x.Pays.ToStringNotNull());
        }
    }
    #endregion

    #region Support
    public class GQLAdministrationSupportsList : ObjectGraphType<AdminSupportList>
    {
        public GQLAdministrationSupportsList()
        {
            Field<ListGraphType<GQLAdministrationSupports>>("Supports", resolve: x => x.Source.Supports);
            Field<ListGraphType<GQLAdministrationHeaders>>("Headers", resolve: x => x.Source.Headers);
            Field<ListGraphType<GQLAdministrationScrutinsButtons>>("Buttons", resolve: x => x.Source.Buttons);
            //Field<ListGraphType<GQLAdministrationExcelButtons>>("ExcelButtons", resolve: x => x.Source.ExcelButtons);
            Field(x => x.Page);
            Field(x => x.PageSize);
            Field(x => x.FiltreCode);
            Field(x => x.Count);
            Field(x => x.Recherche);
        }
    }
    public class GQLAdministrationSupports : ObjectGraphType<AdminSupport>
    {
        public GQLAdministrationSupports()
        {
            Field<ListGraphType<StringGraphType>>("Buttons", resolve: x => x.Source.Buttons);
            Field(x => x.Marque);
            Field(x => x.Company);
            Field(x => x.Etat);
            Field(x => x.CodeVote);
            Field(x => x.PAPDatabase);
            Field(x => x.VersionAPI);
            Field(x => x.Avancement);
            Field(x => x.Quand);
            Field(x => x.Securite);
            Field(x => x.TourLabel);
            Field(x => x.NBListe);
            Field(x => x.NBSalariesReels);
            Field(x => x.Votants);
            Field(x => x.Emargement);
            Field(x => x.Url);
            Field(x => x.PAPWebSite);
            Field<GQLListeTypeModel>("Statut", resolve: context => context.Source.Statut);
            Field(x => x.IdElection);
        }
    }
    #endregion

    #region Support Analyse
    public class GQLAdministrationSupportsAnalyseList : ObjectGraphType<AdminSupportAnalyseList>
    {
        public GQLAdministrationSupportsAnalyseList()
        {
            Field<ListGraphType<GQLAdministrationHeaders>>("HeadersTour", resolve: x => x.Source.HeadersTour);
            Field<ListGraphType<GQLAdministrationTour>>("Tour", resolve: x => x.Source.Tour);
            Field<ListGraphType<GQLAdministrationHeaders>>("HeadersBureau", resolve: x => x.Source.HeadersBureau);
            Field<ListGraphType<GQLAdministrationBureau>>("Bureau", resolve: x => x.Source.Bureau);
            Field<ListGraphType<GQLAdministrationHeaders>>("HeadersUrnes", resolve: x => x.Source.HeadersUrnes);
            Field<ListGraphType<GQLAdministrationUrnes>>("Urnes", resolve: x => x.Source.Urnes);
            Field(x => x.IdElection);
        }
    }
    public class GQLAdministrationTour : ObjectGraphType<AdminSupportAnalyseTour>
    {
        public GQLAdministrationTour()
        {
            Field(x => x.Tour);
            Field(x => x.ScrutinTour);
            Field(x => x.PAPDatabase);
            Field(x => x.NTourTour);
            Field(x => x.Horaire);
            Field(x => x.DateScellementUrnes);
            Field(x => x.Debut);
            Field(x => x.Fin);
            Field(x => x.EtatAvancement);
            Field(x => x.AvancementTour);
            Field(x => x.Categories);
            Field(x => x.CategoriesRepresentees);
            Field(x => x.DateDebutDepotListe);
            Field(x => x.DateMaxDepotListe);
            Field(x => x.RemoteInfo);
            Field(x => x.Libelle);
            Field(x => x.DelaiCloseScrutin);
            Field(x => x.Demo);
            Field(x => x.MDPSize);
            Field(x => x.MDPAlpha);
            Field(x => x.IdElection);
            Field(x => x.IdentificationElecteurs);
        }
    }
    public class GQLAdministrationBureau : ObjectGraphType<AdminSupportAnalyseBureau>
    {
        public GQLAdministrationBureau()
        {
            Field(x => x.Bureau);
            Field(x => x.IdBureauBureau);
            Field(x => x.Collegial);
            Field(x => x.EtapeScellement);
            Field(x => x.EtapeDepouillement);
            Field(x => x.IdMembre);
            Field(x => x.President);
            Field(x => x.Nom);
            Field(x => x.Prenoms);
            Field(x => x.CheckInGenerationKey);
            Field(x => x.CheckInScellement);
            Field(x => x.CheckInDepouillement);
            Field(x => x.LastActionBureau);
            Field(x => x.IdCollaborateur);
            Field(x => x.CleScellement);
            Field(x => x.CleScellementHoraire);
            Field(x => x.CleDepouillement);
            Field(x => x.CleDepouillementHoraire);
            Field(x => x.MailProfessionnel);
            Field(x => x.MailPersonnel);
            Field(x => x.MobileProfessionnel);
            Field(x => x.RemoteInfo);
            Field(x => x.ModeTest);
            Field(x => x.DateNaissance);
            Field(x => x.Age);
            Field(x => x.IdElection);
        }
    }
    public class GQLAdministrationUrnes : ObjectGraphType<AdminSupportAnalyseUrnes>
    {
        public GQLAdministrationUrnes()
        {
            Field(x => x.Urne);
            Field(x => x.IdBureauUrne);
            Field(x => x.ModeTest);
            Field(x => x.NTourUrne);
            Field(x => x.EtatUrne);
            Field(x => x.DateEtat);
            Field(x => x.Accord);
            Field(x => x.NbListes);
            Field(x => x.NbVotants);
            Field(x => x.NbNonVotants);
            Field(x => x.Etablissement);
            Field(x => x.College);
            Field(x => x.ScrutinUrne);
            Field(x => x.Participation);
            Field(x => x.Emargement);
            Field(x => x.Bulletins);
            Field(x => x.CoherenceVote);
            Field(x => x.DateVote);
            Field(x => x.LastActionUrne);
            Field(x => x.Blancs);
            Field(x => x.Nuls);
            Field(x => x.PbBulletins);
            Field(x => x.Quorum);
            Field(x => x.QuorumAtteint);
            Field(x => x.BureauMembresAction);
            Field(x => x.NbScellement);
            Field(x => x.NbDepouillement);
            Field(x => x.Vote);
            Field(x => x.IdUrne);
            Field(x => x.IdTour);
            Field(x => x.IdTourUrne);
            Field(x => x.HashDepouillement);
            Field(x => x.RemoteInfo);
            Field(x => x.IdElection);
        }
    }
    #endregion

    #region Scrutins Potentiels
    public class GQLAdministrationScrutinsPotentielsList : ObjectGraphType<AdminScrutinPotentielList>
    {
        public GQLAdministrationScrutinsPotentielsList()
        {
            Field<ListGraphType<GQLAdministrationScrutinsPotentiels>>("ScrutinsPotentiels", resolve: x => x.Source.ScrutinsPotentiels);
            Field<ListGraphType<GQLAdministrationHeaders>>("Headers", resolve: x => x.Source.Headers);
            Field(x => x.Page);
            Field(x => x.PageSize);
            Field(x => x.Count);
        }
    }
    public class GQLAdministrationScrutinsPotentiels : ObjectGraphType<AdminScrutinPotentiel>
    {
        public GQLAdministrationScrutinsPotentiels()
        {
            Field(x => x.Date);
            Field(x => x.Planning);
            Field(x => x.ElectionsPotentielles);
            Field(x => x.Elections);
            Field(x => x.ElecteursPotentiels);
            Field(x => x.ElecteursPrevus);
            Field(x => x.ElecteursConnectes);
            Field(x => x.Percentage);
            Field(x => x.DemandesDeCode);
        }
    }
    #endregion

    #region ScrutinsMB
    public class GQLAdministrationScrutinsMBList : ObjectGraphType<AdminScrutinMBList>
    {
        public GQLAdministrationScrutinsMBList()
        {
            Field<ListGraphType<GQLAdministrationScrutinsMB>>("ScrutinsMB", resolve: x => x.Source.ScrutinsMB);
            Field<ListGraphType<GQLAdministrationHeaders>>("Headers", resolve: x => x.Source.Headers);
            Field<ListGraphType<GQLAdministrationScrutinsButtons>>("Buttons", resolve: x => x.Source.Buttons);
            Field(x => x.Page);
            Field(x => x.PageSize);
            Field(x => x.FiltreCode);
            Field(x => x.Count);
            Field(x => x.Recherche);
        }
    }
    public class GQLAdministrationScrutinsMB : ObjectGraphType<AdminScrutinMB>
    {
        public GQLAdministrationScrutinsMB()
        {
            Field(x => x.CompanyName);
            Field<ListGraphType<GQLAdministrationScrutinsMBContact>>("ContactsMB", resolve: x => x.Source.ContactsMB);
            Field(x => x.IdElection);
            Field<GQLListeTypeModel>("TypeScrutin", resolve: x => x.Source.TypeScrutin);
            Field(x => x.NbSalaries);
            Field(x => x.AvancementScrutin);
            Field(x => x.Avancement);
            Field(x => x.Avancement1erTour);
            Field(x => x.Avancement2ndTour);
            Field("Date1erTour", x => x.Date1erTour);
            Field("Date2emeTour", x => x.Date2emeTour);
            Field<GQLListeTypeModel>("Statut", resolve: context => context.Source.Statut);
            Field<ListGraphType<StringGraphType>>("Buttons", resolve: x => x.Source.Buttons);
        }
    }
    public class GQLAdministrationScrutinsMBContact : ObjectGraphType<AdminScrutinMBContact>
    {
        public GQLAdministrationScrutinsMBContact()
        {
            Field(x => x.Name);
            Field(x => x.FirstName);
            Field(x => x.Mail);
            Field("Telephone", x => x.Telephone.ToStringNotNull());
        }
    }
    #endregion

    #endregion
}