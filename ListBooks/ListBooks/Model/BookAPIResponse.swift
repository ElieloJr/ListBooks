//
//  BookAPIResponse.swift
//  ListBooks
//
//  Created by Usr_Prime on 15/03/22.
//

import Foundation

struct BookAPIResponse: Codable {
    let items: [Item]
}
struct Item: Codable {
    let id: String
    let volumeInfo: VolumeInfo
}
struct VolumeInfo: Codable {
    let title: String
    let imageLinks: ImageLinks
}
struct ImageLinks: Codable {
    let thumbnail: String
}
