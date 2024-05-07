//
//  NetworkController.swift
//  BookSearching
//
//  Created by 이유진 on 5/7/24.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchBookAPI(query: String, completion: @escaping (Result<BookData, Error>) -> Void) {
        
        // REST API key
        let restApiKey = "3e206b7dcb54a5bb0ea265da1ae61014"
        
        // URL 만들기
        guard var url = URLComponents(string: "https://dapi.kakao.com/v3/search/book") else { return }
        
        // query 파라미터 설정하기
        url.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        
        guard let url = url.url else { return }
        
        // URL 요청하기
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("KakaoAK \(restApiKey)", forHTTPHeaderField: "Authorization")
        
        // task 만들기
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            //데이터 파싱
            do {
                guard let data = data else {
                    completion(.failure(NSError(domain: "Data is nil", code: 0, userInfo: nil)))
                    return
                }
                
                let decoder = JSONDecoder()
                let bookData = try decoder.decode(BookData.self, from: data)
                print("Book Research Result", bookData)
                completion(.success(bookData))
            } catch {
                print("Decoding Error:", error)
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
