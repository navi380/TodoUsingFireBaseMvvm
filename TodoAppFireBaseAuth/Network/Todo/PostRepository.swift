//
//  PostRepository.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 08/10/2021.
//

import Foundation



protocol PostRepository{
    func createPost(post: Post, completion: @escaping (Error?) -> ())
    func getAllPost(completion: @escaping (Post?) -> ())
}
