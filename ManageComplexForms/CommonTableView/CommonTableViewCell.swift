//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

class CommonTableViewCell: UITableViewCell {

	var onNeedReloadTableView: (() -> Void)?

	static var nib: UINib {
		UINib(nibName: identifier, bundle: nil)
	}

	static var identifier: String {
		String(describing: self)
	}

	override func awakeFromNib() {
		super.awakeFromNib()
	}
}