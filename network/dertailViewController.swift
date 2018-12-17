//
//  dertailViewController.swift
//  network
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 2016110324. All rights reserved.
//

import UIKit
import  Alamofire
class dertailViewController: UIViewController {
    var person:[String:String]?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var no: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var clas: UILabel!
    @IBOutlet weak var img: UIImageView!
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "\(person?["stuName"] ?? "")"
        no.text = "\(person?["stuNo"] ?? "")"
        gender.text = "\(person?["stuGender"] ?? "")"
        clas.text = "\(person?["stuClass"] ?? "")"
        url = "\(person?["imagePath"] ?? "")"
        if let url = URL(string: "http://10.0.1.2/\(url)"){
            AF.request(url).responseData{
                (response)in
                self.img.image = UIImage(data: response.data!)
            }
        }
        
        // Do any additional setup after loading the view.
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
