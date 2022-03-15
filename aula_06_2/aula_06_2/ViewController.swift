//
//  ViewController.swift
//  aula_06_2
//
//  Created by Idwall Go Dev 001 on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    let times: [String] = ["a", "b"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }

}

extension ViewController: UICollectionViewDelegate {}

extension ViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.contentView.backgroundColor = .orange
        
        return cell
    }
}

