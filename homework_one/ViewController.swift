//
//  ViewController.swift
//  homework_one
//
//  Created by Emre Muhammet Engin on 25.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNumber: UILabel!
    @IBOutlet weak var nameSurname: UILabel!
    @IBOutlet weak var tcLabel: UILabel!
    
    private let notificationCenter  = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func editProfile(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        // delegate
        secondViewController.delegate = self
        // closure
        secondViewController.updateIdentity = { [weak self] (identiy) in
            self?.tcLabel.text = "TC : "  + identiy
        }
        
        // Notification center
        secondViewController.notificationCenter = notificationCenter
        notificationCenter.addObserver(self, selector: #selector(self.updateName(_:)), name: NOT_KEY, object: nil)

        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    private func updateName(_ notification: NSNotification){
        if let name = notification.userInfo?["name"] as? String {
            nameSurname.text = "Ad Soyad : " +  name
          }
    }
    
}



protocol SecondViewDelegate : AnyObject{
    func dataEdited(_ city:String)
}

extension ViewController: SecondViewDelegate {
    func dataEdited(_ city:String){
        cityNumber.text = "Şehir :" + city
    }
}


