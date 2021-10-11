//
//  SignupViewModel.swift
//  todoAppUsingFirebase
//
//  Created by Naveed Tahir on 05/10/2021.
//

import Foundation

class SignupViewModel{
    var repository: DataRepository?
    
    init(repository: DataRepository) {
        self.repository = repository
    }
    
    func createUser(email: String, password: String, callback: ((Error?) -> ())?){
        repository?.createUser(email: email, password: password, callback: { error in
            if let e = error{
                callback?(e)
                return
            }
            callback?(nil)
        })
    }
}
