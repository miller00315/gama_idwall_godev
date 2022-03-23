//
//  HomeViewController.swift
//  aula_11_atividade
//
//  Created by Idwall Go Dev 001 on 21/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var homeActivityIndicator: UIActivityIndicatorView!
    
    lazy var personList = [Person]() {
        didSet {
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
                
                self.hideLoading()
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        fetchDataFromApi()
        showLoader()
        setLayout()
        
    }
    
    private func delegates() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    private func setLayout() {
        homeTableView.rowHeight = 100
    }
    
    private func registerCell() {
        
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        
        homeTableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
    }
    
    private func fetchDataFromApi () {
        
        PersonService.shared.getPersons { result in
            switch result {
                
            case .success(let res):
                self.personList = res
                
                DispatchQueue.main.async {
                    self.homeTableView.isHidden = false
                }
            case .failure(let error):
                print(error)
            }
            
            self.hideLoading()
        }
        
    }
    
    private func showLoader() {
        homeActivityIndicator.startAnimating()
        homeTableView.isHidden = true
        homeActivityIndicator.isHidden = false
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
            self.homeActivityIndicator.startAnimating()
            
            self.homeActivityIndicator.isHidden = true
        }
    }

}

extension HomeViewController: UITableViewDelegate {}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        
        let person = personList[indexPath.row]
        
        cell.setup(with: person)
        
        return cell
    }
    
    
}
