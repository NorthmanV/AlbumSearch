//
//  Album.swift
//  AlbumSearch
//
//  Created by Руслан Акберов on 23.01.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class Album {
    
    let artistName: String
    var artworkUrl100: String
    let collectionId: Int
    let collectionName: String
    let country: String
    let primaryGenreName: String
    let releaseDate: String
    
    init(artistName: String, artworkUrl100: String, collectionId: Int, collectionName: String, country: String, primaryGenreName: String, releaseDate: String) {
        self.artistName = artistName
        self.artworkUrl100 = artworkUrl100
        self.collectionId = collectionId
        self.collectionName = collectionName
        self.country = country
        self.primaryGenreName = primaryGenreName
        self.releaseDate = releaseDate
    }
    
}
