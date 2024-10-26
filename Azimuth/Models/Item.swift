//
//  Item.swift
//  Azimuth
//
//  Created by Joseph DeWeese on 10/26/24.
//

import SwiftUI
import SwiftData

@Model
final class Item {
    /// Properties
    var timestamp: Date
    var title: String = ""
    var remarks: String = ""
    var dateAdded: Date = Date.now
    var startDate: Date = Date.distantPast
    var completeDate: Date = Date.distantPast
    var category: String
    var status: Status.RawValue = Status.onShelf.rawValue
    var tintColor: String
    var enableRemainder: Bool = false
    var remainderID: String = ""
    
    @Relationship(deleteRule: .cascade)
    var activityUpdate: [ActivityUpdate]?
    
    @Relationship(inverse: \Tag.items)
    var tags: [Tag]?
    
    init(
        timestamp: Date,
        title: String,
        remarks: String,
        dateAdded: Date,
        startDate: Date,
        completeDate: Date,
        category: String,
        status: Status = .onShelf,
        tintColor: String,
        enableRemainder: Bool = false,
        remainderID: String = "",
        activityUpdate: [ActivityUpdate]? = nil,
        tags: [Tag]? = nil
    ) {
        self.timestamp = timestamp
        self.title = title
        self.remarks = remarks
        self.dateAdded = dateAdded
        self.startDate = startDate
        self.completeDate = completeDate
        self.category = category
        self.status = status.rawValue
        self.tintColor = tintColor
        self.enableRemainder = enableRemainder
        self.remainderID = remainderID
        self.activityUpdate = activityUpdate
        self.tags = tags
    }
    var icon: Image {
        switch Status(rawValue: status)! {
        case .onShelf:
            Image(systemName: "checkmark.diamond.fill")
        case .inProgress:
            Image(systemName: "book.fill")
        case .completed:
            Image(systemName: "books.vertical.fill")
        }
    }
enum Status: Int, Codable, Identifiable, CaseIterable {
    case onShelf, inProgress, completed
    var id: Self {
        self
    }
    var descr: LocalizedStringResource {
        switch self {
        case .onShelf:
            "On Shelf"
        case .inProgress:
            "In Progress"
        case .completed:
            "Completed"
        }
    }
}

/// Extracting Color Value from tintColor String
@Transient
var color: Color {
    return tints.first(where: { $0.color == tintColor })?.value ?? Constants.shared.tintColor
}

@Transient
var tint: TintColor? {
    return tints.first(where: { $0.color == tintColor })
}

@Transient
var rawCategory: Category? {
    return Category.allCases.first(where: { category == $0.rawValue })
}
}

