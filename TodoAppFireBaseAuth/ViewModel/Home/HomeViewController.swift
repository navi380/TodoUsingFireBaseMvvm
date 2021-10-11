//
//  HomeViewController.swift
//  todoAppUsingFirebase
//
//  Created by Naveed Tahir on 05/10/2021.
//

import UIKit



class HomeViewController: UIViewController{ //,pageControllerDelegate{
    
    @IBOutlet weak var todoListBtnOutlet: MenuButton!
    @IBOutlet weak var todoBtnOutlet: MenuButton!
    
    var pageViewcontroller: PageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setLoggedIn(value: false)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pageSegue" {
            pageViewcontroller = segue.destination as? PageViewController
            //            pageViewcontroller?.pageDelegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pageViewcontroller?.sendIndex = { [self] index in
            if index == 0{
                todoBtnOutlet.setTodoMbBtnLayout()
                todoBtnOutlet.setTitle(MenuBtnType.Todo.rawValue, for: .normal)
                self.todoListBtnOutlet.setListMbBtnLayout()
                self.todoListBtnOutlet.setTitle(MenuBtnType.TodoList.rawValue, for: .normal)
            }
            else if index == 1{
                self.todoBtnOutlet.setListMbBtnLayout()
                self.todoBtnOutlet.setTitle(MenuBtnType.Todo.rawValue, for: .normal)
                self.todoListBtnOutlet.setTodoMbBtnLayout()
                self.todoListBtnOutlet.setTitle(MenuBtnType.TodoList.rawValue, for: .normal)
            }
        }
    }
    
    
    //    func passData(index: Int){
    //        if index == 0{
    //            todoBtnOutlet.setTodoMbBtnLayout()
    //            todoBtnOutlet.setTitle(MenuBtnType.Todo.rawValue, for: .normal)
    //            todoListBtnOutlet.setListMbBtnLayout()
    //            todoListBtnOutlet.setTitle(MenuBtnType.TodoList.rawValue, for: .normal)
    //        }
    //        else if index == 1{
    //            todoBtnOutlet.setListMbBtnLayout()
    //            todoBtnOutlet.setTitle(MenuBtnType.Todo.rawValue, for: .normal)
    //            todoListBtnOutlet.setTodoMbBtnLayout()
    //            todoListBtnOutlet.setTitle(MenuBtnType.TodoList.rawValue, for: .normal)
    //        }
    //    }
    
    
    
    @IBAction func todoBtn(_ sender: Any) {
        pageViewcontroller?.goToNextPage()
        //        NotificationCenter.default.post(name: .goToNext, object: nil)
        //        todoListBtnOutlet.setMenuBtnLayout(type: .todoBtn)
        todoBtnOutlet.setListMbBtnLayout()
        todoBtnOutlet.setTitle(MenuBtnType.Todo.rawValue, for: .normal)
        todoListBtnOutlet.setTodoMbBtnLayout()
        todoListBtnOutlet.setTitle(MenuBtnType.TodoList.rawValue, for: .normal)
    }
    @IBAction func todoListBtn(_ sender: Any) {
        pageViewcontroller?.goToPreviousPage()
        //        NotificationCenter.default.post(name: .goToBack, object: nil)
        //        todoListBtnOutlet.setListMbBtnLayout()
        todoBtnOutlet.setTodoMbBtnLayout()
        todoBtnOutlet.setTitle(MenuBtnType.Todo.rawValue, for: .normal)
        todoListBtnOutlet.setListMbBtnLayout()
        todoListBtnOutlet.setTitle(MenuBtnType.TodoList.rawValue, for: .normal)
    }
    
}
