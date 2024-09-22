//
//  ViewController.swift
//  AlamofireEntegresyonu
//
//  Created by Pelin Üstünel on 19.08.2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController, AutherizaContract {
   
    func onAutherize(response: AutherizeResponse) {
        label.text = response.url
    }
    
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonClick(_ sender: Any) {
        
        let autherizeServices = AutherizeService()
        autherizeServices.autherize(username: "P", password: "A", listener: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


