//
//  SignInViewController.swift
//  m1
//
//  Created by htu on 8/10/22.
//  Copyright © 2022 saddam ayasrah. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var PassWord: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBAction func Sigin(_ sender: Any) {
        
        let email = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PassWord.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
         Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                   
                   
                       
           let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
            
            self.view.window?.rootViewController = homeViewController
            self.view.window?.makeKeyAndVisible()
                   
               }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
