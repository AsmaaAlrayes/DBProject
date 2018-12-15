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
class TESTRestViewController: UITableViewController {
    var data = [CellData]()
    var array = ["asmaa"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //#imageLiteral(resourceName: "Rest")
         //"#imageLiteral(resourceName: "" + 1+ "")"
        //data = [CellData.init(image: #imageLiteral(resourceName: "Rest"), message: "helloooo asmaaaa", location: "KWT"),CellData.init(image: #imageLiteral(resourceName: "Rest"), message: "helloooo asmaaaa", location: "KWT")]
        
        
        //------Database----------------------------------------------------------------------------------
        let ref = Database.database().reference()
        //1st
        ref.child("rest").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            
            print(name)
            // print(self.array)
       
            self.array.append(name)
            print(self.array)
            
           // self.data.append(CellData.init(image: #imageLiteral(resourceName: "Rest"), message: "helloooo asmaaaa", location: "KWT"))
            //cell.textLabel?.text = name as! String
            
            //image
            let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/dbtest-2-cba93.appspot.com/o/" + name + ".jpg?alt=media&token=7e158ef5-292a-4c5f-8243-561b923c73d6")
            
            let data = try? Data(contentsOf: url!)
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                //cell.imageView?.image = image
            }
            
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
    //-------------------------------------------------------------------------------------------------
        // print("------")
        print(self.array)
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
    
}
