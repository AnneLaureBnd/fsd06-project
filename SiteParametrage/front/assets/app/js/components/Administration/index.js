import React, { Component } from "react";
import PropTypes from "prop-types";
import { Redirect } from "react-router-dom";
import { routes } from "../../routes";
import { setMenuActived } from "../../actions";
import { connect } from "react-redux";
import api from "../../Api";
import Button from "../Button";
import Spinner from "../Spinner";
import dictionary from "../../utils/dictionary";
import { GetAdministrationPhase } from '../../queries';
import PapStep from "../PapStep";
import Scrutin from "./Scrutin";

class Admin extends Component {
    state = {
        loading: false,
        stepsPap: null,
        buttonsPap: null,
        curStepId: null,
        objectSup: null,
        error: null,
        phaseId: null,
        toRefreshList: false,
        recherche: "",
        filtreCode: 0,
        currentPage: 1,
        page: 1,
        menu: null
        
    }

    static propTypes = {
        token: PropTypes.string,
        match: PropTypes.object,
        user: PropTypes.object,
        setMenuActived: PropTypes.func,
        dictionary: PropTypes.func,
        setElection: PropTypes.func,
    };

    static defaultProps = {};

    constructor(props) {
        super(props);
        this.handleOnClickStep = this.handleOnClickStep.bind(this);
        this.reloadSteps = this.reloadSteps.bind(this);
        this.clickBurger = this.clickBurger.bind(this);
        this.handleCancelRefreshList = this.handleCancelRefreshList.bind(this);
    }

    getMenu() {
        if (this.props.match.params.menu) {
            return this.props.match.params.menu;
        }
        return null;
    }

    reloadSteps() {
        this.setState({
            stepsPap: null,
            buttonsPap: null,
            toRefreshList: false
        },
        () => this.getElectionProcess());
    }

    handleCancelRefreshList() {
        this.setState({
            toRefreshList: false
        });
    }

    handleOnClickStep(idStep, objectSup = null, params = []) {
        this.setState({
            curStepId: idStep,
            objectSup: objectSup
        });
    }

    getPhaseId() {
        if (this.props.match.params.phaseId) {
            return parseInt(this.props.match.params.phaseId, 10);
        }
        return null;
    }

    componentDidMount() {
        this.props.setMenuActived(routes.user_admin);
        this.chargeStep();
        this.getMenu();
    }

    componentWillUnmount() {
        this.props.setMenuActived(null);
    }

    initCurrentStep(steps) {
        if (this.state.curStepId) {
            return this.state.curStepId;
        }
        else if (this.props.match.params.menu) {
            const menuParam = this.props.match.params.menu;
            switch (menuParam) {
                case 'scrutins':
                    return 'ADMIN_SCRUTINS';
                case 'contacts':
                    return 'ADMIN_CONTACTS';
                case 'supports':
                    return 'ADMIN_SUPPORTS';
                case 'scrutinsMB':
                    return 'ADMIN_SCRUTINS_MB';
                default:
                    if (steps[0]) {
                        return steps[0].bouton.route;
                    }
                    else {
                        return null;
                    }
            }
        }
        else if (steps[0]) {
            return steps[0].bouton.route;
        }
        else {
            return null;
        }
    }

    chargeStep() {
        const query = GetAdministrationPhase();

        api.execute(null, {
            id: this.props.token,
            query
        }).then(json => {
            this.setState({
                stepsPap: json.data.administrationPhase.etapes,
                buttonsPap: json.data.administrationPhase.boutons,
                curStepId: this.initCurrentStep(
                    json.data.administrationPhase.etapes
                ),
                loading: false,
                error: false,
            });
            this.switchStepPanel(this.state.curStepId);
        }).catch((err) => {
            return this.setState({ error: true, loading: false })
        });
        this.getMenu();
    }

    switchStepPanel(StepId) {

    }

    clickBurger() {
        this.setState({
            visibleMenu: !this.state.visibleMenu
        });
    }

    renderStepsPap() {
        if (this.state.stepsPap) {
            return this.state.stepsPap.map((step, key) => {
                step.id = step.bouton.route;
                return (
                    <PapStep
                        key={key}
                        step={step}
                        curStepId={this.state.curStepId}
                        onChangeStep={this.handleOnClickStep}
                        dictionary={this.props.dictionary}
                    />
                );
            });
        }
    }

    renderButtonsPap() {
        if (!this.state.buttonsPap) return null;
        return this.state.buttonsPap.map((button, key) => {
            const disabledClassName = !button.actif ? "Pap-buttons--disabled" : "";
            return null;
        });
    }

    renderButtonsPap() {
        if (!this.state.buttonsPap) return null;

        return this.state.buttonsPap.map((button, key) => {
            const disabledClassName = !button.actif ? "Pap-buttons--disabled" : "";
            let className = disabledClassName;
            if (button.codeCouleur == 5) className = `Pap-buttons--validPhase ${disabledClassName}`;
            //0 Success(rouge) | 1 primary(vert) | 2 secondary(blanc liseré vert) | 3 tertiary(gris foncé) |
            //4 narrow(gris clair) | 5 Primary + Validation(orange)
            let btnClassName = "tertiary";
            switch (button.codeCouleur) {
                case 0: btnClassName = "success"; break;
                case 1: btnClassName = "primary"; break;
                case 2: btnClassName = "secondary"; break;
                case 3: btnClassName = "tertiary"; break;
                case 4: btnClassName = "narrow"; break;
                case 5: btnClassName = "primary"; break;
            }

            const passUpFunc = () => {
                if (button.actif) {
                    return this.setState({
                        toValidPhase: true,
                        titlePopinValidation: button.libelle,
                    });
                }
                return null;
            };

            const retourListeElectorale = () => {
                if (button.actif) {
                    return this.setState({
                        toRetourPhase: true,
                        titlePopinValidation: button.libelle,
                    });
                }
                return null;
            }

            const CourrierSend = () => {
                if (button.actif) {
                    return this.setState({
                        toSendCourriers: true,
                        titlePopinValidation: button.libelle,
                    });
                }
                return null;
            }

            const prevenirBureau = () => {
                if (button.actif) {
                    this.notifyMembers();
                }
                return null;
            }

            const renvoiInvitationsAll = () => {
                if (button.actif) {
                    return this.setState({
                        toRenvoiInvitationsAll: true
                    });
                }
                return null;
            }

            if (
                ["PHASES_CAN_PASS_UP", "PREVENIR_MEMBRES_BUREAU", "PHASE2_RETOUR_MODIF_LISTE", "PHASE2_COURRIERS_SEND", "PHASES2_RENVOI_INVITATIONS_ALL"].indexOf(
                    button.route
                ) !== -1
            ) {
                let btnOnClick = null;
                switch (button.route) {
                    case "PHASES_CAN_PASS_UP": btnOnClick = passUpFunc; break;
                    case "PREVENIR_MEMBRES_BUREAU": btnOnClick = prevenirBureau; break;
                    case "PHASE2_RETOUR_MODIF_LISTE": btnOnClick = retourListeElectorale; break;
                    case "PHASE2_COURRIERS_SEND": btnOnClick = CourrierSend; break;
                    case "PHASES2_RENVOI_INVITATIONS_ALL": btnOnClick = renvoiInvitationsAll; break;
                }

                if (btnOnClick)
                    return (
                        <Button
                            key={key}
                            type="button"
                            onClick={() => btnOnClick()}
                            btnClassName={btnClassName}
                            className={className}
                            aide={button.aide}
                        >
                            <span>{button.libelle}</span>
                        </Button>
                    );
                else return null;
            }

            if ("PHASE1_SIMULATION" == button.route) {
                return (
                    <Button
                        key={key}
                        type="link"
                        to={routes.simulation_planning_show.path + "/" + button.parametres[0].value}
                        btnClassName={btnClassName}
                        className={className}
                        aide={button.aide}
                    >
                        <span>{button.libelle}</span>
                    </Button>
                );
            }

            if ("PHASE_DEMO" == button.route) {
                return (
                    <Button
                        key={key}
                        type="button"
                        btnClassName="Add narrow"
                        onClick={() => this.handleDemo(button)}
                        btnClassName={btnClassName}
                        className={className}
                        aide={button.aide}
                        loading={button.loading}
                    >
                        <span>{button.libelle}</span>
                    </Button>
                );
            }

            return (
                <GetFileDirectDownload
                    key={key}
                    token={this.props.token}
                    categorie={parseInt(button.parametres[1].value, 10)}
                    idPrincipal={this.state.electionId}
                    downloadLabel={button.libelleForDownload}
                    buttonType={btnClassName}
                    aide={button.aide}
                    disabled={!button.actif}
                    className={className}
                />
            )
        });
    }

    renderPanel() {
        return (
            <div className="Administration-container">
                <Scrutin
                    token={this.props.token}
                    dictionary={this.props.dictionary}
                    curStepId={this.state.curStepId}
                    recherche={this.state.recherche}
                    filtreCode={this.state.filtreCode}
                    page={this.state.page}
                />
            </div>)
    }

    render() {
        if (!this.props.user) {
            return <Redirect to={routes.sign_in.path} />;
        }

        return (
            <div className="Pap">
                <div className="Pap-header">
                    <div className="Pap-header-title">
                        <button className={"Navbar-burger" + (this.state.visibleMenu ? " Navbar-burger--active" : "")} onClick={this.clickBurger} />

                        <h1
                            className="Pap-title layout-title layout-title--alt"
                            dangerouslySetInnerHTML={{ __html: this.props.dictionary("USER_MENU_ADMINISTRATION") }}
                        />
                    </div>
                </div>

                <div className="Pap-container">
                    <div className={"Pap-container--left" + (this.state.visibleMenu ? " Pap-container--left-visible" : "")}>
                        {this.state.loading ? <Spinner /> : ""}

                        <div className="Pap-menu">{this.renderStepsPap()}</div>
                        <div className="Pap-buttons">{this.renderButtonsPap()}</div>
                    </div>
                    {this.renderPanel()}
                </div>
            </div>

        )
    }
}

const mapStateToProps = state => ({
    token: state.main.token,
    user: state.main.user,
    error: state.main.error,
    dictionary: dictionary(state.main.dictionary),
});

const mapDispatchToProps = dispatch => ({
    setMenuActived: menu => dispatch(setMenuActived(menu)),
});

export default connect(mapStateToProps, mapDispatchToProps)(Admin);
