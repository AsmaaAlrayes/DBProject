//
//  ViewController.swift
//  ProjectDB
//
//  Created by Asmaa Alrayes on 10/13/18.
//  Copyright © 2018 Asmaa Alrayes. All rights reserved.
//
//----------firebase dbtest 2

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

//touchID
import LocalAuthentication

class ViewController: BaseViewController {
    
    @IBOutlet weak var seg: UISegmentedControl!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var btn: UIButton!
    
    
//    @IBAction func touchID(_ sender: Any) {
//        let context:LAContext = LAContext()
//        
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
//        {
//            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Use Touch ID to Log In", reply: {(wasCorrect, error) in
//                if wasCorrect{
//                    print("Correct")}
//                else{
//                    print("Incorrect")}
//            })
//        }
//        else{
//            
//        }
//    }
    
    @IBAction func btn_clicked(_ sender: Any) {
        if seg.selectedSegmentIndex == 0 {
            login()
        } else if seg.selectedSegmentIndex == 1 {
             signup()
        }
    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addSlideMenuButton()
        
       
        //--------DB----------------------------------
        let ref = Database.database().reference()
        
        //---read rest
        
        
//        ref.child("rest").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
//
//                        let value = snapshot.value as? NSDictionary
//                        let name = value?["name"] as? String ?? ""
//                        //let location = value?["location"] as? String ?? ""
//
//                        self.data.append(name)
//
//                        print("***************")
//                        print(self.data)
//                        //print(name)
//                        //print(location)
//
//                        // ...
//                    }) { (error) in
//                        print(error.localizedDescription)
//                    }
        
        
        //------dishes
//                    ref.child("rest").child("1").child("dishes").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
//                        let value = snapshot.value as? NSDictionary
//                        let Dname = value?["name"] as? String ?? ""
//                        print(Dname)
//                        let price = value?["price"] as? String ?? ""
//                        print(price)
//                        // ...
//
//
//                    }) { (error) in
//                        print(error.localizedDescription)
//                    }
        
            //---write to db
//            ref.childByAutoId().setValue(["name":"Maryam",
//                                          "role":"Admin",
//                                          "Age":24])
        
            //---read from db

//            ref.child("someid").observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                let value = snapshot.value as? NSDictionary
//                  let name = value?["name"] as? String ?? ""
//               // let username = value?["username"] as? String ?? ""
//               /// let user = User(username: username)
//                print("***************")
//                print(name)
//                // ...
//            }) { (error) in
//                print(error.localizedDescription)
//            }
        
        
        
//        //-----------update user profile
//        //get user ID
//        let userID = Auth.auth().currentUser?.uid
//        print("***************")
//       // ---write to db
//        ref.childByAutoId().setValue(["ID":userID,
//                                      "name":"Asmaa",
//                                      "role":"Admin",
//                                      "Age":24])
//
        
        
            //----update db
//            let updates = ["-LRlJaBCZq0U13QwP8iF/name":"Soomy"]
//
//            ref.updateChildValues(updates)
//
        
       
        
    }

    func getdata()-> Array<Any>{
        var data = [String]()
        let ref = Database.database().reference()
        
        ref.child("rest").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
           let name = value?["name"] as? String ?? ""
            
            
            data.append(name)
            
            print("***************")
            print(data)
          
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        print("@@@@@@")
        print(data)
        return data
    }
    
    
    //--------------------register-----
    func login(){
        if self.email.text == "" || self.pass.text == "" {
            print("Please ENTER TEXT")
        } else {
            Auth.auth().signIn(withEmail:
                self.email.text!, password:
            self.pass.text!){ (user,error) in
                
                if error == nil {
                    print("you have successfully logen in")
                    self.performSegue(withIdentifier: "gotohome", sender: self)
                } else{
                    print("error")
                }
            }
        }
    }
    
    func signup(){
        if self.email.text == "" || self.pass.text == "" {
            print("Please ENTER TEXT")
        } else {
            Auth.auth().createUser(withEmail:  self.email.text!, password: self.pass.text!) { (authResult, error) in
                
                if error == nil {
                    print("you have successfully signed up ")
                    self.performSegue(withIdentifier: "gotohome", sender: self)
                    
                    
                } else{
                    print("error")
                }
                
                // guard let user = authResult?.user else { return }
            }
            
        }
        
    }
   
}

