//
// Created by Denis Kartavenko on 29.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

class ViewBuilder {

	static func buildStackView(axis: NSLayoutConstraint.Axis = .vertical) -> UIStackView {
		let stackView = UIStackView()
		stackView.distribution = .fillEqually
		stackView.alignment = .fill
		stackView.axis = axis
		return stackView
	}

	static func buildLabel(text: String = "") -> UILabel {
		let label = UILabel()
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		label.text = text
		return label
	}

	static func buildCustomTextField(value: String = "", placeholder :String = "") -> CustomTextField {
		let textField = CustomTextField()
		textField.layer.borderColor = UIColor.darkGray.cgColor
		textField.layer.borderWidth = 1.0
		textField.placeholder = placeholder

		textField.setLeftPaddingPoints(5)
		textField.setRightPaddingPoints(5)

		textField.autocorrectionType = .no

		return textField
	}
}