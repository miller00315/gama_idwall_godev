//
//  ViewController.swift
//  aula07_1
//
//  Created by Idwall Go Dev 001 on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegates()
        registerCell()
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        
        header.backgroundColor = .blue
        footer.backgroundColor = .red
        
        collection.tableHeaderView = header
        collection.tableFooterView = footer
    }

    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        
        collection.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(image: "casa-1", title: "Ola", content: "mundo")
        
        return cell
    }
    
    
}

