//
//  WebView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 09.08.2021.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    var htmlString: String


    public func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()

        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true

        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)

        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
        
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)

    }

}
