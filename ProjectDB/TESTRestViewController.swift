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
}
class TESTRestViewController: UITableViewController {
    var data = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.addSlideMenuButton()
        
        //data = [CellData.init(image: "Rest.jpg", message: "helloooo asmaaaa")]
        //#imageLiteral(resourceName: "Rest")
        
        data = [CellData.init(image: #imageLiteral(resourceName: "Rest"), message: "helloooo asmaaaa")]
        
         self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        cell.mainimage = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
}
