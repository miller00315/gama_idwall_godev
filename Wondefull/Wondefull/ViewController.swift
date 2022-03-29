//
//  ViewController.swift
//  Wondefull
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
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        
        search.translatesAutoresizingMaskIntoConstraints = false
        
        search.placeholder = "Entrar com o site"
    
        search.delegate = self
    
        search.autocapitalizationType = .none
        
        return search
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Wonderfull Navigator"
        
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
           
           appearence.backgroundColor = .white
           appearence.titleTextAttributes = [.foregroundColor: UIColor.black]
           appearence.largeTitleTextAttributes = [.foregroundColor:UIColor.black]
           
           navigationController?.navigationBar.standardAppearance = appearence
           navigationController?.navigationBar.compactAppearance = appearence
           navigationController?.navigationBar.scrollEdgeAppearance = appearence
           
           navigationItem.backBarButtonItem = UIBarButtonItem(
               title: "", style: .plain, target: nil, action: nil
           )
           
       navigationController?.navigationBar.prefersLargeTitles = true
       
       let updateButton = UIBarButtonItem(image: UIImage.init(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(updateAction))
               
        updateButton.tintColor = .black
               
        let forwardButton = UIBarButtonItem(image: UIImage.init(systemName: "chevron.right"), style: .plain, target: self, action: #selector(forwardAction))
       
        forwardButton.tintColor = .black
        
        let backButton = UIBarButtonItem(image: UIImage.init(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backAction))
        
        backButton.tintColor = .black
       
       navigationItem.leftBarButtonItem = updateButton
       navigationItem.rightBarButtonItems = [forwardButton, backButton]
    }
    
    private func setupWebView() {
        openPage("https://www.apple.com")
    }
    
    func openPage(_ url: String) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            
            webView.load(request)
        } else {
            print("url invalida")
        }
    }
    
    private func configureUI() {
        view.addSubview(searchBar)
        view.addSubview(webView)
        
        configureSearchBar()
        configureWebView()
    }
    
    private func configureSearchBar() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func configureWebView() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
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

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let url = searchBar.text {
            openPage(url)
        } else {
            print("Sem url")
        }
    }
}
