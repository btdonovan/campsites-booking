import React from 'react'
import LodgTypeSelection from './LodgTypeSelection'
import LodgingSelection from './LodgingSelection'
import SiteSelection from './SiteSelection'

//Displays all of the campground list items contained in a single route
class RouteCampgrounds extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            currentDay: props.currentDay,
            selectedRoute: props.selectedRoute,
            lodging: [],
            rooms: [],
        }
        this.fetchLodgings = this.fetchLodgings.bind(this)
        this.handleLodgTypeSelectionChange = this.handleLodgTypeSelectionChange.bind(this)
        this.handleLodgingSelectionChange = this.handleLodgingSelectionChange.bind(this)
        this.handleSiteSelectionChange = this.handleSiteSelectionChange.bind(this)
    }

    fetchLodgings(id, day, type) {
        fetch(`http://localhost:3001/lodging/${id}/${day}/${type}`)
          .then((response) => response.json())
          .then((json) => { this.setState({ lodging: json }) })
      }

    fetchRooms(lodgingid, date) {
        fetch(`http://localhost:3001/sites/${lodgingid}/${date}`)
            .then((response) => response.json())
            .then((json) => { this.setState({ rooms: json }) })
    }

    async handleLodgTypeSelectionChange(e) {
        await this.setState({ lodgingType: e.target.value }, () => {
            this.fetchLodgings(this.state.selectedRoute.routeid, this.state.currentDay, this.state.lodgingType)
        })
    }

    async handleLodgingSelectionChange(e) {
        await this.setState({ lodgingSelection: e.target.value }, () => {
            this.fetchRooms(this.state.lodgingSelection, this.state.currentDay)
        })
    }

    async handleSiteSelectionChange(e) {
        await this.setState({ siteSelection: e.target.value })
    }
    render() {
        if (this.state.selectedRoute !== undefined) {
            return (
                <div>
                    <div className="card">
                        <h2 className="card-header">Day {this.state.currentDay}</h2>
                        <div className="card-body">
                            <LodgTypeSelection selectedRoute={this.state.selectedRoute} onChange={this.handleLodgTypeSelectionChange} 
                                currentDay={this.state.currentDay}/>
                            <br />
                            <LodgingSelection onChange={this.handleLodgingSelectionChange} fetchLodgings={this.fetchLodgings} 
                              lodging={this.state.lodging} selectedRoute={this.props.selectedRoute} currentDay={this.props.currentDay}
                                  lodgingType={this.state.lodgingType}
                              />
                            <br />
                            <SiteSelection onChange={this.handleSiteSelectionChange} fetchRooms={this.fetchRooms} 
                                rooms={this.state.rooms} lodgingSelection={this.state.lodgingSelection} currentDay={this.state.currentDay} date={this.props.date}/>
                            <br />
                            {/* --BUTTON TO CONFIRM THAT ROOM/SITE, THEN DISPLAY THE 'SUBMITTED' CARD */}
                            <button type="button" className="btn btn-primary" onClick={this.props.onOKClick(this.state.lodgingType, this.state.lodgingSelection, this.state.siteSelection)}>OK</button>
                        </div>
                    </div>
                    <div className="card" hidden>
                        <h2 className="card-header">Day {this.state.currentDay}</h2>
                        <div className="card-body">
                            <h1 className="card-title">SITE NAME HERE</h1>
                            <h2 className="card-subtitle mb-3 text-muted">PRICE HERE</h2>
                            <p className="card-text">SITE DESCRIPTION HERE</p>
                            <p className="card-text text-muted">AVAILABLE? HERE</p>
                        </div>
                    </div>
                </div>
            )
        } else {
            return (
                <div></div>
            )
        }
    }
}

export default RouteCampgrounds