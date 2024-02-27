//
//  ProfileView.swift
//  SideMenu
//
//  Created by window1 on 1/23/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var tabIndex = 0
    var body: some View {
        VStack {
            TopTabBar(tabIndex: $tabIndex)
            switch tabIndex {
            case 0:
                DetailProfileView()
            case 1:
                PaymentHistoryView()
            default:
                DetailProfileView()
            }
            Spacer()

        }
        .padding(.horizontal, 12)
        .navigationTitle("프로필")
    }
}

#Preview {
    ProfileView()
}
