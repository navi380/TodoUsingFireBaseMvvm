//
//  LoginViewModel.swift
//  todoAppUsingFirebase
//
//  Created by Naveed Tahir on 05/10/2021.
//

import Foundation


class LoginViewModel{
    var repository: DataRepository?
    
    init(repository: DataRepository) {
        self.repository = repository
    }
    
    func loginUser(withEmail email: String, password: String, _ callback: ((Error?) -> ())?){
        repository?.loginUser(withEmail: email, password: password) { error in
            if let e = error{
                callback?(e)
                return
            }
            callback?(nil)
        }
    }
    
}
