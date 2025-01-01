//
//  WebView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 30/12/24.
//

import SwiftUI
import WebKit

struct SimpleWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.javaScriptEnabled = true // Enable JavaScript

        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
