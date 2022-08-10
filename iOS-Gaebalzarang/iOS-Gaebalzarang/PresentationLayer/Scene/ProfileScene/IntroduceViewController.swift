//
//  IntroduceViewController.swift
//  iOS-Gaebalzarang
//
//  Created by 최예주 on 2022/08/08.
//

import UIKit

final class IntroduceViewController: UIViewController {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요:)\n간단한 자기소개 부탁드려요."
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var optionLabel: UILabel = {
        let label = UILabel()
        label.text = "*필수"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.496, green: 0.496, blue: 0.496, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nickNameTextField: CustomTextField = {
        let textField = CustomTextField()
        let textFieldRound = DesignGuide.estimateCornerRadius(origin: 50, frame: view.frame)
        textField.setCornerRound(value: textFieldRound)
        textField.placeholder = "별명설정"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var introTextView: UITextView = {
        let textView = UITextView()
        let textViewRound = DesignGuide.estimateCornerRadius(origin: 50, frame: view.frame)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.clipsToBounds = true
        textView.layer.cornerRadius = textViewRound
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        textView.textColor = UIColor.placeholderText
        textView.text = "간단한 자기소개"
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.sizeToFit()
        textView.textContainerInset = .init(top: 20, left: 20, bottom: 20, right: 25)
        textView.isScrollEnabled = false
        return textView
    }()

    private lazy var nextButton: CustomButton = {
        let button = CustomButton()
        let buttonRound = DesignGuide.estimateCornerRadius(origin: 50, frame: view.frame)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.setCornerRound(value: buttonRound)
        button.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        button.setTitle("다음", for: .disabled)
        button.setTitleColor(UIColor.placeholderText, for: .disabled)
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        introTextView.delegate = self
        addsubViews()
        configureLayout()
    }
}

private extension IntroduceViewController {
    func addsubViews() {
        view.addSubview(titleLabel)
        view.addSubview(optionLabel)
        view.addSubview(nickNameTextField)
        view.addSubview(introTextView)
        view.addSubview(nextButton)
    }

    func configureLayout() {

        let defaultHeight = DesignGuide.estimateYAxisLength(origin: 50, frame: view.frame)

        let titleTopConstraint = DesignGuide.estimateYAxisLength(origin: 17, frame: view.frame)
        let titleWidthConstraint = DesignGuide.estimateXAxisLength(origin: 267, frame: view.frame)
        let titleHeightConstraint = DesignGuide.estimateYAxisLength(origin: 64, frame: view.frame)

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: titleTopConstraint),
            titleLabel.widthAnchor.constraint(equalToConstant: titleWidthConstraint),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: titleHeightConstraint)
        ])

        let optionTopConstraint = DesignGuide.estimateYAxisLength(origin: 5, frame: view.frame)

        NSLayoutConstraint.activate([
            optionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: optionTopConstraint),
            optionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])

        let nickNameTopConstraint = DesignGuide.estimateYAxisLength(origin: 30, frame: view.frame)
        let nickNameWidthConstraint = DesignGuide.estimateXAxisLength(origin: 322, frame: view.frame)

        NSLayoutConstraint.activate([
            nickNameTextField.topAnchor.constraint(equalTo: optionLabel.bottomAnchor, constant: nickNameTopConstraint),
            nickNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nickNameTextField.heightAnchor.constraint(equalToConstant: defaultHeight),
            nickNameTextField.widthAnchor.constraint(equalToConstant: nickNameWidthConstraint)
        ])

        let introTopConstraint = DesignGuide.estimateYAxisLength(origin: 14, frame: view.frame)

        NSLayoutConstraint.activate([
            introTextView.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: introTopConstraint),
            introTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            introTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: defaultHeight),
            introTextView.widthAnchor.constraint(equalTo: nickNameTextField.widthAnchor)

        ])

        let nextBtnBottomConstraint = -(DesignGuide.estimateYAxisLength(origin: 24, frame: view.frame))

        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: nextBtnBottomConstraint),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalTo: introTextView.widthAnchor),
            nextButton.heightAnchor.constraint(equalTo: nickNameTextField.heightAnchor),

            nextButton.topAnchor.constraint(greaterThanOrEqualTo: introTextView.bottomAnchor, constant: 50)
        ])

    }
}

// MARK: textField Delegate
extension IntroduceViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "간단한 자기소개"
            textView.textColor = .placeholderText
        }
    }

}
