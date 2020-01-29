//
// Created by Denis Kartavenko on 29.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation


class NumberUtil {

	static func toInt(_ string: String, def: Int = 0) -> Int {
		if let int = Int(string) {
			return int
		}
		return def
	}
}