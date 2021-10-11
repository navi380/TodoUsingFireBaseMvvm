//
//  PostDataRepository.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 08/10/2021.
//

import Foundation
import Firebase

class PostDataRepository: PostRepository{
    public static var shared = PostDataRepository()
    private init(){}

    let postRef = FireBaseService.shared.postReference
    
    func createPost(post: Post, completion: @escaping (Error?) -> ()){
        do {
            let postAsDict =  try post.asDictionary()
            postRef.child(post.id.uuidString).setValue(postAsDict)
        } catch {
            completion(error)
        }
    }
    
    func getAllPost(completion: @escaping (Post?) -> ()){
        let postRef = FireBaseService.shared.postReference
        postRef.observe(.childAdded, with: { snapshot in
            for child in snapshot.children {
                    print(child)
                }
            guard let value = snapshot.value as? [String: Any] else { return }
            let decoder = JSONDecoder()
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                let posts = try decoder.decode(Post.self, from: jsonData)
                completion(posts)
            } catch {
                print(error.localizedDescription)
            }
        })
       
    }
}

