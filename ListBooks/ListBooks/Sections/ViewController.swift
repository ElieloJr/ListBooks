//
//  ViewController.swift
//  ListBooks
//
//  Created by Usr_Prime on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self // ?
        viewModel.getData()
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        homeCollectionView.register(UINib(nibName: "CelulaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CelulaCollectionViewCell")
    }
}
extension ViewController: UICollectionViewDelegate {
    
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.bookList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CelulaCollectionViewCell", for: indexPath) as! CelulaCollectionViewCell
        cell.setImage(with: self.viewModel.bookList[indexPath.row].id)
        return cell
    }
}
extension ViewController: ViewDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.homeCollectionView.reloadData()
        }
    }
}
