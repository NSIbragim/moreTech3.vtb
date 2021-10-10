//
//  OnboardingViewController.swift
//  moreTechApp
//
//  Created by i.mamadaev on 09.10.2021.
//

import UIKit
import SnapKit

private enum Constants {
    static let iconTopOffset: CGFloat = 132
    static let iconSize: CGFloat = 320

    static let titleOffset: CGFloat = 550
    static let titleLeftOffset: CGFloat = 15

    static let mainLabelOffset: CGFloat = 16
    static let mainLabelLeftOffset: CGFloat = 15
    static let mainLabelWidth: CGFloat = 360

    static let loaderTopOffset: CGFloat = 790
    static let loaderLeftOffset: CGFloat = 16
    static let loaderWidth: CGFloat = 124
    static let loaderHeight: CGFloat = 4

}

class OnboardingViewController: UIViewController {

    // UI
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let mainLabel = UILabel()
    private let loaderView = LoaderView(state: 0)
    private let closeButton = UIImageView()

    // Other
    private var currentStep = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer(target: self, action: #selector (self.onboardingPressed (_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor(red: 49/255, green: 111/255, blue: 204/255, alpha: 1)
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        view.addSubview(mainLabel)
        view.addSubview(loaderView)
        view.addSubview(closeButton)

        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.iconTopOffset)
            $0.height.equalTo(Constants.iconSize)
            $0.width.equalTo(Constants.iconSize)
            $0.centerX.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.titleOffset)
            $0.left.equalToSuperview().offset(Constants.titleLeftOffset)
        }
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = .white

        mainLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Constants.mainLabelOffset)
            $0.left.equalToSuperview().offset(Constants.mainLabelLeftOffset)
            $0.width.equalTo(Constants.mainLabelWidth)
        }
        mainLabel.font = UIFont.systemFont(ofSize: 16)
        mainLabel.textColor = .white

        loaderView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.loaderLeftOffset)
            $0.right.equalToSuperview().offset(Constants.loaderLeftOffset)
            $0.top.equalToSuperview().offset(Constants.loaderTopOffset)
            $0.height.equalTo(Constants.loaderHeight)
        }
        loaderView.setupLoaders()
        changeOnboardingStep()
    }

    private func changeOnboardingStep() {
        if currentStep == 0 {
            iconImageView.image = UIImage(named: "Saly-32.png")
            titleLabel.text = "Вводные"
            titleLabel.sizeToFit()
            mainLabel.text = "Вы увидите 30 различных воздушных шаров по одному за раз. Надуйте каждый воздушный шарик как можно больше, не лопая его. Самые большие воздушные шары стоят наибольшей награды."
            mainLabel.numberOfLines = 0
            mainLabel.sizeToFit()
            loaderView.updateLoaderState()

        } else if currentStep == 1 {
            iconImageView.image = UIImage(named: "Saly-36.png")
            titleLabel.text = "Принцип"
            titleLabel.sizeToFit()
            mainLabel.text = "Если воздушный шар не лопнет, награда увеличится. Если воздушный шар лопнет, вы не получите награды за этот воздушный шар и перейдете к следующему. Награда за шар добавляется к вашему общему выигрышу, и вы переходите к следующему воздушному шару."
            mainLabel.numberOfLines = 0
            mainLabel.sizeToFit()
            loaderView.updateLoaderState()
        } else if currentStep == 2 {
            iconImageView.image = UIImage(named: "Saly-45.png")
            titleLabel.text = "Рекомендация"
            titleLabel.sizeToFit()
            mainLabel.text = "Постарайтесь получить как можно больший общий выигрыш, двигаясь как можно быстрее. Знайте, что каждый из 30 воздушных шаров отличается и может лопаться в разных размерах."
            mainLabel.numberOfLines = 0
            mainLabel.sizeToFit()
            loaderView.updateLoaderState()
        }
        currentStep += 1
    }

    @objc private func onboardingPressed(_ gestureRecognizer: UITapGestureRecognizer) {
        if currentStep >= 3 {
            currentStep = 0
        }
        self.changeOnboardingStep()
        view.layoutSubviews()
    }

}
