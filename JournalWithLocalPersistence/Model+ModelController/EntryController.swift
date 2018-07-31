//
//  EntryController.swift
//  JournalWithLocalPersistence
//
//  Created by Seth Danner on 7/30/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation


class EntryController {
    
    let shared = EntryController()
    var entries: [Entry] = []
    
    // MARK: CRUD Functions
    func addNewEntryWith(title: String, bodyText: String) {
        
        let newEntry = Entry(title: title, bodyText: bodyText)
        entries.append(newEntry)
    }
    
    func updateEntry(entry: Entry, title: String, bodyText: String) {
        
        let entry = Entry(title: title, bodyText: bodyText)
        entry.title = title
        entry.bodyText = bodyText
    }
    
    func deleteEntry(entry: Entry) {
        
        guard let index = self.entries.index(of: entry) else { return }
        self.entries.remove(at: index)
    }
    
    // MARK: Persistence
    func fileURL() -> URL {
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fullURL = path.appendingPathComponent("entry").appendingPathExtension("json")
        return fullURL
    }
    
    func save() {
        
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving entry: \(error)")
        }
    }
    
    func load() -> [Entry] {
        
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try jsonDecoder.decode([Entry].self, from: data)
            return entries
        } catch let error {
            print("Error loding entries: \(error)")
        }
        return []
    }
}
