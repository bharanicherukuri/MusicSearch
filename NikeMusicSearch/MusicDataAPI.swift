//
//  MusicDataAPI.swift
//  NikeMusicSearch
//
//  Created by Bharani Cherukuri on 4/20/20.
//  Copyright © 2020 Bharani.Cherukuri. All rights reserved.
//

import Foundation

class MusicAPI {
            
    static func getMusicList(onCompletion: @escaping (_ completionValue: Bool, _ data: [Music], _ initialData: InitialData) -> ()) {
        
        // URL for all genres with RSS Feed Generator selector with genre as All

        let url: String = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
        guard let urlRequest = URL(string: url) else { return }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else { return }
            
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let newJSONDecoder = JSONDecoder()
            let user = try? newJSONDecoder.decode(InitialData.self, from: data)
            let feed = user?.feed
            guard let user1 = user else { return }
            onCompletion(true, feed?.results ?? [], user1)
        }
        
        task.resume()
    }
}
