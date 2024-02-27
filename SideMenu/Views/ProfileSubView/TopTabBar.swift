//
//  TopTabBar.swift
//  SideMenu
//
//  Created by window1 on 2/22/24.
//

import SwiftUI

struct TopTabBar: View {
    @Binding var tabIndex: Int
    var body: some View {
        HStack(spacing: 20) {
            TabBarButton(title: "세부사항", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            TabBarButton(title: "결제내역", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            Spacer()
        }
        .border(width: 1, edges: [.bottom], color: .black)
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation {
            tabIndex = index
        }
    }
}

struct TabBarButton: View {
    let title: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(title)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.custom("Avenir", size: 16))
            .padding(.bottom, 10)
            .border(width: isSelected ? 2 : 0 , edges: [.bottom], color: .black)
    }
}

#Preview {
    TopTabBar(tabIndex: .constant(0))
}
