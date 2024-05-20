//
//  HomeViewController.swift
//  JackFlix
//
//  Created by gnksbm on 5/16/24.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet var gradientView: UIView!
    @IBOutlet var largeImageView: UIImageView!
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var likedListBtn: UIButton!
    @IBOutlet var smallImgView1: UIImageView!
    @IBOutlet var smallImgView2: UIImageView!
    @IBOutlet var smallImgView3: UIImageView!
    
    var imageBadges = [UIImageView]()
    
    let movieList = [
        UIImage.노량,
        UIImage.더퍼스트슬램덩크,
        UIImage.밀수,
        UIImage.범죄도시3,
        UIImage.서울의봄,
        UIImage.스즈메의문단속,
        UIImage.아바타물의길,
        UIImage.오펜하이머,
        UIImage.육사오,
        UIImage.콘크리트유토피아,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            #colorLiteral(red: 0.2244018614, green: 0.21944049, blue: 0.1891315877, alpha: 1).cgColor,
            UIColor.black.cgColor,
        ]
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradientLayer)
        largeImageView.layer.cornerRadius = 10
        [
            playBtn, likedListBtn,
            smallImgView1, smallImgView2, smallImgView3
        ].forEach {
            $0.layer.cornerRadius = 5
        }
        [smallImgView1, smallImgView2, smallImgView3].forEach {
            imageBadges += $0.overlayBadge()
        }
    }
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        var newMovieList = movieList.shuffled()
        largeImageView.image = newMovieList.removeFirst()
        smallImgView1.image = newMovieList.removeFirst()
        smallImgView2.image = newMovieList.removeFirst()
        smallImgView3.image = newMovieList.removeFirst()
        imageBadges.forEach { $0.isHidden = Bool.random() }
    }
}

extension UIImageView {
    func overlayBadge() -> [UIImageView] {
        let leadingBadgeView = UIImageView()
        let trailingBadgeView = UIImageView()
        [leadingBadgeView, trailingBadgeView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        NSLayoutConstraint.activate([
            leadingBadgeView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 5
            ),
            leadingBadgeView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 5
            ),
            
            trailingBadgeView.topAnchor.constraint(equalTo: topAnchor),
            trailingBadgeView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
        ])
        
        leadingBadgeView.image = .singleBadge
        trailingBadgeView.image = .top10Badge
        let badgeViews = [leadingBadgeView, trailingBadgeView]
        badgeViews.forEach { $0.isHidden = Bool.random() }
        return badgeViews
    }
}

// 첫번째 VC
// 재생 버튼을 누르면 모든 이미지 랜덤으로 변경
// Top10, 새로운 에피소드, 새로운 시리즈 등도 이미지 변경될 때 랜덤하게 변경
