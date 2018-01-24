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
    
    func sendAlbumsRequest (searchRequest: String, arrayWithAlbums: [Album]? = nil) {
        let searchString = searchRequest.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: "\(BASE_URL)\(searchString)")
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    print(json)
                    
                    if let albumsResults = json["results"] as? NSArray {
                        for album in albumsResults {
//                            let album = Album(title: albumsResults[1], artist: "", country: "", artworkUrl: "", genre: "", releaseDate: "")

                        }
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


