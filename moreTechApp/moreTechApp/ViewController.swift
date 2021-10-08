//
//  ViewController.swift
//  moreTechApp
//
//  Created by i.mamadaev on 08.10.2021.
//

import UIKit
import SnapKit
import Player
import CoreMedia


class ViewController: UIViewController {

    private let player = Player()
    private let myFirstButton = UIButton()
    private let mySecondButton = UIButton()

    // MARK: object lifecycle
    deinit {
        self.player.willMove(toParent: nil)
        self.player.view.removeFromSuperview()
        self.player.removeFromParent()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.view.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
        
        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.volume = 0.5
        self.player.fillMode = .resizeAspectFill
        self.player.playerView.playerBackgroundColor = .black
        
//        self.addChild(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)
        
//        let localUrl = Bundle.main.url(forResource: "IMG_3267", withExtension: "MOV")
//        self.player.url = localUrl
        self.player.url = videoUrl
        
        self.player.playbackLoops = true
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
        self.player.muted = false

        
        myFirstButton.frame = CGRect(x: 15, y: -50, width: 300, height: 50)
        myFirstButton.backgroundColor = .white
        myFirstButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        myFirstButton.layer.cornerRadius = 15
        myFirstButton.setTitle("Move to 15 sec.", for: .normal)
        myFirstButton.setTitleColor(.black, for: .normal)
        self.view.addSubview(myFirstButton)
        myFirstButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(120)
            $0.left.equalTo(self.view.snp.left).offset(50)
            $0.right.equalTo(self.view.snp.right).offset(-50)
        }
        
        mySecondButton.frame = CGRect(x: 15, y: -50, width: 300, height: 50)
        mySecondButton.backgroundColor = .white
        mySecondButton.addTarget(self, action: #selector(mute_pressed), for: .touchUpInside)
        mySecondButton.layer.cornerRadius = 15
        mySecondButton.setTitle("Mute", for: .normal)
        mySecondButton.setTitleColor(.black, for: .normal)
        self.view.addSubview(mySecondButton)
        mySecondButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(myFirstButton).offset(50)
            $0.left.equalTo(self.view.snp.left).offset(50)
            $0.right.equalTo(self.view.snp.right).offset(-50)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.player.playFromBeginning()
    }
    
    @objc func pressed() {
        let timeScale = CMTimeScale(2.0)
        let newTime: CMTime = CMTime(seconds: 15, preferredTimescale: timeScale)
        let zeroTime: CMTime = CMTime(seconds: 0, preferredTimescale: timeScale)

        self.player.seekToTime(to: newTime, toleranceBefore: zeroTime, toleranceAfter: zeroTime, completionHandler: nil)
    }
    
    @objc func mute_pressed() {
        var title = "Unmute"
        if self.player.muted {
            title = "Mute"
        }
        mySecondButton.setTitle(title, for: .normal)

        self.player.muted = !self.player.muted

    }
}

// MARK: - UIGestureRecognizer

extension ViewController {
    
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch self.player.playbackState {
        case .stopped:
            self.player.playFromBeginning()
            break
        case .paused:
            self.player.playFromCurrentTime()
            break
        case .playing:
            self.player.pause()
            break
        case .failed:
            self.player.pause()
            break
        }
    }
    
}

// MARK: - PlayerDelegate

extension ViewController: PlayerDelegate {
    
    func playerReady(_ player: Player) {
        print("\(#function) ready")
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        print("\(#function) \(player.playbackState.description)")
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
    }
    
    func player(_ player: Player, didFailWithError error: Error?) {
        print("\(#function) error.description")
    }
    
}

// MARK: - PlayerPlaybackDelegate

extension ViewController: PlayerPlaybackDelegate {
    
    func playerCurrentTimeDidChange(_ player: Player) {
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
    }

    func playerPlaybackDidLoop(_ player: Player) {
    }
}



