//
//  JoinViewController.swift
//  JackFlix
//
//  Created by gnksbm on 5/20/24.
//

import UIKit

final class JoinViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommendCodeTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignUpButton()
        setupTextFields()
    }
    
    private func setupSignUpButton() {
        signUpButton.addTarget(
            self,
            action: #selector(signUpButtonTapped),
            for: .touchUpInside
        )
        signUpButton.addTarget(
            self,
            action: #selector(hideKeyboard),
            for: .touchUpInside
        )
    }
    
    private func setupTextFields() {
        setupTextFieldsPlaceHolder()
        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(hideKeyboard))
        recommendCodeTextField.keyboardType = .numberPad
    }
    
    private func setupTextFieldsPlaceHolder() {
        let textFieldAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.white
        ]
        emailTextField.attributedPlaceholder = .init(
            string: "이메일 주소 또는 전화번호",
            attributes: textFieldAttributes
        )
        passwordTextField.attributedPlaceholder = .init(
            string: "비밀번호",
            attributes: textFieldAttributes
        )
        nicknameTextField.attributedPlaceholder = .init(
            string: "닉네임",
            attributes: textFieldAttributes
        )
        locationTextField.attributedPlaceholder = .init(
            string: "위치",
            attributes: textFieldAttributes
        )
        recommendCodeTextField.attributedPlaceholder = .init(
            string: "추천 코드 입력",
            attributes: textFieldAttributes
        )
    }
    
    private func checkValidation() {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text
        else { return }
        let emailFieldEmptyWarning = emailText.isEmpty
        let passwordFieldEmptyWarning = passwordText.isEmpty
        let shortPasswordWarning = passwordText.count < 6
        if emailFieldEmptyWarning {
            descriptionLabel.text = "이메일 주소가 비었습니다"
        } else if passwordFieldEmptyWarning {
            descriptionLabel.text = "비밀번호가 비었습니다"
        } else if shortPasswordWarning {
            descriptionLabel.text = "비밀번호는 6자리 이상이어야 합니다"
        } else {
            descriptionLabel.text = "회원가입이 완료되었습니다"
        }
    }
    
    @objc private func signUpButtonTapped(_ sender: UIButton) {
        checkValidation()
    }
    
    @objc private func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
}
