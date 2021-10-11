//
//  PageViewController.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 07/10/2021.
//

import UIKit

//protocol pageControllerDelegate {
//    func passData(index: Int)
//}

class PageViewController: UIPageViewController {
        
//    var pageDelegate: pageControllerDelegate?
    
    //because the call back is optional please decalare it in guard let or if
    var sendIndex : ((Int) -> ())?
    
    private lazy var todoListViewConrtolelr: TodoListViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "TodoListViewController") as! TodoListViewController
        return viewController
    }()

    private lazy var todoViewController: TodoViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "TodoViewController") as! TodoViewController
        return viewController
    }()

    
    private lazy var orderedViewControllers: [UIViewController] = {
        return[
            todoListViewConrtolelr,todoViewController
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        assignFirstController()
        self.delegate=self
        self.dataSource=self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoViewController.callBack = {
            self.goToPreviousPage()
            guard let sendindex = self.sendIndex else { return }
            sendindex(0)
        }
//        NotificationCenter.default.addObserver(self, selector: #selector(goToNext(notification:)), name: .goToNext, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(goToBack(notification:)), name: .goToBack, object: nil)
    }

//    @objc func goToNext(notification: Notification){
//        self.goToNextPage()
//    }
//    @objc func goToBack(notification: Notification){
//        self.goToPreviousPage()
//    }
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0  else{
            return nil
        }
        guard orderedViewControllers.count > previousIndex else{
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let currentPageViewControllerIndex = pageViewController.viewControllers![0]
        let index = orderedViewControllers.firstIndex(of: currentPageViewControllerIndex)!
//        passing index using delegate
//        pageDelegate?.passData(index: index)
        //saving call back in a variable then calling that variable
        guard let sendindex = sendIndex else { return }
        sendindex(index)
    }
    
    
    private func assignFirstController(){
        if let firstViewController = orderedViewControllers.first{
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}
