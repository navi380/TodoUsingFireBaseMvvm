//
//  TodoViewModel.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 08/10/2021.
//

import Foundation



class TodoViewModel{
    
    var repository: PostRepository?
    var postData: Post?
    
    init(repository: PostRepository) {
        self.repository = repository
    }
    
    func createPost(post: Post, completion: @escaping (Error?) -> ()){
        repository?.createPost(post: post, completion: { error in
            completion(error)
        })
    }
    
    func getAllPost(completion: @escaping (Post?) -> ()){
        repository?.getAllPost(completion: { posts  in
            self.postData = posts
            completion(posts)
        })
    }
}
