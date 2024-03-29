//
//  DataManager.swift
//  swiftProject
//
//  Created by Pierre Decrock on 24/02/2022.
//

import Foundation

class DataManager {
    // singleton
    static let shared = DataManager()
    private init(){}
    
    var books : [Book] = [
        Book(title: "aaaaa", coverUrl: URL(string: "ddddd")!, description: "eeeee", authors: ["a", "b"], publicationDate: "dddddd"),
        Book(title: "zefzerfrez", coverUrl: URL(string: "ddddd")!, description: "eeeee", authors: ["zzzzzz", "zzzzzz"], publicationDate: "dddddd")
    ]
    
    func writeData(data : [Book]){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(books), forKey:"favBooks")
    }
    
    func insertBook(data : Book) {
        var existingsBooks : [Book] = loadData()!
        existingsBooks.append(data)
        writeData(data: existingsBooks)
        
    }
    
    func loadData() -> Array<Book>? {
        var favbooks : Array<Book> = []
        if let data = UserDefaults.standard.value(forKey:"favBooks") as? Data {
             favbooks = try! PropertyListDecoder().decode(Array<Book>.self, from: data)
            
            //print("livres favoris : \(favbooks!)")
            //for favbook in favbooks! {
                //print("livre fav : \(favbook)")
            //}
        }
        return favbooks
    }
    
    
}
