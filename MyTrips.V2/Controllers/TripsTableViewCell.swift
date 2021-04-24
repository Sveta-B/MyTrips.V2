//
//  TripsTableViewCell.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 19.04.21.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    @IBOutlet weak var modeView: UIView!
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var costsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        modeView.layer.cornerRadius = 10
       // modeView.clipsToBounds = true
        modeView.layer.masksToBounds = true
       
        dropShadow(view: modeView)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func dropShadow(view: UIView, shadowOpacity: Float = 0.5, shadowColor: CGColor = UIColor.gray.cgColor, shadowRadius: CGFloat = 5){
        view.layer.shadowColor = shadowColor
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = shadowRadius
    }
    
}
