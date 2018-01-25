//
//  MainVC.swift
//  AlbumSearch
//
//  Created by Руслан Акберов on 23.01.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        DataService.instance.getAlbums(searchRequest: "Master") { (requestedAlbums) in
            self.albums = requestedAlbums
            print(self.albums.count)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as? AlbumCell {
            cell.updateCell(album: albums[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension MainVC: UISearchBarDelegate {
    
}
