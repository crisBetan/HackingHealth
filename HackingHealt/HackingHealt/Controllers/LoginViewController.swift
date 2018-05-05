//
//  LoginViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
import  Firebase

class LoginViewController: UIViewController {
        
        var activityView:UIActivityIndicatorView! = {
            let activity = UIActivityIndicatorView()
            activity.translatesAutoresizingMaskIntoConstraints = false
            activity.color = UIColor.gray
            activity.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
            
            return activity
        }()
        
        var emailLoginTextField: UITextField = {
            let email = UITextField()
            email.placeholder = "Correo"
            email.translatesAutoresizingMaskIntoConstraints = false
            email.textColor = UIColor.black
            email.font = UIFont.systemFont(ofSize: 15)
            email.borderStyle = .none
            email.layer.cornerRadius = 5.0
            email.keyboardType = UIKeyboardType.emailAddress
            email.background = #imageLiteral(resourceName: "Textfield")
            email.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            return email
        }()
        
        let passwordLoginTextField: UITextField = {
            let password = UITextField()
            password.placeholder = "Contraseña"
            password.translatesAutoresizingMaskIntoConstraints = false
            password.textColor = UIColor.black
            password.borderStyle = .none
            password.font = UIFont.systemFont(ofSize: 15)
            password.layer.cornerRadius = 5.0
            password.isSecureTextEntry = true
            password.keyboardType = .default
            password.background = #imageLiteral(resourceName: "Textfield")
            password.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
            return password
        }()
        
        let forgotPasswordButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Forgot Password", for: .normal)
            button.setTitleColor(UIColor.blue, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
            button.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
            return button
        }()
        
        let imageLogInIcon: UIImageView = {
            let image = UIImageView()
            image.layer.cornerRadius = 53
            image.clipsToBounds = true
            //image.backgroundColor = UIColor.black
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = #imageLiteral(resourceName: "logoImage")
            return image
        }()
        
        let loginButton: UIButton = {
            var button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setBackgroundImage(#imageLiteral(resourceName: "Button"), for: .normal)
            button.setTitle("Login", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.gray, for: .disabled)
            button.layer.cornerRadius = 5.0
            button.isEnabled = false
            
            button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
            return button
        }()
        
        let signUpButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Dont have an account", for: .normal)
            button.setTitleColor(UIColor.blue, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
            button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            view.backgroundColor = UIColor.white
            
            view.addSubview(imageLogInIcon)
            view.addSubview(emailLoginTextField)
            view.addSubview(passwordLoginTextField)
            view.addSubview(loginButton)
            view.addSubview(forgotPasswordButton)
            view.addSubview(signUpButton)
            
            setUpImageLoginIcon()
            setUpEmailTextField()
            setUpPasswordTextField()
            setUpLoginButton()
            setUpForgotPassButton()
            setUpSignUpButton()
            
        }
        
        func setUpImageLoginIcon(){
            imageLogInIcon.heightAnchor.constraint(equalToConstant: 225).isActive = true
            imageLogInIcon.widthAnchor.constraint(equalToConstant: 225).isActive = true
            imageLogInIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageLogInIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 61).isActive = true
        }
        
        func setUpEmailTextField(){
            emailLoginTextField.widthAnchor.constraint(equalToConstant: 271).isActive = true
            emailLoginTextField.heightAnchor.constraint(equalToConstant: 32)
            emailLoginTextField.topAnchor.constraint(equalTo: imageLogInIcon.bottomAnchor, constant: 30).isActive = true
            emailLoginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        
        func setUpPasswordTextField(){
            passwordLoginTextField.widthAnchor.constraint(equalTo: emailLoginTextField.widthAnchor).isActive = true
            passwordLoginTextField.heightAnchor.constraint(equalTo: emailLoginTextField.heightAnchor).isActive = true
            passwordLoginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            passwordLoginTextField.topAnchor.constraint(equalTo: emailLoginTextField.bottomAnchor, constant: 32).isActive = true
        }
        
        func setUpLoginButton(){
            
            loginButton.widthAnchor.constraint(equalToConstant: 207).isActive = true
            loginButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            loginButton.topAnchor.constraint(equalTo: passwordLoginTextField.bottomAnchor, constant: 66).isActive = true
        }
        
        func setUpForgotPassButton(){
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 78).isActive = true
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 13).isActive = true
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
        }
        func setUpSignUpButton() {
            signUpButton.widthAnchor.constraint(equalToConstant: 104).isActive = true
            signUpButton.heightAnchor.constraint(equalTo: forgotPasswordButton.heightAnchor).isActive = true
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            signUpButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 27).isActive = true
        }
        
        @objc func textFieldChanged(_ target:UITextField) {
            let email = emailLoginTextField.text
            let password = passwordLoginTextField.text
            let formFilled = email != nil && email != "" && password != nil && password != ""
            setLoginButtonEnabled(enabled: formFilled)
        }
        
        func setLoginButtonEnabled(enabled:Bool) {
            if enabled {
                loginButton.alpha = 1.0
                loginButton.isEnabled = true
            } else {
                loginButton.alpha = 0.5
                loginButton.isEnabled = false
            }
        }
        
        @objc func handleForgotPassword(){
            let alert = UIAlertController(title: "¿Olvidaste tu contraseña?", message: "Escribe tu correo", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Ingresa tu correo"
            }
            let send = UIAlertAction(title: "Enviar", style: .default)
            let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
            alert.addAction(send)
            alert.addAction(cancel)
            present(alert,animated: true,completion:  nil)
        }
        
        @objc func handleSignIn() {
            
            setLoginButtonEnabled(enabled: false)
            emailLoginTextField.isEnabled = false
            passwordLoginTextField.isEnabled = false
            forgotPasswordButton.isEnabled = false
            signUpButton.isEnabled = false
            loginButton.setTitle("", for: .normal)
            activityView?.startAnimating()
            
            
            handleLogin()
            
            
        }
    
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
            print("Estoy tocando")
        }
        
        @objc func handleSignUp(){
            
            let objVC: SignUpViewController? = SignUpViewController()
            let aObjNavi = UINavigationController(rootViewController: objVC!)
            present(aObjNavi, animated: true, completion: nil)
        }
    
    func handleLogin() {
        guard let email = emailLoginTextField.text, let password = passwordLoginTextField.text else {
            print("Form is not Valid")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Verifica tu Correo y ontraseña", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(cancel)
                self.present(alert,animated: true,completion:  nil)
                self.returnButtonsNormalState()
                
                return
            }
            //self.messagesController?.fetchUserAndSetupNavBarTitle()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    @objc func dismissKeyboard(){
        emailLoginTextField.endEditing(false)
        passwordLoginTextField.endEditing(false)
    }
    func returnButtonsNormalState(){
        
        self.activityView?.stopAnimating()
        
        self.setLoginButtonEnabled(enabled: false)
        self.emailLoginTextField.isEnabled = true
        self.passwordLoginTextField.isEnabled = true
        self.forgotPasswordButton.isEnabled = true
        self.signUpButton.isEnabled = true
        self.loginButton.setTitle("Login", for: .normal)
        self.emailLoginTextField.text = ""
        self.passwordLoginTextField.text = ""
    }
    
    
        
}
