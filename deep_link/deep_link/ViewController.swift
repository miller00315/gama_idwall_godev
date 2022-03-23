//
//  ViewController.swift
//  deep_link
//
//  Created by Idwall Go Dev 001 on 22/03/22.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    lazy var icon: UIImageView = {
        let iconUIImage = UIImageView()
        
        iconUIImage.image = UIImage(systemName: "airplane")
        
        iconUIImage.translatesAutoresizingMaskIntoConstraints = false
        
        return iconUIImage
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .red
        
        label.numberOfLines = 0
        
        label.text = """
            Why do we use it?
            It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like);
        """
        
        label.font = UIFont.systemFont(ofSize: 13)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        
        return label
    }()
    
    var button: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // button.setTitle("Botao", for: .normal)
        
       // button.frame = CGRect(x: 0, y: 0, width: 130, height: 45)
        
       // button.backgroundColor = .brown
        
       // view.addSubview(button)
        
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(icon)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 80),
            icon.widthAnchor.constraint(equalToConstant: 80),
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        titleLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        
        titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        
        title="App navi"
        
        view.backgroundColor = .systemIndigo
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

