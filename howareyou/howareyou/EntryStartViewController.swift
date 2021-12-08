//
//  EntryStartViewController.swift
//  howareyou
//
//  Created by Meng-Chuan Chang on 12/7/21.
//

import UIKit
import Parse

class EntryStartViewController: UIViewController {

    @IBOutlet weak var nameField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userName = PFUser.current()!["name"] as? String ?? "user"
        self.nameField.text = "Hi " + userName + ","
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()

        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginRegisterViewController = main.instantiateViewController(withIdentifier: "LoginRegisterViewController")

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}

        delegate.window?.rootViewController = loginRegisterViewController
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
