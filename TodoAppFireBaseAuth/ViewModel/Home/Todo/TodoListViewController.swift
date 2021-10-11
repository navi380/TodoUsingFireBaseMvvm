//
//  TodoListViewController.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 07/10/2021.
//

import UIKit
import Firebase
import FirebaseDatabase

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    let todoListViewModel = Injection.provide.TodoViewModelInjection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCells()
        getPosts()
    }

}

extension TodoListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.assignData = posts[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}


extension TodoListViewController{
    func getPosts(){
        todoListViewModel.getAllPost { allPosts in
            DispatchQueue.main.async {
                self.posts.append(allPosts!)
                self.tableView.reloadData()
            }
        }
    }
    
    func configureCells(){
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
}
