//
//  ApiService.swift
//  Youtube
//
//  Created by Nathenael Dereb on 5/16/18.
//  Copyright © 2018 Nathenael Dereb. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedUrlString(urlString: "\(baseUrl)/home.json", completion: completion)
        
    }


func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
    fetchFeedUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
}

    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }

    func fetchFeedUrlString(urlString: String, completion: @escaping ([Video]) -> ())
    {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            do {
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                    
                    DispatchQueue.main.async(execute: {
                        completion(jsonDictionaries.map({return Video(dictionary: $0)}))
                    })
                }
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
}

//let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//
//var videos = [Video]()
//
//for dictionary in json as! [[String: AnyObject]] {
//
//    let video = Video()
//    video.title = dictionary["title"] as? String
//    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//
//    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//
//    let channel = Channel()
//    channel.name = channelDictionary["name"] as? String
//    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//
//    video.channel = channel
//    videos.append(video)
//}
//
//DispatchQueue.main.async(execute: {
//    completion(videos)
//})
