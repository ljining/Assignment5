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
    
    
    func createBookmark(title: String, authors: String, price: Int, summary: String, thumbnail: String) {
        let bookmark = Bookmark(context: context)
        bookmark.title = title
        bookmark.authors = authors
        bookmark.price = Int64(price)
        bookmark.summary = summary
        bookmark.thumbnail = thumbnail
        
        saveContext()
    }
    
    func fetchBookmark() -> [Bookmark] {
        let fetchRequest: NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error")
            return []
        }
    }
    
    func deleteBook(bookmark: Bookmark) {
        context.delete(bookmark)
        saveContext()
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
