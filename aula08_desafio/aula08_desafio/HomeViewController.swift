//
//  ViewController.swift
//  aula08_desafio
//
//  Created by Idwall Go Dev 001 on 16/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var homeData: [Home]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sobre"
        
        homeData = homes
        
        delegates()
        registerCell()
    }
    
    func delegates() {
        homeTableView.delegate = self
        
        homeTableView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        
        homeTableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        let home = homeData![indexPath.row]
        
        cell.setup(
            image: home.image,
            title: home.title,
            content: home.content
        )
        
        return cell
    }
    
    
}
