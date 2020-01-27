//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class AbstractSectionHolder: NSObject {

	internal var sections: [Section]

	override init() {
		sections = [Section]()
	}
}