//
//  File.swift
//  AlbumSearch
//
//  Created by Руслан Акберов on 23.01.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

let BASE_URL = "https://itunes.apple.com/search?entity=album&attribute=albumTerm&limit=200&term="

class DataService {
    
    static let instance = DataService()
    
    func getAlbums (searchRequest: String, complition: @escaping ([Album])->()) {
        var albums = [Album]()
        let searchString = searchRequest.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: "\(BASE_URL)\(searchString)")
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            if let response = response {
                //print(response)
            }
            if let data = data {
                //print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    //print(json)
                    
                    if let albumsResults = json["results"] as? NSArray {
                        for album in albumsResults {
                            if let albumInfo = album as? [String: AnyObject] {
                                guard let artistName = albumInfo["artistName"] as? String else {return}
                                guard let artworkUrl100 = albumInfo["artworkUrl100"] as? String else {return}
                                guard let collectionId = albumInfo["collectionId"] as? Int else {return}
                                guard let collectionName = albumInfo["collectionName"] as? String else {return}
                                guard let country = albumInfo["country"] as? String else {return}
                                guard let primaryGenreName = albumInfo["primaryGenreName"] as? String else {return}
                                guard let releaseDate = albumInfo["releaseDate"] as? String else {return}
                                let albumInstance = Album(artistName: artistName, artworkUrl100: artworkUrl100, collectionId: collectionId, collectionName: collectionName, country: country, primaryGenreName: primaryGenreName, releaseDate: releaseDate)
                                albums.append(albumInstance)
                            }
                        }
                        complition(albums)
                    }

                } catch {
                    print(error.localizedDescription)
                }
            }
            if error != nil {
                print(error!.localizedDescription)
            }
        }.resume()
    }
    
}
//                            print(type(of: album))
//                            let album = Album(title: albumsResults[1], artist: "", country: "", artworkUrl: "", genre: "", releaseDate: "")
// save only artwork image, title, artist - make them optional to initialize instanse of album before




