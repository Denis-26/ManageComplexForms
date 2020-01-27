//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

extension AbstractSectionHolder: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		sections.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let section = sections[section]
		let dataSource = section.tableViewSection as! AbstractTableViewSection
		return dataSource.tableView(tableView, numberOfRowsInSection: 0)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let section = sections[indexPath.section]
		let indexPath = IndexPath(row: indexPath.row, section: 0)
		let tableViewSection = section.tableViewSection as! AbstractTableViewSection
		return tableViewSection.tableView(tableView, cellForRowAt: indexPath)
	}

	func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		let section = sections[indexPath.section]
		let tableViewSection = section.tableViewSection as! AbstractTableViewSection
		return tableViewSection.tableView(tableView, canMoveRowAt: indexPath)
	}

	func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		let section = sections[sourceIndexPath.section]
		let tableViewSection = section.tableViewSection as! AbstractTableViewSection
		tableViewSection.tableView(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
	}
}