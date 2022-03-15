//
//  ViewController.swift
//  ListBooks
//
//  Created by Usr_Prime on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    var bookList: [Items] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        homeCollectionView.register(UINib(nibName: "CelulaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CelulaCollectionViewCell")
        BookAPI.shared.getBook { result in
            switch result {
            case .success(let bookTable):
                self.bookList = bookTable.items
                print(bookTable.items)
                DispatchQueue.main.async {
                    self.homeCollectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
extension ViewController: UICollectionViewDelegate {
    
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CelulaCollectionViewCell", for: indexPath) as! CelulaCollectionViewCell
        cell.setImage(with: bookList[indexPath.row].id)
        return cell
    }
}
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionsView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 300, height: 300)
//    }
//}
