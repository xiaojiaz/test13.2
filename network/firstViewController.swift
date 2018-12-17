//
//  ViewController.swift
//  network
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 2016110324. All rights reserved.
//

import UIKit
import Alamofire
class firstViewController: UIViewController {

    @IBOutlet weak var loaddata: UIImageView!
    @IBOutlet weak var sessonandaf: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loaddata(_ sender: Any) {
        DispatchQueue.global().async {
            if let url = URL(string: "http://10.0.1.2/pic.php?id=1"){
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        self.loaddata.image = UIImage(data: data)
                    }
                }
            }
        }
        
    }
    
    @IBAction func sessiondata(_ sender: Any) {
            if let url = URL(string: "http://10.0.1.2/pic.php?id=2"){
                let task = URLSession.shared.dataTask(with: url){(data,response,error)in
                    DispatchQueue.main.async {
                        self.sessonandaf.image = UIImage(data: data!)
                    }
                }
                task.resume()
            }
    }
    
    @IBAction func af(_ sender: Any) {
        if let url = URL(string: "http://10.0.1.2/pic.php?id=3"){
            AF.request(url).responseData{
                (response)in
                self.sessonandaf.image = UIImage(data: response.data!)
            }
        }
    }
}

