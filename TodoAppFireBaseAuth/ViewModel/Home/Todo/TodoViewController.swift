//
//  TodoViewController.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 07/10/2021.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var todoTitleField: UITextField!
    
    let todoViewModel = Injection.provide.TodoViewModelInjection()
    
    var callBack : (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
        let postInstance = Post(id: UUID(), title: todoTitleField.text!)
        if todoTitleField.text != ""{
            todoViewModel.createPost(post: postInstance) { error in
                if error != nil{
                    self.showAlert(alertText: "Error", alertMessage: error!.localizedDescription)
                }
            }
            guard let callBack = callBack else {
                return
            }
            callBack()
        }
        else{
            self.showAlert(alertText: "Error", alertMessage: "Please enter the todo title")
        }
    }
}
