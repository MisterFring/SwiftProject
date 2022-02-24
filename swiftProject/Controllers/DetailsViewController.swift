//
//  DetailsViewController.swift
//  swiftProject
//
//  Created by eliott LISLE on 23/02/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBAction func Amazonbutton(_ sender: Any) {
        if let vc = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(identifier:"WebView") as? WebViewController{
        self.present(vc, animated: true)
        
    }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
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


