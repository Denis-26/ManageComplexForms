//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

extension AbstractSectionHolder: UITableViewDelegate {

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		40
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let section: Section = sections[section]

		var sectionTitle = section.title

		let headerCustomView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 0))
		let headerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.bounds.size.width, height: 40))

		headerLabel.font = headerLabel.font.withSize(20)
		headerCustomView.backgroundColor = .systemGray

		headerLabel.text = sectionTitle
		headerLabel.textColor = .white
		headerCustomView.addSubview(headerLabel)

		return headerCustomView
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		UITableView.automaticDimension
	}

	func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
		let delete = UITableViewRowAction(style: .normal, title: "Удалить") { _, indexPath in
			let section = self.sections[indexPath.section]
			section.removeCellCallback(indexPath: indexPath)
		}
		delete.backgroundColor = .red

		return [delete]
	}

	func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
		let section: Section = sections[indexPath.section]
		let model = section.getSectionModels()[indexPath.row]
		return model.editingStyle
	}

	func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
		false
	}

	func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath,
				   toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {

		let sourceSection = sourceIndexPath.section
		let destSection = proposedDestinationIndexPath.section

		if destSection < sourceSection {
			return IndexPath(row: 0, section: sourceSection)
		} else if destSection > sourceSection {
			return IndexPath(row: self.tableView(tableView, numberOfRowsInSection: sourceSection) - 1, section: sourceSection)
		}

		return proposedDestinationIndexPath
	}
}
