//
//  MenuOptionModel.swift
//  SideMenu
//
//  Created by window1 on 1/23/24.
//

import Foundation
import SwiftUI

enum SideMenuOptionModel: Int, CaseIterable {
    case dashboard
    case performance
    case profile
    case search
    case notifications
    
    var title: String {
        switch self {
        case .dashboard:
            return "대시보드"
        case .performance:
            return "성능"
        case .profile:
            return "프로필"
        case .search:
            return "검색"
        case .notifications:
            return "알림"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .dashboard:
            return "filemenu.and.cursorarrow"
        case .performance:
            return "chart.bar"
        case .profile:
            return "person"
        case .search:
            return "magnifyingglass"
        case .notifications:
            return "bell"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int { return self.rawValue }
    
}
