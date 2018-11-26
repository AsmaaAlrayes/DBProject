//
//  RestViewController.swift
//  ProjectDB
//
//  Created by Asmaa Alrayes on 11/20/18.
//  Copyright © 2018 Asmaa Alrayes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class RestViewController: ViewController, UITableViewDataSource, UITableViewDelegate {
    //UIViewController
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["1"]
    var index = 1
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.addSlideMenuButton()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  data.count
    }
    
    //---pressed cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        //print(cell.textLabel?.text)
        self.performSegue(withIdentifier: "gotoDishes", sender: self)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //------
        let ref = Database.database().reference()
        //1st
        ref.child("rest").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            
            cell.textLabel?.text = name as! String
            
           
            //var imageName = UIImage(named: "Rest")
            //cell.imageView?.image = imageName
            
            //image
            let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/dbtest-2-cba93.appspot.com/o/" + name + ".jpg?alt=media&token=7e158ef5-292a-4c5f-8243-561b923c73d6")
            
            let data = try? Data(contentsOf: url!)
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                cell.imageView?.image = image
            }
            
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
        //2nd
//        ref.child("rest").child("2").observeSingleEvent(of: .value, with: { (snapshot) in
//
//            let value = snapshot.value as? NSDictionary
//            let name = value?["name"] as? String ?? ""
//
//            cell.textLabel?.text = name as! String
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
        
          //------
        
     
        
        //cell.textLabel?.text = data[indexPath.row] as! String
        
        
        
        
        return cell
        
    }
}
