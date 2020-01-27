//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

protocol ModelProtocol {
	var reuseIdentifier: String { get set }
	var data: Any? { get set }
	var editingStyle: UITableViewCell.EditingStyle { get set }
}

extension ModelProtocol {
	var reuseIdentifier: String {
		get { "" }
		set {}
	}
	var data: Any? {
		get { nil }
		set {}
	}
	var editingStyle: UITableViewCell.EditingStyle {
		get { .none }
		set {}
	}
}