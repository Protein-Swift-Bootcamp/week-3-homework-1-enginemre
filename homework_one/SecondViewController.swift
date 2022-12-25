//
//  SecondViewController.swift
//  homework_one
//
//  Created by Emre Muhammet Engin on 25.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var tcField: UITextField!
    
    weak var delegate: SecondViewDelegate?
    
    var updateIdentity : ((String)-> Void)?
    
    var notificationCenter : NotificationCenter?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    @IBAction func saveProfile(_ sender: Any) {
        if let name = nameField.text , let identity = tcField.text, let city = cityField.text{
            
            let userInfo = [ "name" : name ]
            
            updateIdentity?(identity)
            delegate?.dataEdited(city)
            notificationCenter?.post(name: NOT_KEY, object: nil,userInfo: userInfo )
            self.navigationController?.popViewController(animated: true)
        }
  
    }
    

}

