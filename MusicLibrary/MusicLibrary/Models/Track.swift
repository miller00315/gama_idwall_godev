//
//  Track.swift
//  MusicLibrary
//
//  Created by Idwall Go Dev 001 on 19/03/22.
//

import Foundation

struct Track: Codable {
    let id: UUID?
    let collectionName, trackName, artworkUrl30 : String?
}
