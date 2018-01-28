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
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .automatic
        }
        let indentation = (self.view.bounds.size.width - 300) / 4
        collectionView.contentInset = UIEdgeInsets(top: indentation, left: indentation, bottom: indentation, right: indentation)
        addShadowToNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlbumDetailVC" {
            if let destinationVC = segue.destination as? AlbumDetailVC {
                if let album = sender as? Album {
                    destinationVC.album = album
                    let index = albums.index(where: {$0 === album})
                    let indexPath = IndexPath(row: index!, section: 0)
                    if let cell = collectionView.cellForItem(at: indexPath) as? AlbumCell {
                        destinationVC.image = cell.albumImage.image
                    }
                }
            }
        }
    }
    
    func addShadowToNavigationBar() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
}

// MARK: - CollectionView methods

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        performSegue(withIdentifier: "AlbumDetailVC", sender: album)
        searchBar.resignFirstResponder()
    }

}

// MARK: - SearchBar methods

extension MainVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil || searchBar.text != "" {
            DataService.instance.getAlbums(searchRequest: searchBar.text!) { (requestedAlbums) in
                self.albums = requestedAlbums.sorted(by: {$0.collectionName < $1.collectionName})
                DispatchQueue.main.async {
                self.collectionView.reloadData()
                }
            }
        }
        searchBar.resignFirstResponder()
    }
}








