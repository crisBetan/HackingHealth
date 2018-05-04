//
//  TutorialViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    let imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.black
        //image.image =
        return image
    }()
    
    let responseLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Respuesta Chida"
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = UIColor.lightGray
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    let responseTextField: UITextField = {
        let response = UITextField()
        response.translatesAutoresizingMaskIntoConstraints = false
        response.textColor = UIColor.black
        response.borderStyle = .roundedRect
        response.font = UIFont.systemFont(ofSize: 12)
        response.layer.cornerRadius = 5.0
        //response.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        response.keyboardType = .default
        return response
    }()
    
    let textFContainerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    let sendButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "sendButtonImage"), for: .normal)
        //button.setTitle("Login", for: .normal)
        button.isEnabled = true
        
        //button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        
        
        view.addSubview(imagePerson)
        view.addSubview(responseLabel)
        view.addSubview(textFContainerView)
        textFContainerView.addSubview(responseTextField)
        textFContainerView.addSubview(sendButton)
        
        setUpImageView()
        setUpResponseLabel()
        setUpContainerView()
        setUpTextField()
        setUpSendButton()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //responseTextField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }
    
    @objc func keyboardWillAppear(notification: NSNotification){
        
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        textFContainerView.center = CGPoint(x: view.center.x,
                                            y: view.frame.height - keyboardFrame.height -  textFContainerView.frame.height/2)
    }
    
    
    func setUpImageView() {
        imagePerson.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imagePerson.heightAnchor.constraint(equalTo: imagePerson.widthAnchor).isActive = true
        imagePerson.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 52).isActive = true
        imagePerson.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imagePerson.layer.cornerRadius = 90
    }
    
    func setUpResponseLabel() {
        responseLabel.widthAnchor.constraint(equalToConstant: 252).isActive = true
        responseLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        responseLabel.topAnchor.constraint(equalTo: imagePerson.bottomAnchor, constant: 37).isActive = true
        responseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        responseLabel.layer.cornerRadius = 17
        responseLabel.clipsToBounds = true
    }
    
    func setUpContainerView(){
        textFContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        textFContainerView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        textFContainerView.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
    }
    
    func setUpTextField(){
        responseTextField.widthAnchor.constraint(equalToConstant: 285).isActive = true
        responseTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        responseTextField.leftAnchor.constraint(equalTo: textFContainerView.leftAnchor, constant: 12).isActive = true
        responseTextField.bottomAnchor.constraint(equalTo: textFContainerView.bottomAnchor, constant: -11).isActive = true
    }
    
    func setUpSendButton(){
        sendButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        sendButton.heightAnchor.constraint(equalTo: sendButton.widthAnchor).isActive = true
        sendButton.rightAnchor.constraint(equalTo: textFContainerView.rightAnchor, constant: -20).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: textFContainerView.bottomAnchor, constant: -11).isActive = true
        sendButton.layer.cornerRadius = 15
    }
    
    
    
    
    
}
