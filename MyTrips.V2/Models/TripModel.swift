//
//  TripModel.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 2.04.21.
//

import Foundation
import Firebase


struct TripModel {

    let ref: DatabaseReference?
     let userID: String?
    let countryName: String
    let countryImageURL: String?
    let costs: Int
    let date: String
    
    init(countryName: String,  costs: Int, countryImageURL: String?, date: String, userID: String?) {
       
        self.countryName = countryName
        self.countryImageURL = countryImageURL
        self.costs = costs
        self.date = date
        self.ref = nil
        self.userID = userID
    }
    
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        countryName = snapshotValue["countryName"] as! String
        countryImageURL = snapshotValue["countryImageURL"] as? String
        costs = snapshotValue["costs"] as! Int
        date = snapshotValue["date"] as! String
        userID = snapshotValue["userID"] as! String
        ref = snapshot.ref

    }
    func  convertToDictionary() -> Any {
        return ["countryName": countryName, "countryImageURL": countryImageURL, "costs": costs, "date": date, "userID": userID]
    }

}
