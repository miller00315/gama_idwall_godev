//
//  ViewController.swift
//  AppNetwrok
//
//  Created by Idwall Go Dev 001 on 18/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        getUsers()
        showLoading()
    }
    
    private func delegates() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.isHidden = true
    }
    
    private func getUsers() {
        Service.shared.getUsers { result in
            switch result {
            case .success(let res):
                self.users = res
                
                DispatchQueue.main.async {
                    self.homeTableView.isHidden = false
                }
            case .failure(let error):
                print(error)
            }
            
            self.hideLoading()
        }
    }
    
    private func showLoading() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

