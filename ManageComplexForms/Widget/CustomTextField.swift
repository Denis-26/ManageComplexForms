//
// Created by Denis Kartavenko on 29.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

	var onEditingChange: ((_ newValue: String) -> Void)?

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		initialize()
	}

	required override init(frame: CGRect) {
		super.init(frame: frame)
		initialize()
	}

	private func initialize() {
		addTarget(self, action: #selector(onEdit), for: .editingChanged)

		snp.makeConstraints { make in
			make.height.equalTo(30)
		}
	}

	@objc private func onEdit(_ sender: UITextField) {
		onEditingChange?(StringUtil.defString(sender.text))
	}

}