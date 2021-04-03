//
//  TripsViewController.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 31.03.21.
//

import UIKit

class TripsViewController: UIViewController {
    
    let trips = [TripModel(countryName: "Spain", costs: 1000, countryImageURL: "", date: "march", userID: nil)]

    @IBOutlet weak var tripsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripsTable.delegate = self
        tripsTable.dataSource = self
        tripsTable.tableFooterView = UIView()
        tripsTable.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: "TripTableViewCell")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TripsViewController: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return trips.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "TripTableViewCell", for: indexPath) as! TripTableViewCell
    let trip = trips[indexPath.row]
    cell.countryLabel.text = trip.countryName
    cell.dateLabel.text = trip.date
    cell.costsLabel.text = String(trip.costs)
    return cell
}


}

