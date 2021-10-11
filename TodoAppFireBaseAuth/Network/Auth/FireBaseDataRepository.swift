//
//  FireBaseDataRepository.swift
//  todoAppUsingFirebase
//
//  Created by Naveed Tahir on 05/10/2021.
//

import Foundation
import FirebaseAuth

class FireBaseDataRepository: DataRepository{
    public static var shared = FireBaseDataRepository()
    private init(){}
    
    func createUser(email: String, password: String, callback: ((Error?) -> ())?) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                  if let e = error{
                      callback?(e)
                      return
                  }
                  callback?(nil)
              }
    }
    func loginUser(withEmail email: String, password: String, _ callback: ((Error?) -> ())?){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let e = error{
                    callback?(e)
                    return
                }
                callback?(nil)
            }
    }
}
