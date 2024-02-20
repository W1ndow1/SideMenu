//
//  HomeView.swift
//  SideMenu
//
//  Created by window1 on 1/24/24.
//
import SwiftUI

struct HomeView: View {
    @State private var showMenu = false
    @State private var showMessage = false
    @State private var showHelpCenter = false
    @State private var selectedView: [SideMenuOptionModel] = []
    
    var body: some View {
        NavigationStack(path: $selectedView) {
            ZStack {
                SideMenuView(isShowing: $showMenu, selectedView: $selectedView)
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
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showHelpCenter.toggle()
                    } label: {
                        Image(systemName: "questionmark.app")
                    }
                    .fullScreenCover(isPresented: $showHelpCenter, content: {
                        HelpCenterView.init()
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showMessage.toggle()
                    } label: {
                        Image(systemName: "paperplane")
                    }
                    .fullScreenCover(isPresented: $showMessage, content: {
                        DirectMessageView.init()
                    })
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
