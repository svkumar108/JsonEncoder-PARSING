//
//  DetailViewController.swift
//  JsonEncoder
//
//  Created by sivakumar on 02/12/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var reginoLabel: UILabel!
    @IBOutlet weak var subRegionLabel: UILabel!
    
    var regionStr:String = ""
    var subRegionStr:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reginoLabel.text = "Region : \(regionStr)"
        subRegionLabel.text = "SubRegion : \(subRegionStr)"
        
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
