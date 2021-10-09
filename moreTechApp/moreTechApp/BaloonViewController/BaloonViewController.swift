//
//  BaloonViewController.swift
//  moreTechApp
//
//  Created by i.mamadaev on 09.10.2021.
//

import UIKit
import SnapKit

class BaloonViewController: UIViewController {

    private let label = UILabel()
    private let ballonView = UIView()
    private let ropeImageView = UIImageView()
    private let ballonImageView = UIImageView()
    
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
        label.text = "Тест!"
        label.sizeToFit()
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(120)
            $0.left.equalTo(self.view.snp.left).offset(50)
            $0.right.equalTo(self.view.snp.right).offset(-50)
        }
    }
    
    
    private func setupBallonUI() {
        
        
        ballonView.frame = CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: self.view.frame.height / 2)
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
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        self.ballonImageView.isUserInteractionEnabled = true

        self.ballonImageView.addGestureRecognizer(gesture)
    }
    
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        print("Baloon tapped. New size is: ", self.ballonImageView.frame.size.height + 25)
        
        let newHeight = self.ballonImageView.frame.size.height + 25
        let newWidth = self.ballonImageView.frame.size.width + 25
//        let newCornerRadius = 0.5 * (self.ballonImageView.frame.size.height + 25)
        
        UIView.animate(withDuration: 0.5) {
//            self.ballonImageView.layer.cornerRadius = newCornerRadius
            self.ballonImageView.frame.size.height = newHeight
            self.ballonImageView.frame.size.width = newWidth
            self.ballonImageView.center.x = self.ballonView.frame.width / 2
            self.ballonImageView.center.y = self.ropeImageView.frame.minY - newHeight / 2
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
        if ballonImageView.frame.height + 25 >= 300 {
//            ballonImageView.isHidden = true
            ballonImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 162)
            ballonImageView.center.x = self.ballonView.frame.width / 2
            ballonImageView.center.y = self.ballonView.frame.height / 2
            ballonImageView.image = UIImage(named: "balloon_3.png")
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
    }
    
}
