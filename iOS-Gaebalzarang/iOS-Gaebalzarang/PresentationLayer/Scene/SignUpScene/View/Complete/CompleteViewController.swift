//
//  CompleteViewController.swift
//  iOS-Gaebalzarang
//
//  Created by juntaek.oh on 2022/08/10.
//

import UIKit

final class CompleteViewController: UIViewController {

    private lazy var titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "가입되셨습니다."
        label.textColor = .black
        label.numberOfLines = 1
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "가입해주셔서 감사합니다.\n로그인 후 서비스를 이용 해주시면 됩니다."
        label.textColor = .gzChacoal
        label.numberOfLines = 2
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var confirmButton: CustomButton = {
        let nextButtonRound = DesignGuide.estimateCornerRadius(origin: 50, frame: view.frame)
        let button = CustomButton()
        button.isEnabled = true
        button.setTitle("확인", for: .normal)
        button.setCornerRound(value: nextButtonRound)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationItem()
        configureLayouts()
    }
}

private extension CompleteViewController {

    func configureNavigationItem() {
        navigationItem.hidesBackButton = true
    }

    func configureLayouts() {
        view.addSubviews(titleImageView, titleLabel, descriptionLabel, confirmButton)

        let imageTopConstant = DesignGuide.estimateYAxisLength(origin: 85, frame: view.frame)
        let imageRect = DesignGuide.estimateXAxisLength(origin: 180, frame: view.frame)

        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: imageTopConstant),
            titleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImageView.widthAnchor.constraint(equalToConstant: imageRect),
            titleImageView.heightAnchor.constraint(equalToConstant: imageRect)
        ])

        let titleLabelTopConstant = DesignGuide.estimateYAxisLength(origin: 32, frame: view.frame)
        let titleLabelHeight = DesignGuide.estimateYAxisLength(origin: 25, frame: view.frame)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: titleLabelTopConstant),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabelHeight)
        ])

        let descriptionLabelTopConstant = DesignGuide.estimateYAxisLength(origin: 26, frame: view.frame)
        let descriptionLabelHeight = DesignGuide.estimateYAxisLength(origin: 40, frame: view.frame)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: descriptionLabelTopConstant),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: descriptionLabelHeight)
        ])

        let buttonTopConstant = DesignGuide.estimateYAxisLength(origin: 161, frame: view.frame)
        let buttonWidth = DesignGuide.estimateXAxisLength(origin: 322, frame: view.frame)
        let buttonHeight = DesignGuide.estimateYAxisLength(origin: 50, frame: view.frame)

        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: buttonTopConstant),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            confirmButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }
}