//
//  ViewController.swift
//  WebViewSafari
//
//  Created by Idwall Go Dev 001 on 28/03/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Call safari", for: .normal)
        
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.backgroundColor = UIColor.black
        
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(callSafari), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    private func setupButton() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 45),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2)
        ])
    }

    @IBAction private func callSafari() {
        if let url = URL(string: "https://www.apple.com") {
            
            let config = SFSafariViewController.Configuration()
            
            config.entersReaderIfAvailable = true
            
            let viewControllerSafari = SFSafariViewController(url: url, configuration: config)
            
            viewControllerSafari.delegate = self
            
            viewControllerSafari.preferredControlTintColor = .black
            
            viewControllerSafari.dismissButtonStyle = .close
            
            viewControllerSafari.preferredBarTintColor = .systemGray
            
            present(viewControllerSafari, animated: true)
        }
    }
}

extension ViewController: SFSafariViewControllerDelegate {
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("load succesfully \(didLoadSuccessfully)")
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true) {
            print("Acabou")
        }
    }
}

