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

protocol ViewModelProtocol {
    var selectedBook: Item? { get }
    var delegate: ViewDelegate? {get set}
    func selectBook(indexPath: Int)
}

// Classe para testes
class ViewModelMockFalso: ViewModelProtocol {
    var delegate: ViewDelegate?
    var selectedBook: Item?
    func selectBook(indexPath: Int) {
        return
    }
}

class ViewModel: ViewModelProtocol {
    var bookList: [Item] = []
    var delegate: ViewDelegate?
    var selectedBook: Item?
    
    func selectBook(indexPath: Int) {
        if indexPath < self.bookList.count {
            self.selectedBook = self.bookList[indexPath]
        }
    }
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
