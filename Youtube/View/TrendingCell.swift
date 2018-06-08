//
//  TrendingCell.swift
//  Youtube
//
//  Created by Nathenael Dereb on 5/19/18.
//  Copyright © 2018 Nathenael Dereb. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
