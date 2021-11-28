//
//  LoginViewController.swift
//  howareyou
//
//  Created by Meng-Chuan Chang on 11/28/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
//        print(username ?? "No username input")
//        print(password ?? "No password input")
        
        PFUser.logInWithUsername(inBackground: username, password: password)
            {(user, error) in
            if user != nil {
                // Do stuff after successful login.
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                // The login failed. Check error to see why.
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
