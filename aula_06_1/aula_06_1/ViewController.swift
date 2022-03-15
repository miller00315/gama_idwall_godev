//
//  ViewController.swift
//  aula_06_1
//
//  Created by Idwall Go Dev 001 on 14/03/22.
//

import UIKit

struct Times{
var logo: String
var name: String
var description: String
}

class ViewController: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    
    var times: [Times] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        delegates()
        
        title = "Times" // titulo da página
        
        times = [
            Times(logo: "keyboard", name: "a", description: "b"),
            Times(logo: "keyboard", name: "b", description: "c"),
            Times(logo: "keyboard", name: "c", description: "e"),
            Times(logo: "keyboard", name: "d", description: "f")
        ]
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Eu cliquei no time \(times[indexPath.row].name)")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        let time = self.times[indexPath.row]
        
        cell.setup(logo: time.logo, name: time.name, description: time.description)

        return cell
    }
}
 
