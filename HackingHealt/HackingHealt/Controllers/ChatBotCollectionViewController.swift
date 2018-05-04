//
//  ChatBotCollectionViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
import Firebase
class ChatBotCollectionViewController: UICollectionViewController,UITextFieldDelegate, UICollectionViewDelegateFlowLayout{
    
    var messages = [Message]()
    
    var containerBottomAncor: NSLayoutConstraint?
    
    
    var user : User?{
        didSet{
            navigationItem.title = user?.name
            observeMessages()
        }
    }
    
    lazy var inputTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter message ..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInputComponents()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ChatMessageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.alwaysBounceVertical = true
        collectionView?.contentInset = UIEdgeInsetsMake(8, 0, 58, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 50, 0)
        collectionView?.keyboardDismissMode = .interactive
        
        setupKeyboardObservers()
        
    }
    
//    override var inputAccessoryView: UIView?{
//        get {
//            let continerView = UIView()
//            continerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
//            continerView.backgroundColor = UIColor.lightGray
//            
//            //let text
//            return continerView
//        }
//        
//    }
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    @objc func handleKeyboardWillHide(notification: NSNotification){
        containerBottomAncor?.constant = 0
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        UIView.animate(withDuration: keyboardDuration!) {
            self.view.layoutIfNeeded()
            
        }
    }
    
    @objc func handleKeyboardWillShow (notification: NSNotification){
        
        let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        
        containerBottomAncor?.constant = (-keyboardSize!.height - 40)
        UIView.animate(withDuration: keyboardDuration!) {
            self.view.layoutIfNeeded()
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height:CGFloat = 80
        if let text = messages[indexPath.item].text{
            height = estimateFrameForText(text: text).height + 25
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
    private func estimateFrameForText(text: String) -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], context: nil)
        //return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey : Any]?, context: nil)
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatMessageCell
        let message = messages[indexPath.item]
        
        setUpCell(cell: cell, message: message)
        cell.textView.text = message.text
        cell.bubbleWidthAncor?.constant = estimateFrameForText(text: message.text!).width + 32
        
        return cell
    }
    
    
    private func setUpCell(cell:ChatMessageCell,message:Message){
//        if let profileImageUrl = self.user?.profileImageUrl{
//            cell.profileImageView.loadImageUsingCacheWithUrlString(urlString: profileImageUrl)
//        }
        if message.fromId  == Auth.auth().currentUser?.uid{
            cell.bubbleView.backgroundColor = ChatMessageCell.blueColor
            cell.textView.textColor = UIColor.white
            cell.profileImageView.isHidden = true
            cell.bubbleRightAncor?.isActive = true
            cell.bubbleLeftAncor?.isActive = false
        }else {
            cell.bubbleView.backgroundColor = UIColor(r: 240, g: 240, b: 240 )
            cell.textView.textColor = UIColor.black
            cell.profileImageView.isHidden = false
            cell.bubbleRightAncor?.isActive = false
            cell.bubbleLeftAncor?.isActive = true
        }
    }
    
    func setupInputComponents() {
        
        //contenedor de los elementos
        let  containerView = UIView()
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        //constraints
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive =  true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerBottomAncor = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        containerBottomAncor?.isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //boton de enviar
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints =  false
        sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        containerView.addSubview(sendButton)
        //constraints
        sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive =  true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        
        //constraints
        containerView.addSubview(inputTextField)
        inputTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        inputTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        //separador
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(separatorLineView)
        //constraints
        separatorLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        separatorLineView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    @objc func handleSend() {
        let ref = Database.database().reference().child("messages")
        let childNode = ref.childByAutoId()
        let toId = user!.id!
        let fromId = Auth.auth().currentUser!.uid
        let timeSnap = Int(Date().timeIntervalSince1970)
        let values = ["text": inputTextField.text!,"toId": toId,"fromId": fromId,"timeSnap":timeSnap] as [String : Any]
        //childNode.updateChildValues(values)
        childNode.updateChildValues(values) { (error, ref) in
            if error != nil{
                print(error)
                return
            }
        }
        
        self.inputTextField.text = nil
        
        let userMessagesRef = Database.database().reference().child("user-messages").child(fromId)
        let messageId = childNode.key
        userMessagesRef.updateChildValues([messageId : 1])
        
        let recipientUserMessagesRef = Database.database().reference().child("user-messages").child(toId)
        recipientUserMessagesRef.updateChildValues([messageId: 1])
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleSend()
        return true
    }
    
    func observeMessages(){
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let usersMessagesRef = Database.database().reference().child("user-messages").child(uid)
        usersMessagesRef.observe(.childAdded, with: { (snapshot) in
            let messageId = snapshot.key
            let messagesRef = Database.database().reference().child("messages").child(messageId)
            messagesRef.observeSingleEvent(of: .value, with: { (snapshot) in
                guard let dictionary = snapshot.value as? [String:AnyObject] else{
                    return
                }
                let message = Message()
                message.fromId = dictionary["fromId"] as? String
                message.timeSnap = dictionary["timeSnap"] as? NSNumber
                message.text = dictionary["text"] as? String
                message.toId = dictionary["toId"] as? String
                
                
                if message.chatPartnerId() == self.user?.id{
                    self.messages.append(message)
                    
                    DispatchQueue.main.async(execute: {
                        self.collectionView?.reloadData()
                    })
                    
                }
            }, withCancel: nil)
        }, withCancel: nil)
    }
}
