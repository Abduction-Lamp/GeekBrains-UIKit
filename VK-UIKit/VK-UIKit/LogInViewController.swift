//
//  ViewController.swift
//  VK-UIKit
//
//  Created by Лесных Владимир on 03.02.2021.
//

import UIKit


class LogInViewController: UIViewController {

    //  MARK:   - Outlet
    //
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonSignIn: UIButton!
    
    
    
    //  MARK:   - Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        
        self.mainScrollView?.addGestureRecognizer(hideKeyboardGesture)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    
    //  MARK:   - Methods
    //
    @objc func keyboardWasShown(notification: Notification) {
        
        guard let info = notification.userInfo as NSDictionary? else {
            return
        }
        
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsert = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        self.mainScrollView?.contentInset = contentInsert
        self.mainScrollView?.scrollIndicatorInsets = contentInsert
    }
    
    
    @objc func keyboardWillBeHidden(notification: Notification) {
    
        self.mainScrollView?.contentInset = UIEdgeInsets.zero
    }
    
    
    @objc func hideKeyboard() {
        
        self.mainScrollView?.endEditing(true)
    }
    
    
    func checkUserData() -> Bool {
        
        var successful = false

        guard let login = loginTextField.text,
              let password = passwordTextField.text else {
            return false
        }
        
        if login == "admin" && password == "123456" {
            loginTextField.text = ""
            passwordTextField.text = ""
            successful = true
            
            MyGroupsTableViewController.myGroups = getMyGroupData()
        } else {
            successful = false
//            MyGroupsTableViewController.myGroups = getMyGroupData()
        }
        
        // FIXME:
        return true
//        return successful
    }
    
    
    func showMessageLoginError() {
        let alert = UIAlertController(title: "Ощибка входа", message: "Неверный логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let successful = checkUserData()
        
        guard successful else {
            showMessageLoginError()
            return successful
        }
        return successful
    }
    
    
    //  MARK:   - Actions
    //
    @IBAction func singinTouchUp(_ sender: UIButton) {

    }
    
}

