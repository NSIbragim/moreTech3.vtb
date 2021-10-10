//
//  BalloonViewController.swift
//  moreTechApp
//
//  Created by i.mamadaev on 09.10.2021.
//

import UIKit
import SnapKit
import AVFoundation
import SwiftUI

class BalloonViewController: UIViewController {

    // UI
    private let hintLabel = UILabel()
    private let balloonView = UIView()
    private let ropeImageView = UIImageView()
    private let balloonImageView = UIImageView()
    private let confettiView = ConfettiContentView()

    // Header
    private let headerView = UIView()
    private let headerStepLabel = UILabel()
    private let headerPriceLabel = UILabel()
    private let headerTotalLabel = UILabel()
    private let headerFixLabel = UILabel()
    private let closeButton = UIImageView()

    // Footer
    private let footerView = UIView()
    private let newBalloonButton = UIButton()

    // Reminder
    private let remindRulesView = UIView()
    private let remindRulesLabel = UILabel()
    private let rightButton = UIImageView()

    // Other Properties
    private var player: AVAudioPlayer!
    private var exploded = false
    private var totalCash = 0
    private var currentCash = 0
    private var number = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(headerView)
        setupHeaderUI()
        self.view.addSubview(headerView)

        self.view.addSubview(hintLabel)
        setupLabelUI()

        self.view.addSubview(remindRulesView)
        setupRemindRulesViewUI()

        self.view.addSubview(footerView)
        setupFooterUI()

        self.view.addSubview(balloonView)
        setupBalloonUI()
    }

    private func setupRemindRulesViewUI() {
        remindRulesView.addSubview(remindRulesLabel)
        remindRulesView.addSubview(rightButton)

        remindRulesView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(126 + 52)
        }
        remindRulesView.layer.cornerRadius = 15
        remindRulesView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)

        remindRulesLabel.textColor = .black
        remindRulesLabel.text = "Напомнить правила"
        remindRulesLabel.font = UIFont.boldSystemFont(ofSize: 16)
        remindRulesLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.left.equalToSuperview().offset(16)
        }

        rightButton.image = UIImage(named: "Union.png")
        rightButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
    }

    private func setupFooterUI() {
        footerView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(126)
        }
        footerView.backgroundColor = UIColor(red: 11/255, green: 29/255, blue: 55/255, alpha: 1)

        newBalloonButton.backgroundColor = .white
        newBalloonButton.addTarget(self, action: #selector(addNewBalloonPressed), for: .touchUpInside)
        newBalloonButton.layer.cornerRadius = 15
        newBalloonButton.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        newBalloonButton.setTitleColor(UIColor(red: 58/255, green: 131/255, blue: 241/255, alpha: 1), for: .normal)
        newBalloonButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        newBalloonButton.setTitleColor(.gray, for: .selected)
        newBalloonButton.setTitle("Фиксировать", for: .normal)
        newBalloonButton.layer.borderColor = UIColor.black.cgColor
        newBalloonButton.layer.borderWidth = 1
        self.footerView.addSubview(newBalloonButton)
        newBalloonButton.snp.makeConstraints {
            $0.size.height.equalTo(60)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.snp.bottom).offset(-50)
            $0.left.equalTo(self.view.snp.left).offset(16)
            $0.right.equalTo(self.view.snp.right).offset(-16)
        }
        footerView.layoutSubviews()
    }

    private func setupHeaderUI() {
        headerView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(112)
        }
        headerView.backgroundColor = UIColor(red: 11/255, green: 29/255, blue: 55/255, alpha: 1)

        headerView.addSubview(headerStepLabel)
        headerView.addSubview(headerPriceLabel)
        headerView.addSubview(headerTotalLabel)
        headerView.addSubview(headerFixLabel)
        headerView.addSubview(closeButton)

        headerStepLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8 + 44)
            $0.left.equalToSuperview().offset(16)
        }
        headerStepLabel.text = "Шар 1 из 30"
        headerStepLabel.font = UIFont.systemFont(ofSize: 16)
        headerStepLabel.textColor = .white
        headerStepLabel.sizeToFit()

        headerPriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8 + 44)
            $0.left.equalToSuperview().offset(161)
        }
        headerPriceLabel.text = "Зафиксировано"
        headerPriceLabel.font = UIFont.systemFont(ofSize: 16)
        headerPriceLabel.textColor = .white
        headerPriceLabel.sizeToFit()

        headerTotalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32 + 44)
            $0.left.equalToSuperview().offset(16)
        }
        headerTotalLabel.text = "0 ₽"
        headerTotalLabel.font = UIFont.boldSystemFont(ofSize: 22)
        headerTotalLabel.textColor = .white
        headerTotalLabel.sizeToFit()

        headerFixLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32 + 44)
            $0.left.equalToSuperview().offset(161)
        }
        headerFixLabel.text = "0 ₽"
        headerFixLabel.font = UIFont.boldSystemFont(ofSize: 22)
        headerFixLabel.textColor = .white
        headerFixLabel.sizeToFit()

        closeButton.image = UIImage(named: "xmark.png")
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14 + 44)
            $0.right.equalToSuperview().offset(-16)
            $0.size.width.equalTo(16)
            $0.size.height.equalTo(16)
        }
        let gesture = UITapGestureRecognizer(target: self, action: #selector (self.presentResultVC (_:)))
        closeButton.isUserInteractionEnabled = true
        closeButton.addGestureRecognizer(gesture)
    }

    private func setupLabelUI() {

        hintLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        hintLabel.textAlignment = .center
        hintLabel.textColor = .black
        hintLabel.text = "Нажмите на шар, чтобы надуть его"
        hintLabel.sizeToFit()
        hintLabel.font = UIFont.systemFont(ofSize: 16)
        hintLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.headerView.snp.bottom).offset(16)
        }
    }

    private func setupBalloonUI() {
        balloonView.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.height / 2)
        let screenMidX = self.balloonView.frame.width / 2
        let screenMidY = self.balloonView.frame.height / 2

        let gesture = UITapGestureRecognizer(target: self, action: #selector (self.balloonPressed (_:)))
        self.balloonImageView.isUserInteractionEnabled = true
        self.balloonImageView.addGestureRecognizer(gesture)
        balloonImageView.frame = CGRect(x: screenMidX, y: screenMidY, width: 150, height: 162)
        balloonImageView.image = UIImage(named: "balloon_1_b.png")
        balloonImageView.center.x = screenMidX
        balloonImageView.center.y = screenMidY
        ropeImageView.frame = CGRect(x: screenMidX, y: screenMidY, width: 150, height: 90)
        ropeImageView.image = UIImage(named: "balloon_2_b.png")
        ropeImageView.center.x = screenMidX
        ropeImageView.center.y = balloonImageView.center.y + balloonImageView.frame.height / 2 + ropeImageView.frame.height / 2
        self.balloonView.addSubview(balloonImageView)
        self.balloonView.addSubview(ropeImageView)
    }

    @objc func balloonPressed(_ sender: UITapGestureRecognizer) {
        print("Baloon tapped. New size is: ", self.balloonImageView.frame.size.height + 25)
        let newHeight = self.balloonImageView.frame.size.height + 25
        let newWidth = self.balloonImageView.frame.size.width + 25
        if exploded {
            newBalloonButton.setTitle("Фиксировать", for: .normal)
            return
        } else if balloonImageView.frame.height + 25 >= 240 {
            hintLabel.text = "Буууммм!"
            headerFixLabel.text = "0 ₽"
            hintLabel.sizeToFit()
            newBalloonButton.setTitle("Следющий шар", for: .normal)
            self.currentCash = 0

            let url = Bundle.main.url(forResource: "pop", withExtension: "mp3")!
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()

            let childView = UIHostingController(rootView: self.confettiView)
            addChild(childView)
            childView.view.frame = self.balloonView.frame
            childView.view.center = self.view.center
            view.addSubview(childView.view)
            view.sendSubviewToBack(childView.view)
            childView.didMove(toParent: self)

            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                childView.removeFromParent()
                childView.view.removeFromSuperview()
            }

            balloonImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 162)
            balloonImageView.center.x = self.balloonView.frame.width / 2
            balloonImageView.center.y = self.balloonView.frame.height / 2
            balloonImageView.image = UIImage(named: "balloon_3_b.png")
            self.exploded = true
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        } else if !exploded {
            self.currentCash += 100
            headerFixLabel.text = String(currentCash) + " ₽"
            let url = Bundle.main.url(forResource: "inflate", withExtension: "mp3")!
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
            UIView.animate(withDuration: 0.5) {
                self.balloonImageView.frame.size.height = newHeight
                self.balloonImageView.frame.size.width = newWidth
                self.balloonImageView.center.x = self.balloonView.frame.width / 2
                self.balloonImageView.center.y = self.ropeImageView.frame.minY - newHeight / 2
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            }
        }
        self.view.layoutSubviews()
    }

    @objc func addNewBalloonPressed() {
        hintLabel.text = "Нажмите на шар, чтобы надуть его!"
        totalCash += currentCash
        currentCash = 0
        self.number += 1
        headerStepLabel.text = "Шаг " + String(self.number) + " из 30"
        headerFixLabel.text = "0 ₽"
        headerTotalLabel.text = String(totalCash) + " ₽"
        hintLabel.sizeToFit()
        let screenMidX = self.balloonView.frame.width / 2
        let screenMidY = self.balloonView.frame.height / 2
        balloonImageView.frame = CGRect(x: screenMidX, y: screenMidY, width: 150, height: 162)
        balloonImageView.image = UIImage(named: "balloon_1_b.png")
        balloonImageView.center.x = screenMidX
        balloonImageView.center.y = screenMidY
        newBalloonButton.setTitle("Фиксировать", for: .normal)


        self.exploded = false
        self.view.layoutSubviews()
    }

    @objc private func presentResultVC(_ sender: UITapGestureRecognizer) {
        self.present(BalloonTestResultViewController(), animated: true, completion: nil)
    }

    /// SwiftUI Confetti Animatation
    struct ConfettiContentView: View {
        @State public var counter4: Int = 0
        var body: some View {
            ZStack {
                Color.white
                ConfettiCannon(counter: $counter4, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200).onAppear {counter4 += 1}
            }

        }
    }
}
