//
//  Repository.swift
//  todoAppUsingFirebase
//
//  Created by Naveed Tahir on 05/10/2021.
//

import Foundation
import UIKit

protocol DataRepository{
    func createUser(email: String, password: String, callback: ((Error?) -> ())?)
    func loginUser(withEmail email: String, password: String, _ callback: ((Error?) -> ())?)
}
