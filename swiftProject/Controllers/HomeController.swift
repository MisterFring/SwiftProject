//
//  ViewController.swift
//  swiftProject
//
//  Created by Pierre Decrock on 21/02/2022.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.fetchBook(bookId : "OL45883W", { book in
            print(book)
            DispatchQueue.main.async {
                self.coverImageView.load(url: book.coverUrl)
                self.titleLabel.text = book.title
            }
            
            
            
//            let encoder = PropertyListEncoder()
//            encoder.outputFormat = .xml
//
////            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("FavoriteBooks.plist")
////            let test = Bundle.main.path(forResource: "FavoriteBooks", ofType: "plist")
//            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
//            let documentsDirectory = paths.object(at: 0) as! NSString
//            let path = documentsDirectory.appendingPathComponent("FavoriteBooks.plist")
//
//            do {
//            let data = try encoder.encode(book)
//            try data.write(to: URL(fileURLWithPath: path))
//            } catch {
//            print(error)
//            }

        })
        
    }

    @IBAction func dislikeButton(_ sender: Any) {
    }
    
    @IBAction func likeButton(_ sender: Any) {
    }
}

