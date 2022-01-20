import { isArray } from "jquery";
import PropTypes from "prop-types";
import React, { Component, Fragment } from "react";
import api from "../../Api";
import { GetAdministrationAnalyseVote } from '../../queries';
import Button from "../Button";
import Tooltip from "../Tooltip";
import Popin from "../Popin";

class Support extends Component {
    state = {
        company: null,
        companyToChange: null,
        error: null,
        idElection: null,
        idElectionToChange: null,
        loading: false,
        openPopinConfirmSupport: true,
        sendData: true
    }

    static propTypes = {
        dictionary: PropTypes.func,
        electionId: PropTypes.number,
        token: PropTypes.string,
        idElection: PropTypes.number,
        openPopinConfirmSupport: PropTypes.bool,
        sendData: PropTypes.func,
        company: PropTypes.string
    };

    componentDidMount(idElection) {
        this.chargeData(idElection);
    }

    chargeData() {
        this.setState({
            idElection: this.props.idElection,
            company: this.props.company,
            loading: true
        })
        const query = GetAdministrationAnalyseVote();
        const variables = {
            idElection: this.props.idElection
        }

        api.execute(null, {
            id: this.props.token,
            query: query,
            variables: JSON.stringify(variables)
        }).then(json => {
            this.setState({
                headersTour: json.data.administrationSupportAnalyseVote.headersTour,
                tour: json.data.administrationSupportAnalyseVote.tour,
                headersBureau: json.data.administrationSupportAnalyseVote.headersBureau,
                bureau: json.data.administrationSupportAnalyseVote.bureau,
                headersUrnes: json.data.administrationSupportAnalyseVote.headersUrnes,
                urnes: json.data.administrationSupportAnalyseVote.urnes,
                loading: false,
                error: false
            });
        }).catch((err) => {
            return this.setState({ error: true, loading: false })
        });
    }

    refreshButton(idElection) {
        this.chargeData(idElection);
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
                return (
                    <p key={p}>{value}</p>
                );
            }
        })
        return map;
    }

    renderHeaderTour() {
        if (!this.state.headersTour) {
            return null;
        }
        const header = this.state.headersTour.filter(h => h.isActif).map(
            (headerElement, i) => //elements list
            {
                const hd = this.addClass(headerElement);
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
    
    renderListObjectTour() {
        if (this.state.tour && this.state.headersTour) {
            // Datas
            const headers = this.state.headersTour.filter(h => h.isActif);
            const elements = this.state.tour.map((element, i) => {
                const colonnes = headers.map((header, k) => {
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
                                    (<div key={k} className="ElectorList-menu--add">
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
                                    </div>) : null
                        )
                    }
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

                return (
                    <div className="PapList-list ObjectList-row" key={i}>
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

    renderHeaderBureau() {
        if (!this.state.headersBureau) {
            return null;
        }
        const header = this.state.headersBureau.filter(h => h.isActif).map(
            (headerElement, i) => // elements list
            {
                const hd = this.addClass(headerElement);
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

    renderListObjectBureau() {
        if (this.state.bureau && this.state.headersBureau) {
            // Datas
            const headers = this.state.headersBureau.filter(h => h.isActif);
            const elements = this.state.bureau.map((element, i) => {
                const colonnes = headers.map((header, k) => {
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
                                    (<div key={k} className="ElectorList-menu--add">
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
                                    </div>) : null
                        )
                    }
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

                let bgClass = "";

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

    renderHeaderUrnes() {
        if (!this.state.headersUrnes) {
            return null;
        }
        const header = this.state.headersUrnes.filter(h => h.isActif).map(
            (headerElement, i) => //elements list
            {
                const hd = this.addClass(headerElement);
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

    renderListObjectUrnes() {
        if (this.state.urnes && this.state.headersUrnes) {
            // Datas
            const headers = this.state.headersUrnes.filter(h => h.isActif);
            const elements = this.state.urnes.map((element, i) => {
                const colonnes = headers.map((header, k) => {
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
                                    (<div key={k} className="ElectorList-menu--add">
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
                                    </div>) : null
                        )
                    }
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

                let bgClass = "";

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

    renderPopin() {
        return (
            <div className="Popin-content-maxscreen">
                <h2>Election : {this.props.idElection}</h2>
                <h3>{this.props.company}</h3>
                <Button
                    type="button"
                    onClick={() => this.refreshButton()}
                >
                    <span className="Admin-Button-Span">{this.props.dictionary("GLOBAL_RAFRAICHIR")}</span>
                </Button>
                <div className="Admin-renderHeader-renderListObject">
                    {this.renderHeaderTour(this.props.idElection)}
                    {this.renderListObjectTour(this.props.idElection)}
                </div>
                <div className="Admin-renderHeader-renderListObject">
                    {this.renderHeaderBureau(this.props.idElection)}
                    {this.renderListObjectBureau(this.props.idElection)}
                </div>
                <div className="Admin-renderHeader-renderListObject">
                    {this.renderHeaderUrnes(this.props.idElection)}
                    {this.renderListObjectUrnes(this.props.idElection)}
                </div>
            </div>
        )
    }

    render() {
        return (
            <Popin
                closePopin={
                    () =>
                    this.setState({
                        openPopinConfirmSupport: false,
                        sendData: false
                    }),
                    this.props.sendData
                }
                loading={this.state.loading}
                className="Popin-content-large Admin-support-popin"
                message={null}
            >
                {this.renderPopin()}
            </Popin>
        )
    }
}

export default Support;