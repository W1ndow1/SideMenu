//
//  MovingTabModel.swift
//  SideMenu
//
//  Created by window1 on 1/25/24.
//

import Foundation

struct FilterGroup: Identifiable {
    var id: Int
    var name: String
    var member: [Artist] = []
    
    init(id: Int ,name: String) {
        self.id = id
        self.name = name
    }
}

struct Artist: Identifiable {
    var name: String
    var id: Int
    var groupName: String
    var groupID: Int
    var brithDay: String
}

struct SampleData{
    let group: [FilterGroup] = [
        FilterGroup(id: 180124, name: "fromis_9"),
        FilterGroup(id: 190001, name: "CHUU"),
        FilterGroup(id: 190002, name: "JANG GYU RI"),
        
    ]
    let member: [Artist] = [
        Artist(name: "이서연", id: 113901, groupName: "fromis_9", groupID: 180124, brithDay: "2000-01-22"),
        Artist(name: "이나경", id: 113902, groupName: "fromis_9", groupID: 180124, brithDay: "2000-06-01"),
        Artist(name: "이채영", id: 113903, groupName: "fromis_9", groupID: 180124, brithDay: "2000-05-14"),
        Artist(name: "백지헌", id: 113904, groupName: "fromis_9", groupID: 180124, brithDay: "2003-04-17"),
        Artist(name: "츄", id: 310001, groupName: "CHUU", groupID: 190001, brithDay: "1999-10-20"),
        Artist(name: "장규리", id: 310002, groupName: "JANG GYU RI", groupID: 190002, brithDay: "1997-12-27"),
    ]
    
}

extension String {
    static func stringConvertDate(_ value: String, _ format: String) -> Date {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = format
        dateFomatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFomatter.date(from: value) else { return Date.now }
        return date
    }
}
