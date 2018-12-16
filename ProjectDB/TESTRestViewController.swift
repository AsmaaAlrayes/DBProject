//
//  TESTRestViewController.swift
//  ProjectDB
//
//  Created by Asmaa Alrayes on 12/15/18.
//  Copyright © 2018 Asmaa Alrayes. All rights reserved.
//
import Foundation
import UIKit
import FirebaseDatabase
struct CellData {
    let image : UIImage?
    let message : String?
    let location : String?
}
var row = 0

class TESTRestViewController: UITableViewController {
    var data = [CellData]()
    var array = ["asmaa"]
    var nnn = "asas"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //#imageLiteral(resourceName: "Rest")
         data = []
       // data = [CellData.init(image: #imageLiteral(resourceName: "Rest"), message: "helloooo asmaaaa", location: "KWT"),CellData.init(image: #imageLiteral(resourceName: "Rest"), message: nnn, location: "KWT")]
        
        self.tableView.estimatedRowHeight = 500
        
        //------Database----------------------------------------------------------------------------------
        let ref = Database.database().reference()
        //1st
        ref.child("rest").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            let location = value?["location"] as? String ?? ""
            
            //image-------
            let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/dbtest-2-cba93.appspot.com/o/" + name + ".jpg?alt=media&token=7e158ef5-292a-4c5f-8243-561b923c73d6")
            
            let data = try? Data(contentsOf: url!)
            
            if let imageData = data {
                let image1 = UIImage(data: imageData)
                self.data.append(CellData.init(image: image1, message: name, location: location))
            }
            
        })
        
        //2st
        ref.child("rest").child("2").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            let location = value?["location"] as? String ?? ""
            
//            //image-------
//            let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/dbtest-2-cba93.appspot.com/o/" + name + ".jpg?alt=media&token=7e158ef5-292a-4c5f-8243-561b923c73d6")
//
//            let data = try? Data(contentsOf: url!)
//
//            if let imageData = data {
//                let image1 = UIImage(data: imageData)
//                self.data.append(CellData.init(image: image1, message: name, location: location))
//            }
           self.data.append(CellData.init(image: #imageLiteral(resourceName: "Rest"), message: name, location: location))
        })

        //one
        ref.child("rest").child("one").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            let location = value?["location"] as? String ?? ""
            
            self.data.append(CellData.init(image: #imageLiteral(resourceName: "Rest"), message: name, location: location))
            self.tableView.reloadData()
        })
    //-------------------------------------------------------------------------------------------------
       
         self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        
        cell.mainimage = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        cell.location = data[indexPath.row].location
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("*********************")
        print("pressed")
        row = indexPath.row
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "TdishesVC") as! TESTdishesTableViewController
        navigationController?.pushViewController(destination, animated: true)
    }
}
