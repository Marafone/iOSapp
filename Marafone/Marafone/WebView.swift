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
    let username: String
    let password: String

    func makeUIView(context: Context) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.javaScriptEnabled = true // Enable JavaScript

        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: SimpleWebView
        var scriptExecuted = false // Flag to track if the script has been executed

        init(_ parent: SimpleWebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Inject a button to trigger the script
            let javascript = """
            function setNativeValue(el, value) {
              const previousValue = el.value;

              if (el.type === 'checkbox' || el.type === 'radio') {
                if ((!!value && !el.checked) || (!!!value && el.checked)) {
                  el.click();
                }
              } else el.value = value;

              const tracker = el._valueTracker;
              if (tracker) {
                tracker.setValue(previousValue);
              }

              // Trigger the change event to notify React
              el.dispatchEvent(new Event('change', { bubbles: true }));
            }

            let triggerButton = document.createElement('button');
            triggerButton.innerText = 'Auto Login';
            triggerButton.style.position = 'absolute';
            triggerButton.style.top = '20px';
            triggerButton.style.left = '20px';
            triggerButton.style.zIndex = '1000';
            document.body.appendChild(triggerButton);

            triggerButton.addEventListener('click', function() {
                const usernameInput = document.getElementById('username');
                const passwordInput = document.getElementById('password');
                
                // Set username and password using setNativeValue
                setNativeValue(usernameInput, '\(parent.username)');
                setNativeValue(passwordInput, '\(parent.password)');
                
                const form = document.querySelector('form');
                if (form) {
                    form.requestSubmit(); // Use requestSubmit to submit the form
                } else {
                    console.log('Form not found!');
                }

                // After the button is clicked, remove it from the page
                triggerButton.remove();
            });
            """
            
            webView.evaluateJavaScript(javascript) { (result, error) in
                if let error = error {
                    print("JavaScript injection error: \(error.localizedDescription)")
                } else {
                    print("JavaScript to trigger auto-login button injected successfully.")
                }
            }
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("Started loading the page")
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            print("Failed to load page with error: \(error.localizedDescription)")
        }
    }
}
