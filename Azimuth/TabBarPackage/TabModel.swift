//
//  TabModel.swift
//  Azimuth
//
//  Created by Joseph DeWeese on 10/26/24.
//

import SwiftUI

/// App Tab's
enum Tab: String, CaseIterable {
    case grind = "Grind"
    case projects = "Objectives"
    case objectives = "Tasks"
    case notes = "Notes"
  
    
    
    var systemImage: String {
        switch self {
        case .grind:
            return "mug.fill"
        case .projects:
            return "location.north.circle"
        case .objectives:
            return "checkmark.circle"
        case .notes:
            return "square.and.pencil.circle"
      
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}




