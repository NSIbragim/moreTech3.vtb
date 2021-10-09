//
//  BalloonTestResultViewController.swift
//  moreTechApp
//
//  Created by i.mamadaev on 10.10.2021.
//

import UIKit
import SnapKit

class BalloonTestResultViewController: UIViewController {

    private let balloonImageView = UIImageView()
    private let closeButton = UIImageView()
    private let hintLabel = UILabel()
    private let newBalloonButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(balloonImageView)
        view.addSubview(closeButton)
        view.addSubview(hintLabel)
        view.addSubview(newBalloonButton)
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        balloonImageView.image = UIImage(named: "results.png")
        balloonImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.left.right.equalToSuperview()
            $0.size.height.equalTo(480)
        }
        
        closeButton.image = UIImage(named: "xmark_b.png")
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-30)
            $0.size.width.equalTo(16)
            $0.size.height.equalTo(16)
        }
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.addNewBalloonPressed (_:)))
        closeButton.isUserInteractionEnabled = true
        closeButton.addGestureRecognizer(gesture)
        
        hintLabel.textColor = UIColor(red: 58/255, green: 131/255, blue: 241/255, alpha: 1)
        hintLabel.font = UIFont.boldSystemFont(ofSize: 20)
        hintLabel.text = "Сыграть ещё раз"
        hintLabel.sizeToFit()
        hintLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(68)
        }
        
        newBalloonButton.backgroundColor = .white
        newBalloonButton.setTitleColor(.white, for: .selected)
        newBalloonButton.layer.cornerRadius = 15
        newBalloonButton.backgroundColor = UIColor(red: 58/255, green: 131/255, blue: 241/255, alpha: 1)
        newBalloonButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        newBalloonButton.setTitle("Инвестировать", for: .normal)
        newBalloonButton.sizeToFit()
        newBalloonButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
            $0.left.equalToSuperview().offset(16)
            $0.bottom.equalTo(self.view.snp.bottom).offset(-114)
            $0.size.height.equalTo(60)
        }
        
    }
    
    @objc private func addNewBalloonPressed(_ sender:UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
