//
//  ViewController.swift
//  JackFlix
//
//  Created by gnksbm on 5/16/24.
//

import UIKit

class SavedViewController: UIViewController {
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var discoveryBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let descriptionText = NSMutableAttributedString()
        descriptionText.append(
            NSAttributedString(
                string: "나만의 자동 저장' 기능\n",
                attributes: [
                    .font: UIFont.systemFont(
                        ofSize: 20,
                        weight: .bold
                    ),
                    .foregroundColor: UIColor.white
                ]
            )
        )
        descriptionText.append(
            NSAttributedString(
                string: "\n취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.\n디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요.",
                attributes: [
                    .font: UIFont.systemFont(
                        ofSize: 14,
                        weight: .regular
                    ),
                    .foregroundColor: UIColor.gray
                ]
            )
        )
        descriptionLabel.attributedText = descriptionText
        discoveryBtn.layer.cornerRadius = 5
    }
}
