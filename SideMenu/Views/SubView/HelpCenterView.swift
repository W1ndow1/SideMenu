//
//  HelpCenterView.swift
//  SideMenu
//
//  Created by window1 on 2/19/24.
//

import SwiftUI
import WebKit

struct HelpCenterView: View {

    @Environment(\.dismiss) var dismiss
    @State private var isPresentWebView = false
    @State private var webViewData = WebViewData()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Button {
                    isPresentWebView = true
                    webViewData.functionCaller.send(
                    """
                    document.querySelector("button[id^='playbut']).click()
                    """
                    )
                } label: {
                    Image(systemName: "person.fill.questionmark")
                        .font(.system(size: 30))
                        .foregroundStyle(Color.pink)
                }
                .sheet(isPresented: $isPresentWebView) {
                    WebView(url: URL(string: "https://google.com")!, data: webViewData)
                }
            }
            .navigationTitle("HelpCenter")
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
}


#Preview(body: {
    HelpCenterView()
})
