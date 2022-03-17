//
//  CategoryViewController.swift
//  aula08_desafio
//
//  Created by Idwall Go Dev 001 on 16/03/22.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryData: [Category]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categorias"
        
        categoryData = categories
        
        delegates()
        registerCell()
        collectionLayout()
    }
    
    func delegates() {
        
        categoryCollectionView.delegate = self
        
        categoryCollectionView.dataSource = self
        
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil)
        
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 100, height: 150)
        
        layout.minimumLineSpacing = 2
        
        categoryCollectionView.collectionViewLayout = layout
    }

}

extension CategoryViewController: UICollectionViewDelegate {
    
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let category = categoryData![indexPath.row]
        
        cell.setup(image: category.image, label: category.content)
        
        return cell
    }
    
    
}
