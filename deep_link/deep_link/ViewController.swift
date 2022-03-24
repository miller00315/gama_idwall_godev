//
//  ViewController.swift
//  deep_link
//
//  Created by Idwall Go Dev 001 on 22/03/22.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    private enum defaults {
        static let textInfo = "Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like);",
        titleButton = "Call action",
        descriptionInfo = "Description"
    }
    
    var safeArea: UILayoutGuide!
    
    lazy var icon: UIImageView = {
        let iconUIImage = UIImageView()
        
        iconUIImage.image = UIImage(systemName: "airplane")
        
        iconUIImage.translatesAutoresizingMaskIntoConstraints = false
        
        return iconUIImage
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        
        label.numberOfLines = 0
        
        label.text = defaults.textInfo
        
        label.font = UIFont.systemFont(ofSize: 13)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        
        return label
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle(defaults.titleButton, for: .normal)
        button.backgroundColor = .brown
        button.tintColor = .white
        
        button.addTarget(self, action: #selector(getView), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var content: UIView = {
        let view = UIView()
        
        view.backgroundColor = .red
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var descriptionLAbel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 15)
        
        label.textColor = .white
        
        label.text = "Center label"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var button: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        configureIconImageView()
        configureCallActionButton()
        configureContent()
        configureDescription()
        
        
        
      //  view.addSubview(button)
        
        
        
        let paragraphStyles = NSMutableParagraphStyle()
        
        paragraphStyles.alignment = NSTextAlignment.justified
        
        titleLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Metrics.Margin.default).isActive = true
        
        titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        
        //button.setTitle("Botao", for: .normal)
         
        //button.frame = CGRect(x: titleLabel.frame.minX, y: 0, width: 130, height: 45)
         
       // button.backgroundColor = .brown
        
        
        
        
        
        title = defaults.descriptionInfo
        
        view.backgroundColor = .backgroundViewCode
    }
    
    
    // MARK: - Métodos privados
    private func configureIconImageView() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 80),
            icon.widthAnchor.constraint(equalToConstant: 80),
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureCallActionButton() {
        NSLayoutConstraint.activate([
            callButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.Margin.default),
            callButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Metrics.Margin.default),
            callButton.heightAnchor.constraint(equalToConstant: Metrics.Margin.input),
            callButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Metrics.Margin.default),
            callButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    private func configureContent() {
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 20),
            content.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Metrics.Margin.default),
            content.heightAnchor.constraint(equalToConstant: 130),
            content.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Metrics.Margin.default)
        ])
        
    }
    
    private func configureDescription() {
        NSLayoutConstraint.activate([
            descriptionLAbel.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            
            descriptionLAbel.centerYAnchor.constraint(equalTo: content.centerYAnchor)
        ])
    }
    
    private func addSubViews() {
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(icon)
        view.addSubview(titleLabel)
        view.addSubview(callButton)
        view.addSubview(content)
        content.addSubview(descriptionLAbel)
    }
    
    @objc func getView() {
        print("Opa cliquei aqui")
    }

    @IBAction func getFacebook() {
        let scheme = "fb://"
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.canOpenURL(url)
            }
        }
    }
    @IBAction func getWhatsapp() {
        let scheme = "whatsapp://"
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.canOpenURL(url)
            }
        }
    }
    
    @IBAction func getPhone() {
        let scheme = "tel://+55(11)983177098"
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.canOpenURL(url)
            }
        }
    }
    
    @IBAction func getsms() {
        let scheme = "sms://+55(11)983177098"
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.canOpenURL(url)
            }
        }
    }
    
    @IBAction func getEmail(_ sender: Any) {
        
        let recipientEmail = "miller00315@gmail.com"
        
        let subject =  "go dev"
        
        let body = "bem vindo"
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self
            
            mail.setCcRecipients([recipientEmail])
            
            mail.setSubject(subject)
            
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true)
        }
    }
    
    @IBAction func getGmail(_ sender: Any) {
        
        let recipientEmail = "miller00315@gmail.com"
        
        let subject =  "go dev"
        
        let body = "bem vindo"
        
        generateEmail(to: recipientEmail, subject: subject, body: body)
    }
    
    private func generateEmail(to: String, subject: String, body: String) {
        
        var scheme = ""
        
        if let subjectEncode = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        
            let bodyEncoding = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            scheme = "googleemail://co?to=\(to)&subjec=\(subjectEncode)t&body=\(bodyEncoding)"
        }
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.canOpenURL(url)
            }
        }
        
        
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .cancelled:
            print("cancelled")
        case .saved:
            print("save")
        case .sent:
            print("sent")
        case .failed:
            print("failes")
        @unknown default:
            print("uai")
        }
    }
}

