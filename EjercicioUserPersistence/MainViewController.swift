//
//  MainViewController.swift
//  EjercicioUserPersistence
//
//  Created by Mario Marco on 21/12/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var lbText: UILabel!
    
    var data: ManageUserDefault!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = ManageUserDefault()
        let user = data.retrieve(key: "USER")
        
        lbText.text = "¡Bienvenid@ " + user + "!"
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        data.delete(key: "USER")
        data.delete(key: "PASSWORD")
        self.navigationController?.popViewController(animated: true)
    }
}
