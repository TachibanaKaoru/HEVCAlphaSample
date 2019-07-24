//
//  MyPlayerView.swift
//  EffectMoviePlayer
//
//  Created by Kaoru Tachibana on 2019/07/24.
//  Copyright © 2019 Toyship.org. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MyPlayerView: UIView{
    
    var player: AVPlayer?{
        get{
            return playerLayer?.player
        }
        set{
            playerLayer?.player = newValue
        }
    }
    
    var playerLayer: AVPlayerLayer?{
        return layer as? AVPlayerLayer
    }

    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

}
