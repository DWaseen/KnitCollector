//
//  KnitViewController.swift
//  KnitCollector
//
//  Created by Dan Waseen on 11/29/16.
//  Copyright © 2016 RevWon. All rights reserved.
//

import UIKit

class KnitViewController: UIViewController,  UIImagePickerControllerDelegate,  UINavigationControllerDelegate
{
    @IBOutlet weak var knitImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var knitPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        knitPicker.delegate = self
    }


    @IBAction func knitsTapped(_ sender: AnyObject) {
        
        knitPicker.sourceType = .photoLibrary
        present(knitPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        knitImageView.image = image
        
        knitPicker.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func cameraTapped(_ sender: AnyObject) {
    }
    
    
    @IBAction func addTapped(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let knit = Knits(context: context)
        knit.title = titleTextField.text
     
        knit.image = UIImagePNGRepresentation(knitImageView.image!) as NSData!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}