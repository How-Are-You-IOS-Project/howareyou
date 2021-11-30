//
//  LoginViewController.swift
//  howareyou
//
//  Created by Wang Ruifan on 11/28/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func onLogin(_ sender: Any) {
//        self.performSegue(withIdentifier: "loginSegue", sender: nil)
//    }
    
    @IBAction func onLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
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
