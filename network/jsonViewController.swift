//
//  jsonViewController.swift
//  network
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 2016110324. All rights reserved.
//

import UIKit
import Alamofire
class jsonViewController: UIViewController {
    let url = URL(string: "http://10.0.1.2/piclist.php")
    var persons:[[String:String]]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadwithurl(_ sender: Any) {
        if let data = try? Data(contentsOf: url!){
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:String]]{
                self.persons = json
                self.performSegue(withIdentifier: "show", sender: self)
                for person in json{
                    print("name:\(person["stuName"] ?? "")")
                }
            }
        }
    }
    
    @IBAction func loadwithsess(_ sender: Any) {
        let task = URLSession.shared.dataTask(with: url!){(data,response,error)in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:String]]{
                self.persons = json
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "show", sender: self)
                }
                for person in json{
                    print("name:\(person["stuName"] ?? "")")
                }
            }
        }
        task.resume()
    }
    @IBAction func loadwithaf(_ sender: Any) {
        AF.request(url!).responseJSON(completionHandler: {(response)in
            let json = response.value as! [[String:String]]
             self.performSegue(withIdentifier: "show", sender: self)
            self.persons = json
            for person in json{
                 print("name:\(person["stuName"] ?? "")")
            }
        })
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "show"{
            let sev = segue.destination as! personsTableViewController
            sev.persons = self.persons
        }
    }
    

}
