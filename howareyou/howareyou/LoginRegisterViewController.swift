//
//  LoginRegisterViewController.swift
//  howareyou
//
//  Created by Meng-Chuan Chang on 11/28/21.
//

import UIKit

class LoginRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func toLoginPage(_ sender: Any) {
        self.performSegue(withIdentifier: "loginPageSegue", sender: nil)
    }
    
    @IBAction func toRegisterPage(_ sender: Any) {
        self.performSegue(withIdentifier: "registerPageSegue", sender: nil)
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
