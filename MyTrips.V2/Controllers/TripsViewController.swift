//
//  TripsViewController.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 31.03.21.
//

import UIKit

class TripsViewController: UIViewController {
    // MARK: - Properties
    let trips = [TripModel(countryName: "Spain", costs: 1000, countryImageURL: "", date: "march", userID: nil), TripModel(countryName: "Spain", costs: 1000, countryImageURL: "", date: "march", userID: nil), TripModel(countryName: "Spain", costs: 1000, countryImageURL: "", date: "march", userID: nil)]

    // MARK: - IBOutlets
    @IBOutlet weak var tripsTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripsTable.delegate = self
        tripsTable.dataSource = self
        tripsTable.showsVerticalScrollIndicator = false
        tripsTable.register(UINib(nibName: "TripsTableViewCell", bundle: nil), forCellReuseIdentifier: "TripsTableViewCell")
    }
}

// MARK: - TableViewDelegate, TableViewDataSource
extension TripsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        trips.count
    }
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hv = UIView()
        hv.backgroundColor = #colorLiteral(red: 0.8979505897, green: 0.8981012702, blue: 0.8979307413, alpha: 1)
        return hv
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let fv = UIView()
        fv.backgroundColor = #colorLiteral(red: 0.8979505897, green: 0.8981012702, blue: 0.8979307413, alpha: 1)
        return fv
    }
   
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "TripsTableViewCell", for: indexPath) as! TripsTableViewCell
    let trip = trips[indexPath.row]
    cell.countryLabel.text = trip.countryName
    cell.dateLabel.text = trip.date
    cell.costsLabel.text = String(trip.costs)

    
   
    return cell
}

}

