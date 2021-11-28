//
//  EntryViewController.swift
//  howareyou
//
//  Created by Meng-Chuan Chang on 11/28/21.
//

import UIKit
import Parse

class EntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()

        let main = UIStoryboard(name: "Main", bundle: nil)
        let startPageViewController = main.instantiateViewController(withIdentifier: "startPageViewController")

//        Older Version
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//
//        delegate.window?.rootViewController = loginViewController

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}

        delegate.window?.rootViewController = startPageViewController
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
