//
//  BookData.swift
//  BookSearching
//
//  Created by 이유진 on 5/7/24.
//

import Foundation

struct BookModel: Decodable {
    
    let documents: [Document]
    let meta: Meta
}


struct Document: Decodable {
    
    let authors: [String]
    let contents: String
    let price: Int
    let publisher: String
    let thumbnail: String
    let title: String


    enum CodingKeys: String, CodingKey {
        case authors
        case contents
        case price
        case publisher
        case thumbnail
        case title
    }
    
}

struct Meta: Decodable {
    let isEnd: Bool
    let pageableCount: Int
    let totalCount: Int
    
    enum Codingkeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
