//
//  Album.swift
//  AlbumSearch
//
//  Created by Руслан Акберов on 23.01.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

class Album {
    
    let title: String
    let artist: String
    let country: String
    let artworkUrl: String
    let genre: String
    let releaseDate: String
    
    init(title: String, artist: String, country: String, artworkUrl: String, genre: String, releaseDate: String) {
        self.title = title
        self.artist = artist
        self.country = country
        self.artworkUrl = artworkUrl
        self.genre = genre
        self.releaseDate = releaseDate
    }
    
}
