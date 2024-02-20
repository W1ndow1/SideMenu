//
//  WebViewData.swift
//  SideMenu
//
//  Created by window1 on 2/20/24.
//

import SwiftUI
import WebKit
import Combine

class WebViewData: ObservableObject {
    //값을 내보냄
    var functionCaller = PassthroughSubject<String, Never>()
    //updateUIView를 실행해야 하는지 여부 확인
    var shouldUpdateView = true
}

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let url: URL?
    @StateObject var data: WebViewData
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        
        if let url = url {
            webView.load(URLRequest(url: url))
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard data.shouldUpdateView else {
            data.shouldUpdateView = false
            return
        }
        
        context.coordinator.tieFunctionCaller(data: data)
        context.coordinator.webView = uiView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parentWebView: WebView
        var webView: WKWebView? = nil
        
        private var cancellable : AnyCancellable?
        
        init(_ parentWebView: WebView) {
            self.parentWebView = parentWebView
            super.init()
        }
        
        func tieFunctionCaller(data: WebViewData) {
            cancellable = data.functionCaller.sink(receiveValue: { javascript in
                self.webView?.evaluateJavaScript(javascript)
            })
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://google.com")
        let webViewData = WebViewData()
        WebView(url: url, data: webViewData)
    }
}

