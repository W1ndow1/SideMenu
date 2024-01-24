//
//  ContentView.swift
//  SideMenu
//
//  Created by window1 on 1/22/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    @State private var selectedView: [SideMenuOptionModel] = []
    
    var body: some View {
        NavigationStack(path: $selectedView) {
            ZStack {
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab, selectedView: $selectedView)
            }
            .navigationDestination(for: SideMenuOptionModel.self) { view in
                switch view {
                case .dashboard:
                    DashBoardView()
                case .performance:
                    PerformanceView()
                case .profile:
                    ProfileView()
                case .search:
                    SearchView()
                case .notifications:
                    NotificationView()
                }
                
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle("홈")
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
    HomeView()
}
