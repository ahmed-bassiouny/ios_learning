//
//  PickerViewController.swift
//  Learning
//
//  Created by NTAM on 1/3/19.
//  Copyright © 2019 NTAM. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
   

    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var pickerTextField: UITextField!
    let colors = ["Red","Yellow","Green","Blue"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // create date picker object
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        
        
        datePicker.addTarget(self, action: #selector(onDatePickerValueChanged), for: UIControl.Event.allEvents)


        // datepicker toolbar setup
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
       
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneDatePickerPressed))
        
        // if you remove the space element, the "done" button will be left aligned
        // you can add more items if you want
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        dateTextField.inputAccessoryView = toolBar
        
        dateTextField.inputView = datePicker
        
        
        
        
        
        // picker view for multi value
        
        
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        pickerTextField.inputAccessoryView = toolBar

        pickerTextField.inputView = picker


    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = colors[row]
    }
    
    
    @objc func doneDatePickerPressed(){
        self.view.endEditing(true)
    }
    
    @objc func onDatePickerValueChanged(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        // customize the locale for the formatter if you want
        //formatter.locale = NSLocale(localeIdentifier: "it_IT")
        formatter.dateFormat = "dd/MM/yyyy"
        self.dateTextField.text = formatter.string(from: datePicker.date)
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
