//
//  ViewController.swift
//  WebViewComponent
//
//  Created by Idwall Go Dev 001 on 28/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        
        let web = WKWebView(frame: .zero, configuration: webConfiguration)
        
        web.translatesAutoresizingMaskIntoConstraints = false
        
        web.navigationDelegate = self
        
        return web
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Navigation"
        
        view.backgroundColor = .white
        
        configureUI()
        setupWebView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavibar()
    }
    
    private func setNavibar() {
        navigationController?.navigationBar.prefersLargeTitles = true
               
               let appearence = UINavigationBarAppearance()
               
               appearence.backgroundColor = .systemGreen
               appearence.titleTextAttributes = [.foregroundColor: UIColor.white]
               appearence.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
               
               navigationController?.navigationBar.standardAppearance = appearence
               navigationController?.navigationBar.compactAppearance = appearence
               navigationController?.navigationBar.scrollEdgeAppearance = appearence
               
               navigationItem.backBarButtonItem = UIBarButtonItem(
                   title: "", style: .plain, target: nil, action: nil
               )
               
       navigationController?.navigationBar.prefersLargeTitles = true
       
       let updateButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(updateAction))
               
        updateButton.tintColor = .white
               
        let forwardButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(forwardAction))
       
        forwardButton.tintColor = .white
        
        let backButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(backAction))
        
         backButton.tintColor = .white
       
       navigationItem.leftBarButtonItem = updateButton
       navigationItem.rightBarButtonItems = [backButton, forwardButton]
    }
    
    private func setupWebView() {
        let url = URL(string: "https://www.apple.com")
        
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }
    
    private func configureUI() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]);
    }
}

extension ViewController {
    @objc private func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc private func backAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc private func updateAction() {
        webView.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("terminou")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("INiciando")
    }
}

