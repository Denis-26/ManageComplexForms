//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class Model: ModelProtocol, Equatable {

	var rowId: Int = 0
	var data: Any?
	var reuseIdentifier: String = ""

	init<T>(data: T) {
		self.data = data
	}

	init<T>(data: T, reuseIdentifier: String) {
		self.data = data
		self.reuseIdentifier = reuseIdentifier
	}

	static func ==(lhs: Model, rhs: Model) -> Bool {
		lhs.rowId == rhs.rowId
	}
}