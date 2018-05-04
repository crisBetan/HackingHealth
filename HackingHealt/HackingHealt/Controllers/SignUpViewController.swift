//
//  SignUpViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
import  Firebase

class SignUpViewController: UIViewController {

    var activityView:UIActivityIndicatorView! = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = UIColor.gray
        activity.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        return activity
    }()
    
    var nameTextField: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Name"
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.textColor = UIColor.black
        textF.font = UIFont.systemFont(ofSize: 15)
        textF.borderStyle = .none
        textF.layer.cornerRadius = 5.0
        textF.keyboardType = UIKeyboardType.emailAddress
        textF.background = #imageLiteral(resourceName: "Textfield")
        textF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return textF
    }()
    
    var emailTextField: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Email"
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.textColor = UIColor.black
        textF.font = UIFont.systemFont(ofSize: 15)
        textF.borderStyle = .none
        textF.layer.cornerRadius = 5.0
        textF.keyboardType = UIKeyboardType.emailAddress
        textF.background = #imageLiteral(resourceName: "Textfield")
        textF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return textF
    }()
    
    var passwordTextField: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Password"
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.textColor = UIColor.black
        textF.font = UIFont.systemFont(ofSize: 15)
        textF.borderStyle = .none
        textF.layer.cornerRadius = 5.0
        textF.keyboardType = UIKeyboardType.emailAddress
        textF.background = #imageLiteral(resourceName: "Textfield")
        textF.isSecureTextEntry = true
        textF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return textF
    }()
    var confirmPasswordTextField: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Confirm Password"
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.textColor = UIColor.black
        textF.font = UIFont.systemFont(ofSize: 15)
        textF.borderStyle = .none
        textF.layer.cornerRadius = 5.0
        textF.keyboardType = UIKeyboardType.emailAddress
        textF.background = #imageLiteral(resourceName: "Textfield")
        textF.isSecureTextEntry = true
        textF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return textF
    }()
    
    let signUpButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "Button"), for: .normal)
        button.setTitle("Go", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.gray, for: .disabled)
        button.layer.cornerRadius = 5.0
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignUpButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad(){
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleDismissButton))
        
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(signUpButton)
        
        setUpTextFieldsConstrains()
        setUpSignUpBottom()
        
        
    }
    
    
    func setUpTextFieldsConstrains() {
        nameTextField.widthAnchor.constraint(equalToConstant: 268).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalToConstant: 268).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        passwordTextField.widthAnchor.constraint(equalToConstant: 268).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 268).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 93).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 33).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 33).isActive = true
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 33).isActive = true
    }
    
    func setUpSignUpBottom(){
        signUpButton.widthAnchor.constraint(equalToConstant: 208).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 130).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    
    @objc func handleDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func textFieldChanged(_ target:UITextField) {
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        let name = nameTextField.text
        let formFilled = email != nil && email != "" && password != nil && password != "" && name != nil && name != "" && confirmPassword != nil && confirmPassword != ""
        
        if formFilled == true {
            if password == confirmPassword{
                if (password?.count)! > 7 {
                    setSignUpButtonEnabled(enabled: true)
                }
            }
        }
    }
    
    func setSignUpButtonEnabled(enabled:Bool) {
        if enabled {
            signUpButton.alpha = 1.0
            signUpButton.isEnabled = true
            
        } else {
            signUpButton.alpha = 0.5
            signUpButton.isEnabled = false
        }
        print(signUpButton.isEnabled)
    }
    
    @objc func handleSignUpButton() {
        
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
        nameTextField.isEnabled = false
        confirmPasswordTextField.isEnabled = false
        signUpButton.setTitle("", for: .normal)
        setSignUpButtonEnabled(enabled: false)
        activityView?.startAnimating()
        
        handleRegister()
        
    }
    
    func handleRegister(){
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Form is not Valid")
            return
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password,completion: { (user,error) in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: "Escribe un correo valido", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(cancel)
                self.present(alert,animated: true,completion:  nil)
                //self.returnButtonInitialState()
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            //succesfuly autebticated user
            
            
                
                //if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!){
                
                        let values = ["name" : name, "email": email]
                        self.registerUserIntoDatabaseWithUID(uid: uid, values: values as [String : AnyObject])
               
            
            
        })
        
    }
    private func registerUserIntoDatabaseWithUID(uid:String,values: [String: AnyObject]){
        let  ref = Database.database().reference()
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values,withCompletionBlock: {(err,ref)
            in
            
            if (err != nil){
                print("erral subir a base")
            }
            
            
            
            let objVC = TutorialViewController()
            self.present(objVC, animated: true, completion: nil)
        })
        
    }
    @objc func dismissKeyboard(){
        emailTextField.endEditing(false)
        nameTextField.endEditing(false)
        passwordTextField.endEditing(false)
        confirmPasswordTextField.endEditing(false)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
