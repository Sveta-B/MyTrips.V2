//
//  DataPicker .swift
//  MyTrips.V2
//
//  Created by Света Брасс on 14.05.21.
//

import UIKit

extension AddTripTableViewController {
public func createDatePicker(_ nameField: UITextField)  {
            
            var doneButton = UIBarButtonItem()
            if nameField == startDateTextField {
              doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedForDeparture))
            }
            else {
                 doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedForArrival))
            }
            
            let toolBur = UIToolbar()
            toolBur.sizeToFit()
            toolBur.setItems([doneButton], animated: true)
            nameField.inputAccessoryView = toolBur
            nameField.inputView = datePicker
    let today = Date()
    datePicker.maximumDate = .some(today)
    datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
        }
        
        @objc func donePressedForDeparture()   {
            
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .medium
            startDateTextField.text =  formatter.string(from: datePicker.date)
            self.view.endEditing(true)
        }
        @objc func donePressedForArrival()   {
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .medium
            finishDateTextField.text =  formatter.string(from: datePicker.date)
            self.view.endEditing(true)
        }
   

}
