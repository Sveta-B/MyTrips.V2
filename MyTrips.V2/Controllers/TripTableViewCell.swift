//
//  TripTableViewCell.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 1.04.21.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewForTrip: UIImageView!

    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var costsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
