//
//  Entry.swift
//  JournalWithLocalPersistence
//
//  Created by Seth Danner on 7/30/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import Foundation

class Entry: Codable {
    
    var title: String
    var bodyText: String
    var timestamp: Date
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
        self.timestamp = Date()
    }
}

extension Entry: Equatable {
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText && lhs.timestamp == rhs.timestamp
    }
}
