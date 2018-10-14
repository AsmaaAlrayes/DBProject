//
//  ViewController.swift
//  ProjectDB
//
//  Created by Asmaa Alrayes on 10/13/18.
//  Copyright © 2018 Asmaa Alrayes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addSlideMenuButton()
    }

    //--------------------register-----
    //sign in
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signin: UIButton!
    
    //sign up
    @IBOutlet weak var usernameUP: UITextField!
    @IBOutlet weak var emailUP: UITextField!
    @IBOutlet weak var passwordUP: UITextField!
    @IBOutlet weak var signup: UIButton!
    
    @IBAction func SignInTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "gotohome", sender: self)
        
        
//        //form validation
//        if let email = username.text, let pass = password.text{
//            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
//                // check user isnt nil
//                if let u = user{
//                    //user is found, go to home screen
//                    // self.performSegue(withIdentifier: "gotohome", sender: self)
//                }
//                else{
//                    //print error
//                }
//            }
//        }
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        
//        //form validation
//
//        if let email = emailUP.text, let pass = passwordUP.text{
//            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
//                // check user isnt nil
//                //if let u = user{
//                if user != nil{
//                    //user is found, go to home screen
//                    print("User created!")
//                    // self.performSegue(withIdentifier: "gotohome", sender: self)
//                }
//                else{
//                    //print error
//                }
//            }
//        }
//
        
    }
    
    
    
   
}

