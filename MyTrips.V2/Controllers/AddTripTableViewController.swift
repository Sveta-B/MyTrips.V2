//
//  AddTripTableViewController.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 26.04.21.
//

import UIKit

class AddTripTableViewController: UITableViewController {
    //TODO:  поработать над ячейками стоимости,не считает стоимость, сохранить данные в базу данных
    
    //MARK: - Properties
    let datePicker = UIDatePicker()
    var imageIsChanged = false {
        willSet {
            defaultPhoto.isHidden = true
            defaultLabelForPhoto.isHidden = true
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView! 
    @IBOutlet weak var countryTextField: CustomTextField!
    @IBOutlet weak var startDateTextField: CustomTextField!
    @IBOutlet weak var finishDateTextField: CustomTextField!
    @IBOutlet weak var costTicketsTextField: CustomTextField!
    @IBOutlet weak var costsFoodTextField: CustomTextField!
    @IBOutlet weak var costsLivingTextField: CustomTextField!
    @IBOutlet weak var totalCostsTextField: CustomTextField!
    @IBOutlet weak var defaultPhoto: UIImageView!
    @IBOutlet weak var defaultLabelForPhoto: UILabel!
    @IBOutlet weak var customViewForPhoto: UIView!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //totalCostsTextField.isEnabled = false
        totalCostsTextField.text = countTotalCosts()
        totalCostsTextField.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        costTicketsTextField.delegate = self
        costsLivingTextField.delegate = self
        costsFoodTextField.delegate = self
        doneButton.isEnabled = false
        countryTextField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        tableView.delegate = self
        tableView.dataSource = self
        createDatePicker(startDateTextField)
        createDatePicker(finishDateTextField)
        setupCustomView(view: customViewForPhoto)
    }
    
    //MARK: - IBActions
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
       dismiss(animated: true)
    }
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
    }
    
    // MARK : Table view delegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
        let titleForSection = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.bounds.size.width, height: 44))
        headerView.addSubview(titleForSection)
        headerView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        switch section {
        case 0:
            titleForSection.text = "Photo"
        case 1:
            titleForSection.text = "Information"
        case 2:
            titleForSection.text = "Costs"
        default:
            titleForSection.text = "No section"
        }
        return headerView
    }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            if indexPath.section == 0 {
                
                let cameraIcon = #imageLiteral(resourceName: "camera")
                let photoIcon = #imageLiteral(resourceName: "usb")
                
                let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                
                let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                    self.chooseImagePicker(source: .camera)
                }
                camera.setValue(cameraIcon, forKey: "image")
                camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
                
                let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                    self.chooseImagePicker(source: .photoLibrary)
                }
                photo.setValue(photoIcon, forKey: "image")
                photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
                
                let cancel = UIAlertAction(title: "Cancel", style: .cancel)
                
                actionSheet.addAction(camera)
                actionSheet.addAction(photo)
                actionSheet.addAction(cancel)
                
                present(actionSheet, animated:  true)
                
            }  else  {
                view.endEditing(true)
            }
        }
    
    func setupCustomView(view: UIView) {
        view.layer.cornerRadius =  10
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }
}

extension AddTripTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @objc private func textFieldChange() {
        if countryTextField.text?.isEmpty == false{
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
    
    func countTotalCosts() -> String {
        var text = "$"
        var travelCosts = 0.0
            var livingCosts = 0.0
            var foodCosts = 0.0
            var totalCosts = 0.0
        func textFieldDidBeginEditing(_ textField: UITextField) {
            travelCosts = Double(costTicketsTextField.text!) ?? 0.0
               livingCosts = Double(costsLivingTextField.text!) ?? 0.0
               foodCosts = Double(costsFoodTextField.text!) ?? 0.0
               totalCosts = travelCosts + livingCosts + foodCosts
            
           }
           func textFieldShouldReturn(_ textField: UITextField) -> Bool {
               travelCosts = Double(costTicketsTextField.text!) ?? 0.0
               livingCosts = Double(costsLivingTextField.text!) ?? 0.0
               foodCosts = Double(costsFoodTextField.text!) ?? 0.0
               totalCosts = travelCosts + livingCosts + foodCosts
               totalCostsTextField.text =  "\(totalCosts) $"
               return true
           }
        text = "  \(totalCosts) $"
           return text
    }
}



