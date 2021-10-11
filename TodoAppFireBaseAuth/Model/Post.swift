//
//  Post.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 08/10/2021.
//

import Foundation
import FirebaseDatabase
import Firebase

struct Post: Codable{
    let id: UUID
    let title: String
}
