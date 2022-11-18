//
//  CustomTextField.swift
//  iOS-Gaebalzarang
//
//  Created by juntaek.oh on 2022/08/08.
//

import UIKit

final class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureBasicSetting()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setPlaceHolder() {
        guard let text = placeholder else { return }
        attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gzGray1 ?? UIColor.gray])
    }

    func setCornerRound(value: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = value
    }
}

private extension CustomTextField {

    func configureBasicSetting() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gzGray1?.cgColor
        textColor = .gzChacoal
        font = .systemFont(ofSize: 14)
        addLeftPadding()
    }
}
