//
//  DirectMessageView.swift
//  SideMenu
//
//  Created by window1 on 1/24/24.
//

import SwiftUI

struct DirectMessageView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var selectedGroupID: Int?
    @State private var selectedIndex = 0
    @State private var buttonWidth: CGFloat = 0
    private let sample = SampleData()
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Array(sample.group.enumerated()), id: \.element.id) { index, data in
                            Button {
                                selectedGroupID = data.id
                                selectedIndex = index
                            } label: {
                                    Text("\(data.name)")
                            }
                            .fontWeight(.bold)
                            .padding(8)
                            .foregroundStyle(selectedIndex == index ? Color.white : Color.black)
                            .background(selectedIndex == index ? Color.black : Color.white)
                            .clipShape(Capsule())
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.leading, 20)
            
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.pink)
                    .frame(width: 300 / CGFloat(sample.group.count), height: 4)
                    .offset(x: CGFloat(selectedIndex) * 300 / CGFloat(sample.group.count))
            }
            .frame(height:4)
            .padding(.leading)
            
            List {
                ForEach(filteredArtist) { artist in
                    Text("\(artist.name)")
                }
                
            }
            
            .scrollIndicators(.visible)
            .searchable(text: $searchText)
            .navigationTitle("Direct Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundStyle(.foreground)
                    }
                }
            }
        }
    }
    
    var filteredArtist: [Artist] {
        if let selectedGroupID = selectedGroupID {
            return sample.member.filter { $0.groupID == selectedGroupID }
        } else {
            return sample.member.filter { $0.groupID == 180124 }
        }
    }
}


#Preview {
    DirectMessageView()
}
