//
//  FilesConfirmationCellRow.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 17.08.2024.
//

import UIKit

class FilesConfirmationCellRow : UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var fileNameResultLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var versionResultLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeResultLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var containerView: UIView!
    
    let pickerStatusData = ["Select Status", "New File", "Waiting Customer", "Invalid Sequence Usage", "Unvald Schema", "Unvalid Syntax", "Execution error", "The script is not suitable", "Script not suitable : Constant values are used.", "Approved"]
    
    
    func fillCell(name: String, nameResult: String, version: String, versionResult: String, size: String, sizeResult: String, status: String){
        fileNameLabel.text = name
        fileNameResultLabel.text = nameResult
        versionLabel.text = version
        versionResultLabel.text = versionResult
        sizeLabel.text = size
        sizeResultLabel.text = sizeResult
        statusLabel.text = status
    }
    
    var selectedOptionIndex: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 10.0
        containerView.layer.masksToBounds = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerStatusData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerStatusData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
           let label = UILabel()

          
           label.text = pickerStatusData[row]

          
           label.font = UIFont.systemFont(ofSize: 12)
           label.textAlignment = .center

           return label
       }

}
