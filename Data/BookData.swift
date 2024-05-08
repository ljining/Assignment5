//
//  BookData.swift
//  BookSearching
//
//  Created by 이유진 on 5/7/24.
//

import Foundation

struct BookData: Decodable {
    
    let documents: [Document]

}


struct Document: Decodable {
    
    let authors: [String]
    let contents: String
    let price: Int
    let publisher: String
    let thumbnail: String
    let title: String
    let translators: [String]
    let url: String


    enum CodingKeys: String, CodingKey {
        case authors
        case contents
        case price
        case publisher
        case thumbnail
        case title
        case translators
        case url
    }
    
}

struct Meta: Decodable {
    let isEnd: Bool
    let pageableCount: Int
    let totalCount: Int
    
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
