//
//  VideoPlayerViewController.swift
//  moreTechApp
//
//  Created by i.mamadaev on 08.10.2021.
//

import UIKit
import SnapKit
import Player
import CoreMedia

class VideoPlayerViewController: UIViewController {

    private let player = Player()
    private let myFirstButton = UIButton()
    private let mySecondButton = UIButton()
    private let myThirdButton = UIButton()
    private var flag = true

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

        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.volume = 0.5
        self.player.fillMode = .resizeAspect
        self.player.playerView.playerBackgroundColor = .black

        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)

        let localUrl = Bundle.main.url(forResource: "test2", withExtension: "mp4")
        self.player.url = localUrl

        self.player.playbackLoops = true

        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
        self.player.muted = false

        myFirstButton.frame = CGRect(x: 15, y: -50, width: 300, height: 50)
        myFirstButton.backgroundColor = .white
        myFirstButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        myFirstButton.layer.cornerRadius = 15
        myFirstButton.setTitle("+5 sec", for: .normal)
        myFirstButton.setTitleColor(.black, for: .normal)
        myFirstButton.layer.borderColor = UIColor.black.cgColor
        myFirstButton.layer.borderWidth = 1
        self.view.addSubview(myFirstButton)
        myFirstButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-160)
            $0.left.equalTo(self.view.snp.left).offset(50)
            $0.right.equalTo(self.view.snp.right).offset(-50)
        }

        mySecondButton.frame = CGRect(x: 15, y: -50, width: 300, height: 50)
        mySecondButton.backgroundColor = .white
        mySecondButton.addTarget(self, action: #selector(mute_pressed), for: .touchUpInside)
        mySecondButton.layer.cornerRadius = 15
        mySecondButton.setTitle("Mute", for: .normal)
        mySecondButton.setTitleColor(.black, for: .normal)
        mySecondButton.layer.borderColor = UIColor.black.cgColor
        mySecondButton.layer.borderWidth = 1
        self.view.addSubview(mySecondButton)
        mySecondButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(myFirstButton).offset(50)
            $0.left.equalTo(self.view.snp.left).offset(50)
            $0.right.equalTo(self.view.snp.right).offset(-50)
        }

        myThirdButton.frame = CGRect(x: 15, y: -50, width: 300, height: 50)
        myThirdButton.backgroundColor = .white
        myThirdButton.addTarget(self, action: #selector(next_video), for: .touchUpInside)
        myThirdButton.layer.cornerRadius = 15
        myThirdButton.setTitle("Next video", for: .normal)
        myThirdButton.setTitleColor(.black, for: .normal)
        myThirdButton.layer.borderColor = UIColor.black.cgColor
        myThirdButton.layer.borderWidth = 1
        self.view.addSubview(myThirdButton)
        myThirdButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mySecondButton).offset(50)
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

        let newTime: CMTime = CMTime(seconds: 5, preferredTimescale: timeScale)
        let zeroTime: CMTime = CMTime(seconds: 0, preferredTimescale: timeScale)

        self.player.seekToTime(to: self.player.currentTime + newTime, toleranceBefore: zeroTime, toleranceAfter: zeroTime, completionHandler: nil)
    }

    @objc func mute_pressed() {
        var title = "Unmute"
        if self.player.muted {
            title = "Mute"
        }
        mySecondButton.setTitle(title, for: .normal)

        self.player.muted = !self.player.muted

    }

    @objc func next_video() {
        if flag {
            let localUrl = Bundle.main.url(forResource: "test1", withExtension: "mp4")
            self.player.url = localUrl
        } else {
            let localUrl = Bundle.main.url(forResource: "test2", withExtension: "mp4")
            self.player.url = localUrl
        }
        flag = !flag
    }
}

// MARK: - UIGestureRecognizer

extension VideoPlayerViewController {

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

extension VideoPlayerViewController: PlayerDelegate {

    func playerReady(_ player: Player) {
        print("\(#function) ready")
        let timeScale = CMTimeScale(2.0)
        let newTime: CMTime = CMTime(seconds: 5, preferredTimescale: timeScale)
        let zeroTime: CMTime = CMTime(seconds: 0, preferredTimescale: timeScale)
        self.player.seekToTime(to: newTime, toleranceBefore: zeroTime, toleranceAfter: zeroTime, completionHandler: nil)
        self.player.pause()

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

extension VideoPlayerViewController: PlayerPlaybackDelegate {

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
