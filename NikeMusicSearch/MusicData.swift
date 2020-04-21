//
//  MusicData.swift
//  NikeMusicSearch
//
//  Created by Bharani Cherukuri on 4/20/20.
//  Copyright © 2020 Bharani.Cherukuri. All rights reserved.
//

struct Music: Codable {
    let name: String?
    let artistName: String?
    let artworkUrl100: String?
    let copyright: String?
    let genres: [Genres]
    let releaseDate: String?
    let url: String?
}

struct Genres: Codable {
    let name: String?
}

struct ResultData: Codable {
    let results: [Music]
}

struct InitialData: Codable {
    let feed: ResultData
}
