//
//  TrackCell.swift
//  AlbumSearch
//
//  Created by Руслан Акберов on 27.01.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet weak var trackNumber: UILabel!
    @IBOutlet weak var trackName: UILabel!

    func updateCell (track: Track) {
        trackNumber.text = String(track.trackNumber)
        trackName.text = track.trackName
    }
    

}
