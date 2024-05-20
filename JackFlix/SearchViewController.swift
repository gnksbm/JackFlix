//
//  SearchViewController.swift
//  JackFlix
//
//  Created by gnksbm on 5/16/24.
//

import UIKit

final class SearchViewController: UIViewController {
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var publicBtn: UIButton!
    @IBOutlet var popularityBtn: UIButton!
    @IBOutlet var top10Btn: UIButton!
    @IBOutlet var descriptionLabel: UILabel!
    
    lazy var selectedBtn: UIButton = publicBtn {
        didSet {
            if oldValue != selectedBtn {
                oldValue.setTitleColor(.white, for: .normal)
                oldValue.backgroundColor = .clear
                let descriptionString = NSMutableAttributedString()
                descriptionString.append(
                    NSAttributedString(
                        string: "이런! \(selectedBtn.titleLabel?.text ?? "") 작품이 없습니다.\n",
                        attributes: [
                            .font: UIFont.systemFont(
                                ofSize: 24,
                                weight: .bold
                            )
                        ]
                    )
                )
                descriptionString.append(
                    NSAttributedString(
                        string: "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요",
                        attributes: [
                            .font: UIFont.systemFont(
                                ofSize: 12,
                                weight: .regular
                            )
                        ]
                    )
                )
                descriptionLabel.attributedText = descriptionString
            }
        }
        willSet {
            newValue.setTitleColor(.black, for: .normal)
            newValue.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchIconView = UIImageView()
        searchIconView.image = UIImage(systemName: "magnifyingglass")
        searchIconView.tintColor = .gray
        searchTextField.leftView = searchIconView
        searchTextField.leftViewMode = .always
        searchTextField.tintColor = .white
        searchTextField.attributedPlaceholder = .init(
            string: "게임, 시리즈, 영화를 검색하세요...",
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(
                    ofSize: 15,
                    weight: .medium
                )
            ]
        )
        let descriptionString = NSMutableAttributedString()
        descriptionString.append(
            NSAttributedString(
                string: "이런! 공개예정 작품이 없습니다.\n",
                attributes: [
                    .font: UIFont.systemFont(
                        ofSize: 24,
                        weight: .bold
                    )
                ]
            )
        )
        descriptionString.append(
            NSAttributedString(
                string: "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요",
                attributes: [
                    .font: UIFont.systemFont(
                        ofSize: 12,
                        weight: .regular
                    )
                ]
            )
        )
        descriptionLabel.attributedText = descriptionString
        descriptionLabel.textColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        [publicBtn, popularityBtn, top10Btn].forEach {
            $0.layer.cornerRadius = $0.bounds.height / 2
        }
    }
    
    @IBAction func categoryBtnTapped(_ sender: UIButton) {
        selectedBtn = sender
    }
}

// 두번째 VC
// TextField 구현
// 버튼을 누를때 마다 Label의 내용이 변경
