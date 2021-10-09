//
//  BaloonViewController.swift
//  moreTechApp
//
//  Created by i.mamadaev on 09.10.2021.
//

import UIKit
import SnapKit
import AVFoundation
import SwiftUI

class BaloonViewController: UIViewController {

    private let label = UILabel()
    private let ballonView = UIView()
    private let ropeImageView = UIImageView()
    private let ballonImageView = UIImageView()
    private let myFirstButton = UIButton()
    private let confettiView = ConfettiContentView()
    var player: AVAudioPlayer!
    
    private var exploded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.addSubview(label)
        setuoLabelUI()
        self.view.addSubview(ballonView)
        setupBallonUI()
    }
    
    private func setuoLabelUI() {
        // Do any additional setup after loading the view.
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
//        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Balloon Analog Risk Task (BART)"
        label.sizeToFit()
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(120)
            $0.left.equalTo(self.view.snp.left).offset(50)
            $0.right.equalTo(self.view.snp.right).offset(-50)
        }
        
        myFirstButton.frame = CGRect(x: 15, y: -50, width: 300, height: 100)
        myFirstButton.backgroundColor = .white
        myFirstButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        myFirstButton.layer.cornerRadius = 15
        myFirstButton.setTitle("New balloon", for: .normal)
        myFirstButton.setTitleColor(.black, for: .normal)
        myFirstButton.layer.borderColor = UIColor.black.cgColor
        myFirstButton.layer.borderWidth = 1
        self.view.addSubview(myFirstButton)
        myFirstButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-100)
            $0.left.equalTo(self.view.snp.left).offset(50)
            $0.right.equalTo(self.view.snp.right).offset(-50)
        }
    }
    
    
    
    
    private func setupBallonUI() {
        
        
        ballonView.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.height / 2)
//        ballonView.layer.cornerRadius = 50
////        ballonView.snp.makeConstraints {
////            $0.center.equalToSuperview()
////        }
//        ballonView.frame = CGRect(x: screenMidX, y: screenMidY, width: 100, height: 100)
//        ballonView.frame.size.height = 100
//        ballonView.frame.size.width = 100
//        ballonView.backgroundColor = .red
        let screenMidX = self.ballonView.frame.width / 2
        let screenMidY = self.ballonView.frame.height / 2

        
        
        
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        self.ballonImageView.isUserInteractionEnabled = true

        self.ballonImageView.addGestureRecognizer(gesture)
        
        
        
        ballonImageView.frame = CGRect(x: screenMidX, y: screenMidY, width: 150, height: 162)
        ballonImageView.image = UIImage(named: "balloon_1.png")
//        ballonImageView.sizeToFit()
        ballonImageView.center.x = screenMidX
        ballonImageView.center.y = screenMidY
        ropeImageView.frame = CGRect(x: screenMidX, y: screenMidY, width: 150, height: 90)
        ropeImageView.image = UIImage(named: "balloon_2.png")
        ropeImageView.center.x = screenMidX
        ropeImageView.center.y = ballonImageView.center.y + ballonImageView.frame.height / 2 + ropeImageView.frame.height / 2
        
        self.ballonView.addSubview(ballonImageView)
        self.ballonView.addSubview(ropeImageView)
    }
    
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        print("Baloon tapped. New size is: ", self.ballonImageView.frame.size.height + 25)
        
        let newHeight = self.ballonImageView.frame.size.height + 25
        let newWidth = self.ballonImageView.frame.size.width + 25
        if exploded {
            return
        } else if ballonImageView.frame.height + 25 >= 300 {
            let url = Bundle.main.url(forResource: "pop", withExtension: "mp3")!
            
            

            player = try! AVAudioPlayer(contentsOf: url)
            player.play()

            let childView = UIHostingController(rootView: self.confettiView)
            addChild(childView)
            childView.view.frame = self.ballonView.frame
            childView.view.center = self.view.center
            view.addSubview(childView.view)
            view.sendSubviewToBack(childView.view)
            childView.didMove(toParent: self)

            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                childView.removeFromParent()
                childView.view.removeFromSuperview()
            }
            
            ballonImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 162)
            ballonImageView.center.x = self.ballonView.frame.width / 2
            ballonImageView.center.y = self.ballonView.frame.height / 2
            ballonImageView.image = UIImage(named: "balloon_3.png")
            self.exploded = true
//            let generator = UINotificationFeedbackGenerator()
//            generator.notificationOccurred(.error)
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        } else if !exploded {
            let url = Bundle.main.url(forResource: "inflate", withExtension: "mp3")!
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
            UIView.animate(withDuration: 0.5) {
                self.ballonImageView.frame.size.height = newHeight
                self.ballonImageView.frame.size.width = newWidth
                self.ballonImageView.center.x = self.ballonView.frame.width / 2
                self.ballonImageView.center.y = self.ropeImageView.frame.minY - newHeight / 2
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            }
        }
    }
    
    @objc func pressed() {
        let screenMidX = self.ballonView.frame.width / 2
        let screenMidY = self.ballonView.frame.height / 2

        
        
        ballonImageView.frame = CGRect(x: screenMidX, y: screenMidY, width: 150, height: 162)
        ballonImageView.image = UIImage(named: "balloon_1.png")
//        ballonImageView.sizeToFit()
        ballonImageView.center.x = screenMidX
        ballonImageView.center.y = screenMidY
        
        self.exploded = false
    }
    
    struct ConfettiContentView: View {
        @State public var counter4:Int = 0
        var body: some View {
            ZStack{
                Color.white
                ConfettiCannon(counter: $counter4, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200).onAppear(){counter4 += 1}
            }
            
        }
    }
}

