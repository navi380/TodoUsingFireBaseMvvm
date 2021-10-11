//
//  SignupViewController.swift
//  todoAppUsingFirebase
//
//  Created by Naveed Tahir on 05/10/2021.
//

import UIKit
import SkyFloatingLabelTextField

class SignupViewController: UIViewController {

    @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    let signupViewModel = Injection.provide.SignupViewModelInjection()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signupAction(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            self.emailTextField.errorMessage = ""
            self.passwordTextField.errorMessage = ""
            
            guard let email = emailTextField.text else {return}
            guard let password = passwordTextField.text else {return}
        
            signupViewModel.createUser(email: email , password: password) { error in
                if error == nil{
                    let targetVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    self.navigationController?.pushViewController(targetVc, animated: true)
                }
                else{
                    self.showAlert(alertText: "Error", alertMessage: error!.localizedDescription)
                }
            }
        }
        else{
            self.emailTextField.errorMessage = "Invalid Email"
            self.passwordTextField.errorMessage = "Invalid Password"
        }
    }
}
