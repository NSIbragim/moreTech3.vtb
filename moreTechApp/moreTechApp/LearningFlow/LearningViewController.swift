//
//  LearningViewController.swift
//  moreTechApp
//
//  Created by i.mamadaev on 10.10.2021.
//

import UIKit
import SnapKit
import Player
import CoreMedia

class LearningViewController: UIViewController {

    // Header
    private let headerView = UIView()
    private let headerTitleLabel = UILabel()
    private let headerSubtitleLabel = UILabel()
    private let headerLeftButton = UIImageView()
    private let headerRightButton = UIImageView()

    // Main
    private let mainImage = UIImageView()
    private let player = Player()

    // Hint
    private let hintView = UIView()
    private let hintTitle = UILabel()
    private let hintText = UILabel()

    // Footer
    private let footerView = UIView()
    private let footerTitle = UILabel()
    private let footerText = UILabel()
    private let footerLoader = FooterLoaderView()

    private let footerResultTitle = UILabel()
    private let footerResultText = UILabel()
    private let footerBuyButton = UIButton()
    private let footerSellButton = UIButton()
    private let footerNextButton = UIImageView()

    // Other
    private var stepCount: Int = 0

    // MARK: object lifecycle
    deinit {
        self.player.willMove(toParent: nil)
        self.player.view.removeFromSuperview()
        self.player.removeFromParent()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(headerView)
        setupHeaderUI()
        self.view.addSubview(mainImage)
        setupMainUI()
        self.view.addSubview(footerView)
        setupFooterUI()
        self.view.addSubview(hintView)
        setupHintUI()
        // Do any additional setup after loading the view.
    }

    private func setupHeaderUI() {
        headerView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(112)
        }
        headerView.backgroundColor = UIColor(red: 11/255, green: 29/255, blue: 55/255, alpha: 1)

        headerView.addSubview(headerTitleLabel)
        headerView.addSubview(headerSubtitleLabel)
        headerView.addSubview(headerLeftButton)
        headerView.addSubview(headerRightButton)

        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8 + 44)
            $0.left.equalToSuperview().offset(16)
        }
        headerTitleLabel.text = "Кейс 1 из 5"
        headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        headerTitleLabel.textColor = .white
        headerTitleLabel.sizeToFit()

        headerSubtitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30 + 44)
            $0.left.equalToSuperview().offset(16)
        }
        headerSubtitleLabel.text = "2 минуты"
        headerSubtitleLabel.font = UIFont.systemFont(ofSize: 14)
        headerSubtitleLabel.textColor = .lightGray
        headerSubtitleLabel.sizeToFit()

        headerLeftButton.image = UIImage(named: "xmark.png")
        headerLeftButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14 + 44)
            $0.right.equalToSuperview().offset(-16)
            $0.size.width.equalTo(16)
            $0.size.height.equalTo(16)
        }

        headerRightButton.image = UIImage(named: "Union_b.png")
        headerRightButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17 + 44)
            $0.left.equalTo(headerTitleLabel.snp.right).offset(8)
        }
    }

    private func setupMainUI() {
        mainImage.image = UIImage(named: "chad.png")
        mainImage.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom)
        }
    }

    private func setupHintUI() {
        hintView.addSubview(hintTitle)
        hintView.addSubview(hintText)

        hintView.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 0.85)
        hintView.snp.makeConstraints {
            $0.bottom.equalTo(footerView.snp.top).offset(-16)
            $0.left.equalToSuperview().offset(28)
            $0.right.equalToSuperview().inset(28)
            $0.size.height.equalTo(122)
        }
        hintView.layer.cornerRadius = 25

        hintTitle.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
        }
        hintTitle.text = "Ситуация"
        hintTitle.font = UIFont.boldSystemFont(ofSize: 16)
        hintTitle.textColor = .black
        hintTitle.sizeToFit()

        hintText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(46)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
        }
        hintText.numberOfLines = 0
        hintText.text = "Вы владеете акциями Facebook, у компании произошел крупный сбой, об это говорят на всех телеканалах и во всех газетах"
        hintText.font = UIFont.systemFont(ofSize: 14)
        hintText.textColor = .black
        hintText.sizeToFit()
    }

    private func setupFooterUI() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector (self.nextStep (_:)))
        footerView.isUserInteractionEnabled = true
        footerView.addGestureRecognizer(gesture)

        footerView.addSubview(footerTitle)
        footerView.addSubview(footerText)
        footerView.addSubview(footerLoader)
        footerView.addSubview(footerResultTitle)
        footerView.addSubview(footerResultText)
        footerView.addSubview(footerBuyButton)
        footerView.addSubview(footerSellButton)
        footerView.addSubview(footerNextButton)

        footerView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(146)
        }
        footerView.backgroundColor = UIColor(red: 11/255, green: 29/255, blue: 55/255, alpha: 1)

        footerTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.centerX.equalToSuperview()
        }
        footerTitle.text = "Контекст"
        footerTitle.font = UIFont.systemFont(ofSize: 16)
        footerTitle.textColor = .lightGray
        footerTitle.sizeToFit()

        footerText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64)
            $0.centerX.equalToSuperview()
        }
        footerText.text = "Крупный сбой Facebook"
        footerText.font = UIFont.boldSystemFont(ofSize: 22)
        footerText.textColor = .white
        footerText.sizeToFit()

        footerLoader.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(16)
        }

        footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
        footerLoader.setProgress(progress: 1.0)

        footerResultTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.left.equalToSuperview().offset(144)
        }
        footerResultTitle.text = "Лучшее решение"
        footerResultTitle.font = UIFont.systemFont(ofSize: 16)
        footerResultTitle.textColor = .lightGray
        footerResultTitle.sizeToFit()

        footerResultText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64)
            $0.left.equalToSuperview().offset(144)
        }
        footerResultText.text = "Покупка"
        footerResultText.font = UIFont.boldSystemFont(ofSize: 22)
        footerResultText.textColor = .white
        footerResultText.sizeToFit()

        footerResultTitle.isHidden = true
        footerResultText.isHidden = true

        footerBuyButton.backgroundColor = .white
        footerBuyButton.layer.cornerRadius = 15
        footerBuyButton.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        footerBuyButton.setTitleColor(UIColor(red: 58/255, green: 131/255, blue: 241/255, alpha: 1), for: .normal)
        footerBuyButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        footerBuyButton.setTitleColor(.gray, for: .selected)
        footerBuyButton.setTitle("Купить", for: .normal)
        footerBuyButton.layer.borderColor = UIColor.black.cgColor
        footerBuyButton.layer.borderWidth = 1
        footerBuyButton.frame = CGRect(x: 16, y: 36, width: 174, height: 60)

        footerSellButton.backgroundColor = .white
        footerSellButton.layer.cornerRadius = 15
        footerSellButton.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        footerSellButton.setTitleColor(UIColor(red: 58/255, green: 131/255, blue: 241/255, alpha: 1), for: .normal)
        footerSellButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        footerSellButton.setTitleColor(.gray, for: .selected)
        footerSellButton.setTitle("Продать", for: .normal)
        footerSellButton.layer.borderColor = UIColor.black.cgColor
        footerSellButton.layer.borderWidth = 1
        footerSellButton.frame = CGRect(x: 204, y: 36, width: 174, height: 60)
        footerBuyButton.isHidden = true
        footerSellButton.isHidden = true

        footerNextButton.image = UIImage(named: "nextButton.png")
        footerNextButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(46)
            $0.right.equalToSuperview().offset(-16)
            $0.size.height.equalTo(45)
            $0.size.width.equalTo(45)
        }
        footerNextButton.isHidden = true

    }

    @objc private func nextStep(_ sender: UITapGestureRecognizer) {
        if stepCount == 0 {
            footerNextButton.isHidden = true

            footerText.text = "Новость про сбой везде"
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)
            self.player.playerDelegate = self
            self.player.playbackDelegate = self
            self.player.volume = 0.5
            self.player.fillMode = .resizeAspect
            self.player.playerView.playerBackgroundColor = .black

            self.view.addSubview(self.player.view)
            self.player.didMove(toParent: self)

            let localUrl = Bundle.main.url(forResource: "test2", withExtension: "mp4")
            self.player.url = localUrl

            self.player.playbackLoops = false

            self.view.bringSubviewToFront(footerView)
            self.view.bringSubviewToFront(headerView)

            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 1 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)
            footerNextButton.isHidden = false

            self.player.stop()
            self.player.removeFromParent()
            self.player.playerView.playerBackgroundColor = .white
            self.view.bringSubviewToFront(mainImage)
            self.view.bringSubviewToFront(footerView)
            self.view.bringSubviewToFront(headerView)
            self.view.backgroundColor = .white
            mainImage.snp.updateConstraints {
                $0.left.right.equalToSuperview()
                $0.top.equalTo(headerView.snp.bottom).offset(15)
            }
            mainImage.image = UIImage(named: "res1.png")
            footerText.text = "Акции падают"
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 2 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)
            mainImage.image = UIImage(named: "res2.png")
            footerNextButton.isHidden = true
            footerBuyButton.isHidden = false
            footerSellButton.isHidden = false
            footerText.isHidden = true
            footerTitle.isHidden = true
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 3 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)
            footerNextButton.isHidden = false
            footerBuyButton.isHidden = true
            footerSellButton.isHidden = true
            mainImage.image = UIImage(named: "res3.png")
            footerText.isHidden = false
            footerText.text = "Продажа"
            footerTitle.isHidden = false
            footerTitle.text = "Ваше решение"
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 4 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)
            footerNextButton.isHidden = false
            mainImage.image = UIImage(named: "res4.png")
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 5 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)

            mainImage.image = UIImage(named: "res5.png")
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 6 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)

            mainImage.image = UIImage(named: "res6.png")
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 7 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)

            mainImage.image = UIImage(named: "res7.png")
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 8 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)

            mainImage.image = UIImage(named: "res8.png")
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 9 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)
            footerNextButton.isHidden = true

            mainImage.image = UIImage(named: "res9.png")
            mainImage.snp.makeConstraints {
                $0.bottom.equalTo(footerView.snp.top).offset(35)
            }
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        } else if stepCount == 10 {
            footerLoader.backgroundIndicateView.frame = CGRect(x: 0, y: 0, width: 0, height: 4)
            footerNextButton.isHidden = true

            footerText.isHidden = false
            footerText.text = "Продажа"
            footerTitle.isHidden = false
            footerTitle.text = "Ваше решение"
            self.view.bringSubviewToFront(hintView)
            hintView.snp.updateConstraints {
                $0.size.height.equalTo(162)
            }
            hintTitle.text = "Вывод"
            hintText.text = "Сбои у подобных компаний имеют короткосрочное влияние, так как:\n1. Facebook стабильно наращивает аудиторию\n2. Рекламодателей становится больше\n3. Выручка ежегодно растет"
            // добавить лучшее решение
            mainImage.image = UIImage(named: "chad.png")
            mainImage.snp.updateConstraints {
                $0.top.equalTo(headerView.snp.bottom)
            }

            footerTitle.snp.makeConstraints {
                $0.left.equalToSuperview().offset(16)
            }
            footerTitle.sizeToFit()

            footerText.snp.makeConstraints {
                $0.left.equalToSuperview().offset(16)
            }
            footerText.sizeToFit()

            footerResultTitle.snp.makeConstraints {
                $0.left.equalToSuperview().offset(144)
            }
            footerResultTitle.sizeToFit()

            footerResultText.snp.makeConstraints {
                $0.left.equalToSuperview().offset(144)
            }
            footerResultText.sizeToFit()
            footerNextButton.removeFromSuperview()
            footerResultTitle.isHidden = false
            footerResultText.isHidden = false
            footerLoader.frame = CGRect(x: 0, y: 0, width: 360, height: 4)
            footerLoader.setProgress(progress: 1.0)
        }

        stepCount += 1

    }

}

// MARK: - UIGestureRecognizer

extension LearningViewController {

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

extension LearningViewController: PlayerDelegate {

    func playerReady(_ player: Player) {
        print("\(#function) ready")
        self.player.pause()

        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
        self.player.muted = false

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

extension LearningViewController: PlayerPlaybackDelegate {

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
