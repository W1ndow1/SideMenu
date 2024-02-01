//
//  SideMenuHeaderView.swift
//  SideMenu
//
//  Created by window1 on 1/22/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 50, height: 50)
                .background(LinearGradient(colors: [.blue, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            VStack(alignment: .leading, spacing: 6) {
                Text("GokmulCookie")
                    .font(.subheadline)
                Text("w1ndow1@gmail.com")
                    .font(.footnote)
                    .tint(.gray)
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
