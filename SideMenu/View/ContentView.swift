//
//  ContentView.swift
//  SideMenu
//
//  Created by window1 on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab){
                    Text("대시보드")
                        .tag(0)
                    Text("성능")
                        .tag(1)
                    Text("프로필")
                        .tag(2)
                    Text("검색")
                        .tag(3)
                    Text("알림")
                        .tag(3)
                }
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
