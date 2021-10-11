//
//  UserDefaults.swift
//  todoAppUsingFirebase
//
//  Created by Naveed Tahir on 05/10/2021.
//

import Foundation

enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
}

extension UserDefaults{

    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }

    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    
}
