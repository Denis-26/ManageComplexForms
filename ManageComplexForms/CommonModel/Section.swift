//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class Section {

	var title: String = ""
	private var tableViewSection: AbstractTableViewSectionProtocol

	init(title: Strin, tableViewSection: TableViewSection) {
		self.title = title
		self.tableViewSection = tableViewSection
	}

	func removeCellCallback(indexPath: IndexPath) {
		tableViewSection.removeModel(indexPath)
	}

	func getSectionModels() -> [ModelProtocol] {
		tableViewSection.getModels()
	}
}