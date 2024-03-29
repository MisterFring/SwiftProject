//
//  BookCollectionViewController.swift
//  swiftProject
//
//  Created by Magali Dugué on 23/02/2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class BookCollectionViewController: UICollectionViewController {
    
    var books = [Book]()
    
    
  
    
    private let concurrentDispatchQueue = DispatchQueue(label: "concurrent queue", attributes: .concurrent)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.pickRandomBookId()
        ApiManager.shared.pickRandomBookId()
        ApiManager.shared.pickRandomBookId()
        ApiManager.shared.pickRandomBookId()
        ApiManager.shared.pickRandomBookId()
        
        
        books = DataManager.shared.loadData()!

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
 
        
    
        
       


        // Do any additional setup after loading the view.
    }
    
    
   
    
    private func dl(using dispatchQueue : DispatchQueue){
        
       
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return books.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        as! BookCollectionViewCell
        
        
        

        let url1 = URL(string: "https://covers.openlibrary.org/b/id/240727-S.jpg")
      
        concurrentDispatchQueue.async {
            [weak self] in
            
            DispatchQueue.main.async {
                //self?.image1.image = image
                cell.imageView.load(url: (self?.books[indexPath.row].coverUrl ?? url1)!)
                //self?.activityIndicatorView1.stopAnimating()
            }
        }
      

        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
