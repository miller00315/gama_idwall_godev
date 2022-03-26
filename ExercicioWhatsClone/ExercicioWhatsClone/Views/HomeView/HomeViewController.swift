//
//  HomeViewController.swift
//  ExercicioWhatsClone
//
//  Created by Idwall Go Dev 001 on 25/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "home"
        
        
        view.addSubview(tableView)
        
        delegates()
        
        view.backgroundColor = .white
        title = "Home"
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        
        editButton.tintColor = .white
        
        let newButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callNewView))
        
        newButton.tintColor = .white
        
        navigationItem.leftBarButtonItem = editButton
        navigationItem.rightBarButtonItem = newButton
    }
    
    func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func callNewView() {
        //let newVC = NewViewController()
        
        //navigationController?.present(newVC, animated: true, completion: nil)
    }

}

extension HomeViewController: UITableViewDelegate {}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        
        return cell
    }
    
}
