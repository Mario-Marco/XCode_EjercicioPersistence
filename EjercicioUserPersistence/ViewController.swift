//
//  ViewController.swift
//  EjercicioUserPersistence
//
//  Created by Mario Marco on 21/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var data: ManageUserDefault!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = ManageUserDefault()
        let user = data.retrieve(key: "USER")
        let password = data.retrieve(key: "PASSWORD")
        
        if(!user.isEmpty && !password.isEmpty) {
            let window = self.storyboard?.instantiateViewController(identifier: "MAIN") as! MainViewController
            self.navigationController?.pushViewController(window, animated: true)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MAIN" {
            data.save(text: txtUser.text!, key: "USER")
            data.save(text: txtPassword.text!, key: "PASSWORD")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let user = txtUser.text
        else {
            return false
        }
        
        guard let password = txtPassword.text
        else {
            return false
        }
        
        if user.count < 3 || password.count < 6 {
            return false
        }
        
        return true
    }
}

