//
//  RegisterViewController.swift
//  howareyou
//
//  Created by Meng-Chuan Chang on 12/7/21.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

//    nameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let user = PFUser()
        
//        user["name"] = nameField.text
        user.username = usernameField.text
        user.password = passwordField.text
        
//        print(user.username ?? "No username input")
//        print(user.password ?? "No password input")
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "registerSegue", sender: nil)
            } else {
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
