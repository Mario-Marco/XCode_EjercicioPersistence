//
//  ManageUserDefault.swift
//  EjercicioUserPersistence
//
//  Created by Mario Marco on 21/12/2023.
//

import UIKit

class ManageUserDefault: NSObject {
    func save(text: String, key: String){
        UserDefaults.standard.set(text, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func retrieve(key: String) -> String {
        guard let retrieve: String = (UserDefaults.standard.value(forKey: key)) as? String
        else {
            return ""
        }
        return retrieve
    }
    
    func delete(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
