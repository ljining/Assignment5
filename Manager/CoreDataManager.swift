//
//  CoreDataManager.swift
//  BookSearching
//
//  Created by 이유진 on 5/7/24.
//

import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BookSearching")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Create 코어 데이터에 새로운 책 정보 추가
    func createBookmark(bookData: BookData) {
        let bookmark = Bookmark(context: context)
        bookmark.title = bookData.documents[0].title
        bookmark.authors = bookData.documents[0].authors.joined(separator: ", ")
        bookmark.price = Int64(bookData.documents[0].price)
        bookmark.summary = bookData.documents[0].contents
        bookmark.thumbnail = bookData.documents[0].thumbnail
        
        saveContext()
    }
    
    // Read 코어 데이터로부터 책 정보 가져옴
    func readBookmark() -> [Bookmark] {
        let fetchRequest: NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error")
            return []
        }
    }
    
    // Update 코어 데이터 변경 사항 저장
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // Delete 코어 데이터에서 책 정보 삭제
    func deleteBookmark(bookmark: Bookmark) {
        context.delete(bookmark)
        saveContext()
    }

    
}
