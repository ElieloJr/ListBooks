//
//  ViewController.swift
//  ListBooks
//
//  Created by Usr_Prime on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getData()
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UINib(nibName: "CelulaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CelulaCollectionViewCell")
    }
}
extension ViewController: UICollectionViewDelegate {
    // Implemente aqui funcionalidades para a Collection
}
extension ViewController: CellInteraction {
    func showError(with message: String) {
        print(message)
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.bookList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CelulaCollectionViewCell", for: indexPath) as! CelulaCollectionViewCell
        self.viewModel.selectBook(indexPath: indexPath.row)
        cell.interactionDelegate = self
        cell.configure(with: self.viewModel.selectedBook)
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
