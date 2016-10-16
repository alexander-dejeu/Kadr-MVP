//
//  PortfolioController.swift
//  Kadr-Blue
//
//  Created by Alex Dejeu on 10/12/16.
//  Copyright © 2016 Kadr. All rights reserved.
//

import UIKit
import Firebase

class PortfolioController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var database: FIRDatabase! = FIRDatabase.database()
    var storage: FIRStorage! = FIRStorage.storage()
    
    @IBOutlet weak var portfolioTableView: UITableView!
    
    // Initialize an array for your pictures
    var picArray: [UIImage] = []
    
    
    override func viewDidLoad() {
        self.title = "Our works"
        super.viewDidLoad()
        
        let dbRef = database.reference().child("Portfolio").child("FileNames")
        
        dbRef.observe(.childAdded, with: { (snapshot) in
            // Get download URL from snapshot
            print("Will this happen")
            let downloadURL = "gs://kadr-blue.appspot.com/Portfolio/" + snapshot.key + ".jpg"
            //           gs://kadr-blue.appspot.com/Portfolio
            // Create a storage reference from the URL
            print(" Test \(downloadURL)")
            print("does this happen?!")
            let storageRef = self.storage.reference(forURL: downloadURL)
            // Download the data, assuming a max size of 1MB (you can change this as necessary)
            storageRef.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                // Create a UIImage, add it to the array
                let pic = UIImage(data: data!)
                self.picArray.append(pic!)
                print(self.picArray.count)
                self.portfolioTableView.reloadData()
            }
        })
        
        
        
        // This is equivalent to creating the full reference
        //        let spaceRef = storage.referenceForURL("gs://<your-firebase-storage-bucket>/images/space.jpg")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PortfolioCell", for: indexPath) as! PortfolioCell
        cell.setupView()
        cell.portfolioImage.image = picArray[indexPath.row]
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picArray.count
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
