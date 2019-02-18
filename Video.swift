//
//  Video.swift
//  Ios_Code_Structure
//
//  Created by Youngbrainz Infotech on 16/01/19.
//  Copyright © 2019 Youngbrainz Infotech. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class Video_Player:NSObject
{
    static let VideoSharedManager = Video_Player()
    
    override init ()
    {
        super.init()
    }
    
    //MARK:- Using AVPlayerViewController:
    func Play_Video(video:String) -> AVPlayerViewController
    {
        let videoURL = URL(string: video)
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }
    
    //MARK:- Using AVPlayer:
    //        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
    //        let player = AVPlayer(url: videoURL!)
    //        let playerLayer = AVPlayerLayer(player: player)
    //        playerLayer.frame = self.view.bounds
    //        self.view.layer.addSublayer(playerLayer)
    //        player.play()
}
