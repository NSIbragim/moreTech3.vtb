//
//  FooterLoaderView.swift
//  moreTechApp
//
//  Created by i.mamadaev on 10.10.2021.
//

import UIKit

class FooterLoaderView: UIView {

    public let backgroundIndicateView = UIView()
    private var progress: CGFloat = 0
    private var lastProgress = CGFloat()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.progress = 0
        self.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)
        self.backgroundIndicateView.backgroundColor = .white
        self.backgroundIndicateView.layer.cornerRadius = 2
        self.addSubview(backgroundIndicateView)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setProgress(progress: CGFloat) {
        let progressWidth = progress * self.frame.width

        UIView.animate(withDuration: 15) {
            self.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: progressWidth, height: self.frame.height)

        }

    }
}
