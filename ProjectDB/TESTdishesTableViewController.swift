//
//  TESTdishesTableViewController.swift
//  ProjectDB
//
//  Created by Asmaa Alrayes on 12/16/18.
//  Copyright © 2018 Asmaa Alrayes. All rights reserved.
//


import Foundation
import UIKit
import FirebaseDatabase
struct dishesCellData {
    let image : UIImage?
    let message : String?
    let location : String?
}

class TESTdishesTableViewController: UITableViewController {
    var data = [dishesCellData]()
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
       ref.child("rest").child(String(row+1)).child("dishes").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            var location = value?["price"] as? String ?? ""
            location = location + " KD"
        print(row)
        print(name)
        print(location)
             self.data.append(dishesCellData.init(image: #imageLiteral(resourceName: "Rest"), message: name, location: location))
            self.tableView.reloadData()
            
//            //image-------
//            let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/dbtest-2-cba93.appspot.com/o/" + name + ".jpg?alt=media&token=7e158ef5-292a-4c5f-8243-561b923c73d6")
//
//            let data = try? Data(contentsOf: url!)
//
//            if let imageData = data {
//                let image1 = UIImage(data: imageData)
//                self.data.append(dishesCellData.init(image: image1, message: name, location: location))
//            }
            
        })
        

        //-------------------------------------------------------------------------------------------------
        
        self.tableView.register(dishesCustomCell.self, forCellReuseIdentifier: "custom")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! dishesCustomCell
        
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
        
        
        //if cell pressed
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let destination = storyboard.instantiateViewController(withIdentifier: "TdishesVC") as! TESTdishesTableViewController
//        navigationController?.pushViewController(destination, animated: true)
    }
}
