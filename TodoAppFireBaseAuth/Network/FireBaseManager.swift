//
//  FireBaseService.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 08/10/2021.
//


import Foundation
import Firebase
import FirebaseDatabase

class FireBaseService {
    static let shared = FireBaseService()
    private init() {}
    let postReference = Database.database().reference().child("Todo")
}
