//
//  ViewController.swift
//  JsonEncoder
//
//  Created by sivakumar on 02/12/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import UIKit

struct jsonStruct:Codable {
    
    let name:String
    let capital:String
    let region:String
    let subregion:String
}

class ViewController: UIViewController {
    
    var dataArray = [jsonStruct]()
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                
                do{
                    try self.dataArray = JSONDecoder().decode([jsonStruct].self, from: data!)
                    //print(self.dataArray)
                    for mainArray in self.dataArray {
                        
                        print(mainArray.name,":",mainArray.capital,":",mainArray.region,":",mainArray.subregion)
                        
                        DispatchQueue.main.async {
                            self.tv.reloadData()
                        }
                        
                    }
                    
                }catch {
                    print("something wrong")
                }
                
            }else{
                print("something went wrong while parsing")
            }
            
        }.resume()
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        cell?.nameLabel.text = "Country: \(dataArray[indexPath.row].name)"
        cell?.capitalLabel.text = "Capital: \(dataArray[indexPath.row].capital)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        
             detail.regionStr = dataArray[indexPath.row].region
             detail.subRegionStr = dataArray[indexPath.row].subregion
        
        //print(detail.subRegionStr)
        
        
        
           self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    
    
    
}

