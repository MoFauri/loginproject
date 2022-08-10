//
//  secViewController.swift
//  m1
//
//  Created by htu on 8/3/22.
//  Copyright © 2022 saddam ayasrah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class secViewController: UIViewController {

    @IBAction func CreateAccount(_ sender: Any) {
        
        let FirstName1 = FirstName.text!
        let LastName1 = LastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Eemail1 = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Password1 = PassWord.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
         Auth.auth().createUser(withEmail: Eemail1, password: Password1) { (result, err) in
                       
                       
                           
                           // User was created successfully, now store the first name and last name
                           let db = Firestore.firestore()
                           
                           db.collection("users").addDocument(data: ["firstName":FirstName1, "Lastname":LastName1, "uid": result!.user.uid ]) { (error) in
                               
                               
                        }}
    }
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9790465236, green: 0.7420710921, blue: 0.1242050752, alpha: 1)
        // Do any additional setup after loading the view.
    }
    

    

}
