export const GetAdministrationPhase = () => `
query GetAdministrationPhase {
  administrationPhase {
    etapes{
      libelle, disabled
      statut{code, libelle},
      aide{titre, description, htmlContent},
      bouton{
        libelle, route, actif, libelleForDownload, codeCouleur
        parametres{key, value}
        aide{titre, description, htmlContent}
      }
      invisibleFormId
      formsStatus{ formId, warning}
    }

    boutons {
      libelle, route, actif, codeCouleur, parametres {key, value}, libelleForDownload
      aide{titre, description, htmlContent}
    }

    bandeaux{
      titre, description, thin,
      type{code, libelle},
      bouton{
        libelle, libelleForDownload, route, actif, codeCouleur,
        parametres{key, value}
        aide{titre, description, htmlContent}
      }
      boutons {
        libelle, route, actif, libelleForDownload, codeCouleur
        parametres {key, value}
        aide{titre, description, htmlContent}
      }
    }
  }
}
`
export const GetAdministrationScrutin = () => `
query GetAdministrationScrutin($recherche: String!, $filtreCode : Int!, $page : Int!, $pageSize : Int!) { 
  administrationScrutin(recherche:$recherche, filtreCode:$filtreCode, page:$page, pageSize:$pageSize) {
    scrutins {
      idElection, companyName, codeAPE, date1erTour, date2emeTour, nbSalaries, avancementScrutin, avancement, avancement1erTour, avancement2ndTour,
      contacts { name, firstName, mail, telephone, qualite },
      statut { code, libelle },
      typeScrutin { code, libelleMini },
      buttons
    },
    headers {
      headerCode, isActif, libelle, ordre, champ, colonneSize
    },  
    buttons { 
      code, libelle 
    },
    page, pageSize, filtreCode, count, recherche
  }
}
`

export const SetAdminButtonAction = () =>
    `mutation SetAdminButtonAction($buttonCode: String!, $idElection: Int!, $headerType: Int!) {
        adminScrutinButtonsActions(buttonCode: $buttonCode, idElection: $idElection, headerType: $headerType)
    }`;

export const GetAdministrationContact = () => `
query GetAdministrationContact($recherche: String!, $filtreCode : Int!, $page : Int!, $pageSize : Int!) {
    administrationContact(recherche:$recherche, filtreCode:$filtreCode, page:$page, pageSize:$pageSize) {
        contacts {
            firstName, lastName, company, quality, email, telephone, adresse1, adresse2, adresse3, boitePostale, codePostal, ville, pays
        },
        headers {
            headerCode, isActif, libelle, ordre, champ, colonneSize
        },
        excelButtons {
            code, libelle, isActif, execProcStockee, paramRecherche
        },
        page, pageSize, filtreCode, count, recherche
    }
}
`

export const GetAdministrationSupport = () => `
query GetAdministrationSupport($recherche: String!, $filtreCode : Int!, $page : Int!, $pageSize : Int!) {
    administrationSupport(recherche:$recherche, filtreCode:$filtreCode, page:$page, pageSize:$pageSize) {
        supports {
            buttons, marque, company, etat, codeVote, pAPDatabase, versionAPI, avancement, quand, securite, tourLabel, nBListe, nBSalariesReels, votants, emargement, url, pAPWebSite,
            statut { code, libelle },
            idElection
        },
        headers {
          headerCode, isActif, libelle, ordre, champ, colonneSize
        },
        buttons {
          code, libelle
        },
        page, pageSize, filtreCode, count, recherche
    }
}
`

export const GetAdministrationAnalyseVote = () => `
query GetAdministrationAnalyseVote($idElection: Int!){
    administrationSupportAnalyseVote(idElection: $idElection){
        headersTour {
          headerCode, isActif, libelle, ordre, champ, colonneSize
        },
        tour{
            tour, scrutinTour, pAPDatabase, nTourTour, horaire, dateScellementUrnes, debut, fin, etatAvancement, avancementTour, categories, categoriesRepresentees,
            dateDebutDepotListe, dateMaxDepotListe, remoteInfo, libelle, delaiCloseScrutin, demo, mDPSize, mDPAlpha, idElection, identificationElecteurs
        },
        headersBureau {
                  headerCode, isActif, libelle, ordre, champ, colonneSize
        },
        bureau{
            bureau, idBureauBureau, collegial, etapeScellement, etapeDepouillement, idMembre, president, nom, prenoms, checkInGenerationKey, checkInScellement, checkInDepouillement, lastActionBureau, 
            idCollaborateur, cleScellement, cleScellementHoraire, cleDepouillement, cleDepouillementHoraire, mailProfessionnel, mailPersonnel, mobileProfessionnel, remoteInfo, modeTest, dateNaissance, age, idElection
        },
        headersUrnes {
          headerCode, isActif, libelle, ordre, champ, colonneSize
        },
        urnes{
            urne, idBureauUrne, modeTest, nTourUrne, etatUrne, dateEtat, accord, nbListes, nbVotants, nbNonVotants, etablissement, college, scrutinUrne, participation, emargement, bulletins, 
            coherenceVote, dateVote, lastActionUrne, blancs, nuls, pbBulletins, quorum, quorumAtteint, bureauMembresAction, nbScellement, nbDepouillement, vote, idUrne, idTour, idTourUrne, 
            hashDepouillement, remoteInfo, idElection
        },
    }
}
`

export const GetAdministrationScrutinPotentiel = () => `
query GetAdministrationScrutinPotentiel($page : Int!, $pageSize : Int!) {
    administrationScrutinPotentiel(page:$page, pageSize:$pageSize) {
        scrutinsPotentiels {
            date, planning, electionsPotentielles, elections, electeursPotentiels, electeursPrevus, electeursConnectes, percentage, demandesDeCode
        },
        headers {
          headerCode, isActif, libelle, ordre, champ, colonneSize
        },
        page, pageSize, count
    }
}
`

export const GetAdministrationScrutinMB = () => `
query GetAdministrationScrutinMB($recherche: String!, $filtreCode : Int!, $page : Int!, $pageSize : Int!) { 
  administrationScrutinMB(recherche:$recherche, filtreCode:$filtreCode, page:$page, pageSize:$pageSize) {
    scrutinsMB {
      idElection, companyName, date1erTour, date2emeTour, nbSalaries, avancementScrutin, avancement, avancement1erTour, avancement2ndTour,
      contactsMB { name, firstName, mail, telephone },
      statut { code, libelle },
      typeScrutin { code, libelleMini },
      buttons
    },
    headers {
      headerCode, isActif, libelle, ordre, champ, colonneSize
    },  
    buttons { 
      code, libelle 
    },
    page, pageSize, filtreCode, count, recherche
  }
}
`

export const GetEtapesPhase = () => `
query GetEtapesPhase($idElection: Int! , $phase: Int!)
{
  etapesPhase(idElection:$idElection, phase:$phase)
  {
    companyName, companyLogo, libelle, description,

    guides {
      libelle, route, actif, codeCouleur
      parametres {key, value}
    }
    etapes{
      libelle, disabled
      statut{code, libelle},
      aide{titre, description, htmlContent},
      bouton{
        libelle, route, actif, libelleForDownload, codeCouleur
        parametres{key, value}
        aide{titre, description, htmlContent}
      }
      invisibleFormId
      formsStatus{ formId, warning}
    }

    boutons {
      libelle, route, actif, parametres {key, value}, libelleForDownload, codeCouleur
      aide{titre, description, htmlContent}
    }

    bandeaux{
      titre, description, thin,
      type{code, libelle},
      bouton{
        libelle, libelleForDownload, route, actif, codeCouleur,
        parametres{key, value}
        aide{titre, description, htmlContent}
      }
      boutons {
        libelle, route, actif, libelleForDownload, codeCouleur
        parametres {key, value}
        aide{titre, description, htmlContent}
      }
    }
  }
}
`;