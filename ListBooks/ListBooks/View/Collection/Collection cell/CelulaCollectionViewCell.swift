//
//  CelulaCollectionViewCell.swift
//  ListBooks
//
//  Created by Usr_Prime on 15/03/22.
//

import UIKit

class CelulaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setImage(with id: String) {
        guard let imageURL = URL(string: "https://books.google.com/books/content?id=\(id)&printsec=frontcover&img=1&zoom=1&source=gbs_api") else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.bookImageView.image = image
            }
        }
    }
}
