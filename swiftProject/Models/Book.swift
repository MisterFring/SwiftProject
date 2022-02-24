//
//  Book.swift
//  swiftProject
//
//  Created by Pierre Decrock on 23/02/2022.
//

import Foundation

struct Book {
    let title:String
    let coverUrl:URL
    let description:String
    var authors:[String] = []
    let publicationDate:String
}

struct Author {
    let name:String
}

extension Book {
    init?(json: [String: AnyObject]) {
        guard let title = json["title"] as? String,
              let coverId = json["covers"]![1] as? Int,//json["coordinates"] as? String,
            let description = json["description"] as? String,
            let authors = json["authors"] as? [[String:AnyObject]]//getAuthors(authorsArray: json["authors"] as? [[String:AnyObject]]),
            //let publicationDate = json["created"]["value"] as? String
        else {
            return nil
        }
        
        self.coverUrl = ApiManager.shared.getCoverUrl(coverId: String(coverId))
        
        //var authorsId = getAuthors(authorsArray: authors)
        var authorsArray : [String]!
        for authorObj in authors {
            guard let author = authorObj["author"]
            else {
                return nil
            }
            let authorUrl = (author["key"]) as? String ?? "N/A"
            let authorId = authorUrl.components(separatedBy: "/")[2]
            //let authorName = ApiManager.shared.getAuthorInfo(authorId: authorId)
            
            ApiManager.shared.getAuthorInfo(authorId: authorId, { authorName in
                print("authorName : \(authorName)")
                //authorsArray.append(authorName)
            })
        }
        self.title = title
        self.description = description
        self.publicationDate = ""
    }
    
    
}
