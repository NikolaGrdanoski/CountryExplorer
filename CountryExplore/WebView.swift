//
//  WebView.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 21.6.25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    /*var body: some View {
        Text("Hello, World!")
    }*/
    
    let url: URL

        
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
        
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
