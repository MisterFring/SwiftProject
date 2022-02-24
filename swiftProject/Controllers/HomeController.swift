//
//  ViewController.swift
//  swiftProject
//
//  Created by Pierre Decrock on 21/02/2022.
//

import UIKit



class HomeController: UIViewController {
    
  

    @IBOutlet weak var coverImageView: UIImageView!
    
        
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
               tapGestureRecognizer.numberOfTapsRequired = 2
               self.coverImageView.isUserInteractionEnabled = true
               self.coverImageView.addGestureRecognizer(tapGestureRecognizer)
        
        
        ApiManager.shared.fetchBook(bookId : "OL45883W", { book in
            print(book)
            self.coverImageView.load(url: book.coverUrl)
        })
        // Do any additional setup after loading the view.
    }

    @IBAction func dislikeButton(_ sender: Any) {
    }
    
    @IBAction func likeButton(_ sender: Any) {
    }
    @objc func didTap(sender : UITapGestureRecognizer){
        print("on est passé ici")
         if let vc = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(identifier:"Details") as? DetailsViewController{
             self.navigationController?.pushViewController(vc, animated: true)
            
        }
}
}
