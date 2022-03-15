//
//  ViewController.swift
//  aula05_exercicio
//
//  Created by Idwall Go Dev 001 on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var tableColletion: UITableView!
    
    let images = ["casa-1", "casa-1", "casa-1", "casa-1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        delegates()
        registerCell()
        collectionLayout()
        
        collection.showsHorizontalScrollIndicator = false
    }
    
    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
        
        collection.register(nib , forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 90.0, height: 90.0)
        
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .horizontal
        
        collection.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cliquei em \(indexPath.row)")
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell()}
        
        let image = images[indexPath.row]
        
        cell.setup(image: image)
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {}

