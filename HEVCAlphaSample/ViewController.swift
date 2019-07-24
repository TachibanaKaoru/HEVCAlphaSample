//
//  ViewController.swift
//  HEVCAlphaSample
//
//  Created by Kaoru Tachibana on 2019/07/24.
//  Copyright © 2019 Toyship.org. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var backVideoPlayer: AVPlayer?
    var backPlayerView: MyPlayerView?
    
    var frontVideoPlayer: AVPlayer?
    var frontPlayerView: MyPlayerView?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGray

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let backMovieURL = Bundle.main.url(forResource: "dragon", withExtension: "mov") else{
            print("cannot load back movie")
            return
        }
        
        guard let alphaMovieURL = Bundle.main.url(forResource: "redlamp", withExtension: "mov") else {
            print("cannot load aipha movie")
            return
        }
        
        backPlayerView = MyPlayerView(frame: CGRect(x: 20, y: 100, width: 300, height: 200))
        backVideoPlayer = AVPlayer(url: backMovieURL)
        backPlayerView?.player = backVideoPlayer
        view.addSubview(backPlayerView!)

        frontPlayerView = MyPlayerView(frame: CGRect(x: 20, y: 100, width: 300, height: 200))
        frontVideoPlayer = AVPlayer(url: alphaMovieURL)
        frontPlayerView?.player = frontVideoPlayer
        view.addSubview(frontPlayerView!)
        
        backVideoPlayer?.play()
        frontVideoPlayer?.play()
        
    }

    @IBAction func showOverlay(_ sender: Any) {
        
        guard let overlaySwitch = sender as? UISwitch else{
            return
        }

        frontPlayerView?.isHidden = !overlaySwitch.isOn
    }
    
    @IBAction func showBase(_ sender: Any) {
        
        guard let baseSwitch = sender as? UISwitch else{
            return
        }

        backPlayerView?.isHidden = !baseSwitch.isOn

    }
}

