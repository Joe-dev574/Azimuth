//
//  ActivityUpdate.swift
//  Azimuth
//
//  Created by Joseph DeWeese on 10/26/24.
//

import Foundation
import SwiftData

@Model
class ActivityUpdate {
    var creationDate: Date = Date.now
    var text: String = ""
    var page: String? = ""
    
    init(text: String, page: String? = nil) {
        self.text = text
        self.page = page
    }
    
    var item: Item?
}

