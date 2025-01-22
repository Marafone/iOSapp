//
//  WebView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 30/12/24.
//

import SwiftUI
import WebKit

struct SimpleWebView: UIViewRepresentable {
    @ObservedObject var keychainManager: KeychainManager
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        let webpagePreferences = WKWebpagePreferences()
        webpagePreferences.allowsContentJavaScript = true
        webConfiguration.defaultWebpagePreferences = webpagePreferences

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
        var parent: SimpleWebView

        init(_ parent: SimpleWebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Inject JavaScript to create the "Auto Login" button
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
                
                if (usernameInput && passwordInput) {
                    // Set username and password using setNativeValue
                    setNativeValue(usernameInput, '\(parent.keychainManager.username)');
                    setNativeValue(passwordInput, '\(parent.keychainManager.password)');
                    
                    const form = document.querySelector('form');
                    if (form) {
                        form.requestSubmit();
                    } else {
                        console.log('Form not found!');
                    }
                } else {
                    console.log('Username or password input not found!');
                }

                // Remove the button after it is clicked
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
