//
//  ViewController.swift
//  m1
//
//  Created by htu on 8/3/22.
//  Copyright © 2022 saddam ayasrah. All rights reserved.
//

import UIKit
import FirebaseCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRemoteConfigDefaults()
        displayNewValues()
        fetchRemoteConfig()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var rcLabel: UILabel!
    
    func setupRemoteConfigDefaults() {
    let defaultValue = ["label_text": "Hello world!" as NSObject]
    remoteConfig.setDefaults(defaultValue)
    }
    
   
    func fetchRemoteConfig(){
    remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
    guard error == nil
        else { return }
    print("Got the value from Remote Config!")
        remoteConfig.activate { (true) in
            
        }
    self.displayNewValues()
       
        
    }
        
    }
            
            
    
   
func displayNewValues()
    {
    let newLabelText = remoteConfig.configValue(forKey: "label_text").stringValue ?? ""
    rcLabel.text = newLabelText
    }
    
    


}
