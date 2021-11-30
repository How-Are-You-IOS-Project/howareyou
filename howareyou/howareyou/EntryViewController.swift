//
//  EntryViewController.swift
//  howareyou
//
//  Created by Wang Ruifan on 11/28/21.
//

import UIKit
import Parse
import AlamofireImage 

class EntryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var thought: UITextField!
    @IBOutlet weak var gratitude: UITextField!
    @IBOutlet weak var moods: UISegmentedControl!
    @IBOutlet weak var answer: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCamera(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 100, height: 100)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let entry = PFObject(className: "Entries")
        // change the following to PFUser.current()
        entry["user_id"] = 0
        entry["mood"] = moods.selectedSegmentIndex
        entry["question_id"] = "r5kVtTPuBk"
        entry["answer_index"] = answer.selectedSegmentIndex
        entry["thought_today"] = thought.text!
        entry["gratitude_today"] = gratitude.text!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        entry["picture_today"] = file
        
        entry.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved")
            } else {
                print("error!")
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
