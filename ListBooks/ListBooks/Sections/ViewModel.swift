//
//  ViewModel.swift
//  ListBooks
//
//  Created by Usr_Prime on 15/03/22.
//

import Foundation

protocol ViewDelegate {
    func reloadData()
}

class ViewModel {
    var bookList: [Items] = []
    var delegate: ViewDelegate?
    
    func getData() {
        BookAPI.shared.getBook { result in
            switch result {
            case .success(let bookTable):
                self.bookList = bookTable.items
                self.delegate?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
