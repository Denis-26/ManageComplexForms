//
// Created by Denis Kartavenko on 29.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class StringUtil {

	static func defString(_ string: String?, def: String = "") -> String {
		string ?? def
	}

}
