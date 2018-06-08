//
//  SubscriptionCell.swift
//  Youtube
//
//  Created by Nathenael Dereb on 5/19/18.
//  Copyright © 2018 Nathenael Dereb. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
