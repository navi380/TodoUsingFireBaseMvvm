//
//  LoginViewController.swift
//  todoAppUsingFirebase
//
//  Created by Naveed Tahir on 05/10/2021.
//

import UIKit
import SkyFloatingLabelTextField


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!

    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var gmailButtonOutlet: UIButton!
    
    let loginViewModel = Injection.provide.LoginViewModelInjection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if emailTextField.text != "" || passwordTextField.text != "" {
            
            self.emailTextField.errorMessage = ""
            self.passwordTextField.errorMessage = ""
            
            guard let email = emailTextField.text else {return}
            guard let password = passwordTextField.text else {return}
            
            loginViewModel.loginUser(withEmail: email, password: password) { error in
                if error == nil{
                    let targetVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(targetVc)
                    UserDefaults.standard.setLoggedIn(value: true)
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
    @IBAction func pushToSignup(_ sender: Any) {
        let targetVc = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(targetVc, animated: true)
    }
    
    @IBAction func gmailLogin(_ sender: Any) {
//       
    }
    
}



extension LoginViewController{
    func configureViews(){
        let gmailImage = UIImage(named: "google-plus")!
        gmailButtonOutlet.setBackgroundImage(gmailImage, for: .normal)
        gmailButtonOutlet.layer.cornerRadius = 0.5 * gmailButtonOutlet.bounds.size.width;
        gmailButtonOutlet.clipsToBounds = true
        gmailButtonOutlet.setTitle("", for: .normal)
    }
}





