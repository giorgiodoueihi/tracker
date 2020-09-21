//
//  RestructuredThought.swift
//  Tracker
//
//  Created by Giorgio Doueihi on 18/9/20.
//  Copyright © 2020 Giorgio Doueihi. All rights reserved.
//

import CoreData

@objc(RestructuredThought)
class RestructuredThought: NSManagedObject, Dateable, Identifiable {
    
    @NSManaged var identifier: UUID
    @NSManaged var timestamp: Date
    @NSManaged var isoTimestamp: String

    /// The original thought
    @NSManaged var thought: Thought
    
    /// The evidence in favour of the thought being true
    @NSManaged var evidenceFor: String?
    
    /// The evidence in favour of the thought being untrue
    @NSManaged var evidenceAgainst: String?
    
    /// The advice that one would give to a friend with the same thought
    @NSManaged var adviceToFriend: String?
    
    /// The perceived helpfulness of holding the thought to be true
    @NSManaged var perceivedHelpfulness: String?
    
    /// The restructured version of the original thought
    @NSManaged var restructuredThought: String?
    
    
    convenience init(_ thought: Thought) {
        self.init(entity: RestructuredThought.entity(), insertInto: PersistenceManager.shared.primaryContext)
        
        self.identifier = UUID()
        self.thought = thought
        self.timestamp = Date()
        self.isoTimestamp = convertToYearMonthDayString(date: timestamp)
    }

}

