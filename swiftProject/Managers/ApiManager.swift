//
//  ApiManager.swift
//  swiftProject
//
//  Created by Pierre Decrock on 23/02/2022.
//

import Foundation

class ApiManager {
    // singleton
    static let shared = ApiManager()
    private init(){}
    //let baseUrlApi = "https://openlibrary.org/works/OL45883W.json"
    
    //var booksIdArray = [String]?
    
    func fetchBook(bookId : String,_ completion: @escaping (Book) -> ()){
//        var myBook : Book = Book(title: "titleuzherfez", coverUrl: "", description: "", authors: "", publicationDate: "3425465767")
        var myBook:Book!
        let url = URL(string: "https://openlibrary.org/works/\(bookId).json")!
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        myBook = Book.init(json: data)!
                        completion(myBook)
//                        print(data["title"]!)
//                        var tt = data["title"]!
//                        book.title = data["title"] as String?
//                        let coverId = data["covers"][1]!
//                        book.coverUrl = retrieveCoverUrl(coverId: coverId)
                    }
                }
            }
        }
        task.resume()
    }
    
    func getAuthorInfo(authorId : String, _ completion: @escaping (String) -> ()){
        var authorName : String = ""
        let url = URL(string: "https://openlibrary.org/authors/\(authorId).json")!
        
            print("AZERTYUIOP / \(url)")
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        authorName = (data["name"] as? String)!
                        completion(authorName)
                    }
                }
            };
        })
        task.resume()
//        print("DDDDDDDDDD : \(authorName)")
//        return authorName
    }
    
    func getCoverUrl(coverId : String) -> URL{
        return URL(string: "https://covers.openlibrary.org/b/id/\(coverId).jpg")!
    }
}
