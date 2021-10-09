//
//  LoaderView.swift
//  moreTechApp
//
//  Created by i.mamadaev on 09.10.2021.
//

import UIKit

class LoaderView: UIView {

    private var state: Int
    private let loader_1 = UIView()
    private let loader_2 = UIView()
    private let loader_3 = UIView()
    
    init(state: Int) {
        self.state = state
        super.init(frame: CGRect(x: 0, y: 0, width: 382, height: 4))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupLoaders() {
        let loaderWidth = (self.frame.size.width - 10 - 32) / 3
        loader_1.frame = CGRect(x: 0, y: 0, width: loaderWidth, height: 4)
        loader_2.frame = CGRect(x: loaderWidth + 5, y: 0, width: loaderWidth, height: 4)
        loader_3.frame = CGRect(x: loaderWidth * 2 + 10, y: 0, width: loaderWidth, height: 4)
        
        loader_1.backgroundColor = .white
        loader_2.backgroundColor = .gray
        loader_3.backgroundColor = .gray
        
        self.addSubview(loader_1)
        self.addSubview(loader_2)
        self.addSubview(loader_3)
    }
    
    public func updateLoaderState() {
        if state >= 3 {
            state = 0
        }
        if state == 0 {
            loader_1.backgroundColor = .white
            loader_2.backgroundColor = .gray
            loader_3.backgroundColor = .gray
        } else if state == 1 {
            loader_1.backgroundColor = .gray
            loader_2.backgroundColor = .white
            loader_3.backgroundColor = .gray
        } else if state == 2 {
            loader_1.backgroundColor = .gray
            loader_2.backgroundColor = .gray
            loader_3.backgroundColor = .white
        }
        state += 1

        self.layoutSubviews()
    }

}
