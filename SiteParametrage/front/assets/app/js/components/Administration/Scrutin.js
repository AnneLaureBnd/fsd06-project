import { isArray } from "jquery";
import PropTypes from "prop-types";
import React, { Component, Fragment } from "react";
import { Redirect } from "react-router-dom";
import api from "../../Api";
import { GetAdministrationScrutin, SetAdminButtonAction, GetAdministrationContact, GetAdministrationSupport, GetAdministrationScrutinPotentiel, GetAdministrationScrutinMB } from '../../queries';
import Pagination from "../Pagination";
import SearchFormInList from "../SearchFormInList";
import Spinner from "../Spinner";
import Button from "../Button";
import Tooltip from "../Tooltip";
import Popin from "../Popin";
import DeleteObject from "../DeleteObject";
import GetFileDirectDownload from "../GetFileDirectDownload";
import Support from "./Support";

class Scrutin extends Component {

    state = {
        activeAction: null,
        buttonCodeToChange: null,
        callbackConfirm: null,
        company: null,
        companyToChange: null,
        currentPage: 1,
        curStepId: null,
        error: null,
        errorFilter: 0,
        headerType: null,
        headerTypeToChange: null,
        idElection: null,
        idElectionToChange: null,
        listTypeId: null,
        loading: false,        
        objectAddLabel: null,
        objectAddLabel1: null,
        openPopinChange: false,
        openPopinConfirmDelete: false,
        openPopinConfirmPhase: false,
        openPopinConfirmSupport: false,
        openTooltipExcel: false,
        pageSize: 10,
        recherche: "",
        redirectToElection: false,
        scrutin: null,
        scrutinToChange: null,
        scrutinToDelete: null,
        support: null,
        title: null,        
        totalCount: 0
    }

    static propTypes = {
        curStepId: PropTypes.string,
        dictionary: PropTypes.func,
        electionId: PropTypes.number,
        token: PropTypes.string
    };

    constructor(props) {
        super(props);
        this.addClass = this.addClass.bind(this);
        this.executeAction = this.executeAction.bind(this);
        this.handleChangePage = this.handleChangePage.bind(this);
        this.handleChangePhase = this.handleChangePhase.bind(this);
        this.handleChangePopinState = this.handleChangePopinState.bind(this);
        this.handleDeleteScrutin = this.handleDeleteScrutin.bind(this);
        this.handleRedirectToScrutin = this.handleRedirectToScrutin.bind(this);
        this.handleRefreshSupportLigne = this.handleRefreshSupportLigne.bind(this);
        this.handleReloadOnSuccess = this.handleReloadOnSuccess.bind(this);
        this.handleSearchInList = this.handleSearchInList.bind(this);
    }

    handleChangePopinState() {
        this.setState({
            openPopinConfirmSupport : false
        })
    }

    handleChangePage(page) {
        this.setState({
            currentPage: page
        },
        () => this.chargeData());
    }

    handleRedirectToScrutin(idElection) {
        this.setState({
            redirectToElection: true,
            idElection: idElection
        });
    }

    setMutation() {
        const params = {
            buttonCode: this.state.buttonCodeToChange,
            idElection: this.state.idElectionToChange,
            headerType: this.state.headerTypeToChange
        };
        const queryPhase = SetAdminButtonAction(params.buttonCode, params.idElection, params.headerType);
        return api.execute("SetAdminButtonAction", {
            id: this.props.token,
            query: queryPhase,
            variables: JSON.stringify(params),
        }).then((json) => {
            this.setState({
                openPopinConfirmPhase: false,
                scrutinToChange: null,
                activeAction: null
            },
            () => this.chargeData())
        }).catch((err) => {
            return this.setState({ error: true, loading: false, activeAction: null })
        });
    }

    handleChangePhase(buttonCode, idElection, scrutin, headerType, company) {
        switch (this.props.curStepId) {
            case "ADMIN_SCRUTINS":
                this.setState({
                    scrutinToChange: scrutin,
                    openPopinConfirmPhase: true,
                    buttonCodeToChange: buttonCode,
                    idElectionToChange: idElection,
                    headerTypeToChange: headerType,
                    callbackConfirm: () => this.setMutation()
                })
                break;
            case "ADMIN_SUPPORTS":
                this.setState({
                    activeAction: buttonCode,
                    scrutinToChange: scrutin,
                    buttonCodeToChange: buttonCode,
                    idElectionToChange: idElection,
                    companyToChange: company,
                    headerTypeToChange: headerType,
                    callbackConfirm: () => this.setMutation(),
                    openPopinConfirmSupport: true,
                    activeAction: null
                })
                break;
            case "ADMIN_SCRUTINS_MB":
                this.setState({
                    scrutinToChange: scrutin,
                    openPopinConfirmPhase: true,
                    buttonCodeToChange: buttonCode,
                    idElectionToChange: idElection,
                    headerTypeToChange: headerType,
                    callbackConfirm: () => this.setMutation()
                })
                break;
        }
    }

    handleRefreshSupportLigne(buttonCode, idElection, scrutin, headerType) {
        switch (this.props.curStepId) {
            case "ADMIN_SUPPORTS":
                this.setState({
                    activeAction: buttonCode,
                    scrutinToChange: scrutin,
                    buttonCodeToChange: buttonCode,
                    idElectionToChange: idElection,
                    headerTypeToChange: headerType,
                    openTooltipMenuAdd: false
                }, this.setMutation);
                break;
        }
    }

    handleReloadOnSuccess() {
        this.chargeData();
    }

    handleDeleteScrutin(scrutin) {
        this.setState({
            openPopinConfirmDelete: true,
            scrutinToDelete: scrutin
        });
    }

    handleRefreshSupport(support) {
        this.chargeData(support);
    }

    componentDidMount() {
        this.initParams(this.props);
        this.chargeData();
    }

    componentDidUpdate(prevProps, prevState) {
        if (this.state.curStepId !== this.props.curStepId) {
            this.initParams(this.props);
            this.chargeData();
        }
    }

    handleSearchInList(searchTerm) {
        this.setState({ recherche: searchTerm, errorFilter: null }, () =>
            this.chargeData()
        );
    }

    chargeData() {
        this.setState({
            loading: true
        })
        switch (this.props.curStepId) {
            case "ADMIN_SCRUTINS":
                const queryScrutin = GetAdministrationScrutin();
                const variablesScrutin = {
                    recherche: this.state.recherche,
                    page: this.state.currentPage,
                    pageSize: this.state.pageSize,
                    filtreCode: this.props.filtreCode
                }
                api.execute(null, {
                    id: this.props.token,
                    query : queryScrutin,
                    variables: JSON.stringify(variablesScrutin)
                }).then(json => {
                    this.setState({
                        data: json.data.administrationScrutin.scrutins,
                        headers: json.data.administrationScrutin.headers,
                        buttons: json.data.administrationScrutin.buttons,
                        loading: false,
                        error: false,
                        totalCount: json.data.administrationScrutin.count,
                        page: json.data.administrationScrutin.page,
                        pageSize: json.data.administrationScrutin.pageSize,
                        recherche: json.data.administrationScrutin.recherche
                    });
                }).catch((err) => {
                    return this.setState({ error: true, loading: false })
                });
                break;
            case "ADMIN_CONTACTS":
                const queryContacts = GetAdministrationContact();
                const variablesContacts = {
                    recherche: this.state.recherche,
                    page: this.state.currentPage,
                    pageSize: this.state.pageSize,
                    filtreCode: this.props.filtreCode
                }
                api.execute(null, {
                    id: this.props.token,
                    query : queryContacts,
                    variables: JSON.stringify(variablesContacts)
                }).then(json => {
                    this.setState({
                        data: json.data.administrationContact.contacts,
                        headers: json.data.administrationContact.headers,
                        excelButtons: json.data.administrationContact.excelButtons,
                        loading: false,
                        error: false,
                        totalCount: json.data.administrationContact.count,
                        page: json.data.administrationContact.page,
                        pageSize: json.data.administrationContact.pageSize,
                        recherche: json.data.administrationContact.recherche
                    });
                }).catch((err) => {
                    return this.setState({ error: true, loading: false })
                });
                break;
            case "ADMIN_SUPPORTS":
                const querySupport = GetAdministrationSupport();
                const variablesSupport = {
                    recherche: this.state.recherche,
                    page: this.state.currentPage,
                    pageSize: this.state.pageSize,
                    filtreCode: this.props.filtreCode,                  
                }
                api.execute(null, {
                    id: this.props.token,
                    query: querySupport,
                    variables: JSON.stringify(variablesSupport)
                }).then(json => {
                    this.setState({
                        data: json.data.administrationSupport.supports,
                        headers: json.data.administrationSupport.headers,
                        buttons: json.data.administrationSupport.buttons,
                        loading: false,
                        error: false,
                        recherche: json.data.administrationSupport.recherche,
                        page: json.data.administrationSupport.page,
                        pageSize: json.data.administrationSupport.pageSize,
                        totalCount: json.data.administrationSupport.count
                    });
                }).catch((err) => {
                    return this.setState({ error: true, loading: false })
                });
                break;
            case "ADMIN_SCRUTINS_POTENTIELS":
                const queryScrutinPotentiel = GetAdministrationScrutinPotentiel();
                const variablesScrutinsPotentiels = {
                    page: this.state.currentPage,
                    pageSize: this.state.pageSize
                }
                api.execute(null, {
                    id: this.props.token,
                    query: queryScrutinPotentiel,
                    variables: JSON.stringify(variablesScrutinsPotentiels)
                }).then(json => {
                    this.setState({
                        data: json.data.administrationScrutinPotentiel.scrutinsPotentiels,
                        headers: json.data.administrationScrutinPotentiel.headers,
                        loading: false,
                        error: false,
                        totalCount: json.data.administrationScrutinPotentiel.count,
                        page: json.data.administrationScrutinPotentiel.page,
                        pageSize: json.data.administrationScrutinPotentiel.pageSize,                       
                    });
                }).catch((err) => {
                    return this.setState({ error: true, loading: false })
                });
                break;
            case "ADMIN_SCRUTINS_MB":
                const queryScrutinMB = GetAdministrationScrutinMB();
                const variablesScrutinMB = {
                    recherche: this.state.recherche,
                    page: this.state.currentPage,
                    pageSize: this.state.pageSize,
                    filtreCode: this.props.filtreCode
                }
                api.execute(null, {
                    id: this.props.token,
                    query: queryScrutinMB,
                    variables: JSON.stringify(variablesScrutinMB)
                }).then(json => {
                    this.setState({
                        data: json.data.administrationScrutinMB.scrutinsMB,
                        headers: json.data.administrationScrutinMB.headers,
                        buttons: json.data.administrationScrutinMB.buttons,
                        loading: false,
                        error: false,
                        totalCount: json.data.administrationScrutinMB.count,
                        page: json.data.administrationScrutinMB.page,
                        pageSize: json.data.administrationScrutinMB.pageSize,
                        recherche: json.data.administrationScrutinMB.recherche
                    });
                }).catch((err) => {
                    return this.setState({ error: true, loading: false })
                });
                break;
        }
    }

    initParams(listTypeId) {
        switch (this.props.curStepId) {           
            case "ADMIN_SCRUTINS":
            case "ADMIN_SUPPORTS":
            case "ADMIN_SCRUTINS_MB":
                this.setState({
                    currentPage: 1,
                    curStepId: this.props.curStepId,
                    objectAddLabel: this.props.dictionary("ADMINISTRATION_SCRUTIN_LIST_LABEL"),
                    objectAddLabel1: this.props.dictionary("ADMINISTRATION_SCRUTIN_LIST_LABEL_1"),
                    title: this.props.dictionary("ADMINISTRATION_SCRUTIN_CONTAINER_TITLE")
                });
                break;
            case "ADMIN_CONTACTS":
                this.setState({
                    currentPage: 1,
                    curStepId: this.props.curStepId,
                    objectAddLabel: this.props.dictionary("ADMINISTRATION_CONTACT_LIST_LABEL"),
                    objectAddLabel1: this.props.dictionary("ADMINISTRATION_CONTACT_LIST_LABEL_1"),
                    title: this.props.dictionary("ADMINISTRATION_CONTACT_CONTAINER_TITLE")
                });
                break;
            case "ADMIN_SCRUTINS_POTENTIELS":
                this.setState({
                    currentPage: 1,
                    curStepId: this.props.curStepId,
                    objectAddLabel: this.props.dictionary("ADMINISTRATION_SCRUTIN_POTENTIEL_LIST_LABEL"),
                    objectAddLabel1: this.props.dictionary("ADMINISTRATION_SCRUTIN_POTENTIEL_LIST_LABEL_1"),
                    title: this.props.dictionary("ADMINISTRATION_SCRUTIN_POTENTIEL_CONTAINER_TITLE")
                });
                break;
        }
    }

    addClass(header) {
        switch (header.colonneSize) {
            case 1:
                return 'Texte';
            case 2:
                return 'TexteMini';
            case 3:
                return 'Date';
            case 4:
                return 'DateTime';
            case 5:
                return 'Email';
            case 6:
                return 'Lien';
        }
    }

    renderTitleForm() {
        return (
            <div className="PapList-header">
                <h3 className="PapList-title">
                    {this.state.title}
                </h3>
            </div>
        )
    }

    renderMenu() {
        const objSize = this.state.data ? this.state.totalCount : 0;
        const shapeActiveAdd = this.state.openTooltipExcel ? "shape-active" : null;
        let buttonsListLabel = this.props.dictionary("ADMIN_DOWNLOAD_BUTTON_LABEL");
        let toolTipTab = [];

        this.state.excelButtons ? (this.state.excelButtons.map((btn, i) => {
            toolTipTab.push(this.renderExcelButton(btn, i));
        }            
        )) : null;

        return (
            <div className="PapList-menu">
                <p className="PapList-size">
                    <strong>{objSize}</strong> {objSize <= 1 ? this.state.objectAddLabel1 : this.state.objectAddLabel}
                </p>
                <SearchFormInList searchTerm={this.state.recherche} searchFunc={this.handleSearchInList} aide={this.state.recherche ? this.state.recherche.aide : null} />
                { this.state.excelButtons 
                    && toolTipTab.length == 1 ? (toolTipTab[0].node) : this.state.excelButtons && toolTipTab.length > 0 ?
                            (<div className="ElectorList-menu--add">
                                <Button
                                    type="button"
                                    btnClassName="Add narrow Admin-Dl"
                                    onClick={() => {
                                        this.state.openTooltipExcel = this.state.openTooltipExcel ? !this.state.openTooltipExcel : true;
                                        this.setState(this.state);
                                    }
                                    }
                                >
                                    <span>{buttonsListLabel}</span>
                                    <span className={"shape shape-triangle " + shapeActiveAdd} />
                                </Button>
                                {this.state.openTooltipExcel ? <Tooltip toolsList={toolTipTab} className="ElectorList-ToolTip--Menu" /> : null}
                            </div>)
                            : null
                    }                    
            </div>
        )
    }

    renderExcelButton(btn, i) {
        return ({
            id: i,
            node: (<GetFileDirectDownload
                        key={i}
                        token={this.props.token}
                        downloadLabel={btn.libelle}
                        buttonType="button"
                        className="Button--Export"
                        categorie={30}
                        idPrincipal={btn.code}
                   />)
        })
    }

    renderHeader() {
        if (!this.state.headers) {
            return null;
        }
        const header = this.state.headers.filter(h => h.isActif).map(
            (headerElement, i) => //liste d'éléments
            {
                const hd =  this.addClass(headerElement);
                return (
                    <div className={`ObjectList-head Admin-col Admin-col-${hd}`} key={i} >
                        {headerElement.libelle}
                    </div>
                )
            }
        )
        return (
            <div className="PapList-list ObjectList-row Head">{header}</div>
        )
    }

    getValueFromHeader(header, element) {
        let firstSplittedHeader = header.champ.split(',');
        let map = firstSplittedHeader.map((toto, p) => {
            let splittedHeader = firstSplittedHeader[p].split('.');
            for (let m = 0; m < splittedHeader.length; m++) {
                let value = element[splittedHeader[m]];
                if (isArray(value)) {
                    let values = value.map(val => {
                        return val[splittedHeader[m + 1]];
                    });
                    return (<p key={p}>{values.join(' ')}</p>)
                }
                else {
                    for (let i = 1; i < splittedHeader.length; i++) {
                        return value = value[splittedHeader[i]];
                    }
                }
                return value;
            }
        })
        return map;
    }

    executeAction(buttonCode, element) {
        switch (this.props.curStepId) {
            case "ADMIN_SCRUTINS":
            case "ADMIN_SCRUTINS_MB":
                switch (buttonCode) {
                    // Link to the settings site
                    case "0":
                        this.handleRedirectToScrutin(element.idElection);
                        break;
                    // Shorten the 3d delay
                    case "1":
                    // Return to 1st phase
                    case "2":
                    // Change 1st round date if it falls on a Sunday
                    case "4":
                    // Change 2nd round date if it falls on a Sunday
                    case "5":
                    // Reduce eligibility to 6 months
                    case "6":
                    // Reduce eligibility to 3 months
                    case "7":
                    // If V.B : switch to non-college mode
                    case "8":
                        this.handleChangePhase(buttonCode, element.idElection, element, 1,null);
                        break;
                    // Delete
                    case "3":
                        this.handleDeleteScrutin(element);
                        break;
                    default:
                        return
                }
                break;
            case "ADMIN_SUPPORTS":
                switch (buttonCode) {
                    // Refresh
                    case "0":
                        this.handleRefreshSupportLigne(buttonCode, element.idElection, element, 3, element.company);
                        break;
                    // Pop up with complete informations
                    case "1":
                        this.handleChangePhase(buttonCode, element.idElection, element, 3, element.company);
                        break;
                    // Link to setting website
                    case "2":
                        this.handleRedirectToScrutin(element.idElection);
                        break;
                    default:
                        return
                }
                break;
            default:
                return;
        }
    }

    renderButtons(btn, i, element, count) {
        const button = this.state.buttons.find(el => el.code === btn);
        if (button) {
            const classe = count == 1 ? "primary" : "narrow";
            return ({
                id: i,
                node: (<Button
                        type="button"
                        btnClassName={"Add " + classe}
                        loading={btn === this.state.activeAction}
                        onClick={() => {
                            this.executeAction(button.code, element);
                            }
                        }
                        >
                            <span className="Admin-Button-Span">{button.libelle}</span>
                        </Button>)
            })
        }
    }

    renderListObject() {
        if (this.state.data && this.state.headers) {     
            // Datas
            const headers = this.state.headers.filter(h => h.isActif);
            const warning = this.state.headers.find(h => h.headerCode === 13);
            const elements = this.state.data.map((element, i) => {
                const colonnes =  headers.map((header, k) => {
                    if (header.headerCode === 0) {
                        // Array
                        const tab = element.buttons.filter(btn => btn != "").map((btn, j) => {
                            return this.renderButtons(btn, j, element, element.buttons.length);
                        });
                        const shapeActiveAdd = this.state.openTooltipMenuAdd ? "shape-active" : null;
                        let buttonsListLabel = this.props.dictionary("ADMIN_BUTTON_SCRUTIN_TITLE_BUTTONS_LIST");
                        return (
                            tab.length == 1 ? (tab[0].node) :
                                tab.length > 0 ?
                                    (<div key={ k } className="ElectorList-menu--add">
                                        <Button
                                            type="button"
                                            btnClassName="Add narrow"
                                            onClick={() => {
                                                element.openTooltipMenuAdd = element.openTooltipMenuAdd ? !element.openTooltipMenuAdd : true;
                                                this.setState(this.state);
                                            }
                                            }
                                        >
                                            <span>{buttonsListLabel}</span>
                                            <span className={"shape shape-triangle " + shapeActiveAdd} />
                                        </Button>
                                        {element.openTooltipMenuAdd ? <Tooltip toolsList={tab} className="ElectorList-ToolTip--Menu" /> : null}
                                    </div>) : (<div key={k} className={"Button-fake"}></div>)
                        )
                    }
                    // Column size
                    else {
                        let classSize = this.addClass(header, element);
                        let value = this.getValueFromHeader(header, element);
                        if (classSize === 'Email') {
                            return (
                                <div className={`ObjectList-col Admin-col Admin-col-${classSize}`} key={k} >
                                    <a href={`mailto:${value}`}>{value}</a>
                                </div>
                            )
                        } else if (classSize === 'Lien') {
                            return (
                                <div className={`ObjectList-col Admin-col Admin-col-${classSize}`} key={k} >
                                    <a href={value}>{value}</a>
                                </div >
                            )
                        } else {
                            return (
                                <div className={`ObjectList-col Admin-col Admin-col-${classSize}`} key={k} >
                                    {value}
                                </div>
                            )
                        }     
                    }
                })

                // Background color / status
                let bgClass = "";
                if (warning) {
                    const stat = this.getValueFromHeader(warning, element);

                    if (stat == 'Warning') {
                        bgClass = ' ObjectList-row--warning';
                    }
                    else if (stat == 'Erreur') {
                        bgClass = ' ObjectList-row--error';
                    }
                    else if (stat == 'Information') {
                        bgClass = ' ObjectList-row--information';
                    }
                    else if (stat == 'Désactivé') {
                        bgClass = ' ObjectList-row--disabled'
                    }
                }
                return (
                    <div className={`PapList-list ObjectList-row${bgClass}`} key={i}>
                        {colonnes}
                    </div>
                )  
            })
            return (
                <Fragment>
                    {elements}
                </Fragment>
            ); 
        }
    }

    render() {
        return (
            <div
                className={`PapList ${this.state.loading ? "SpinnerContainer" : ""}`}
            >
                {this.state.loading ? (
                    <div className="overlay-spinner">
                        <Spinner />
                    </div>
                ) : null}
                <div className="layout-panel PapList-panel Admin-Scrutin">
                    {this.renderTitleForm()}
                    {this.renderMenu()}
                    <div className="Admin-renderHeader-renderListObject">
                        {this.renderHeader()}
                        {this.renderListObject()}
                    </div>
                    <Pagination
                        itemsTotal={this.state.totalCount}
                        itemPerPage={this.state.pageSize}
                        curPage={this.state.currentPage}
                        changePage={this.handleChangePage}
                    />
                </div>
                { this.state.openPopinConfirmDelete &&
                    <DeleteObject
                        token={this.props.token}
                        objectType="Election"
                        objectId1={this.state.scrutinToDelete.idElection}
                        closePopin={() =>
                            this.setState({ openPopinConfirmDelete: false })
                        }
                        reloadObject={this.handleReloadOnSuccess}
                        messageConfirmation={`Êtes-vous sûr de vouloir supprimer l'élection « ${this.state.scrutinToDelete.companyName
                            } - ${this.state.scrutinToDelete.idElection} » ? `}
                    />
                }
                { this.state.redirectToElection &&
                    <Redirect
                        to={`/election/dashboard/${this.state.idElection}`}
                    />
                }
                { this.state.openPopinConfirmPhase &&
                    <Popin
                        type="confirmation"
                        closePopin={() =>
                            this.setState({ openPopinConfirmPhase: false, openPopinChange: true })
                        }
                        funcValidate={() =>
                            this.state.callbackConfirm()
                        }
                        message={
                            `Êtes-vous sûr de vouloir modifier le scrutin ${this.state.scrutinToChange.idElection} ?`
                        }
                        />
                }
                {this.state.openPopinConfirmSupport &&
                    
                    <Support
                        token={this.props.token}
                        dictionary={this.props.dictionary}
                        idElection={this.state.idElectionToChange}
                        company={this.state.companyToChange}
                        openPopinConfirmSupport={this.state.openPopinConfirmSupport}
                        sendData={this.handleChangePopinState}
                    />
                }
            </div>
        )
    }
}

export default Scrutin;