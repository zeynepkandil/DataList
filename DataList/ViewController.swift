//
//  ViewController.swift
//  DataList
//
//  Created by Kafein on 8.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var names = [String]()
    
    @IBOutlet weak var nameText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addClicked(_ sender: Any) {
        if let text = nameText.text {
            if text.count < 4 {
                makeAlert(title: "Error!", message: "Try Again")
            } else {
                names.append(text)
                makeAlert(title: "Success", message: "Added")
            }
        }
        
    }
   
    
    @IBAction func goListClicked(_ sender: Any) {
        if names.count > 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
            vc.names = names
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            makeAlert(title: "Error!", message: "Try Again")
        }
    }
    
    
    func makeAlert (title : String,message : String){
        
        let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

