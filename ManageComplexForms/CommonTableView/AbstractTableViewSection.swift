//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

class AbstractTableViewSection: NSObject, AbstractTableViewSectionProtocol {

	typealias ModelCellConfigurator = (ModelProtocol, UITableViewCell) -> Void

	var onReorderCellsCallback: ((_ from: Int, _ to: Int) -> Void)?
	var onRemoveCellCallback: ((_ indexPath: IndexPath) -> Void)?
	var onNeedReloadTableView: (() -> Void)?
	var canMove: Bool = false

	internal var modelCellConfigurator: ModelCellConfigurator
	private let reuseIdentifier: String
	private var models: [ModelProtocol]

	init(models: [ModelProtocol] = [], reuseIdentifier: String = "", cellConfigurator: @escaping ModelCellConfigurator) {
		self.models = models
		self.reuseIdentifier = reuseIdentifier
		self.modelCellConfigurator = cellConfigurator
		self.onReorderCellsCallback = nil
	}

	func addModel(_ item: ModelProtocol, at index: Int) {
		models.insert(item, at: index)
	}

	func getModels() -> [ModelProtocol] {
		models
	}

	func setModels(models: [ModelProtocol]) {
		self.models = models
	}

	func removeModel(_ indexPath: IndexPath) {
		models.remove(at: indexPath.row)
		onRemoveCellCallback?(indexPath)
	}

	static func defaultCellConfigurator() -> ModelCellConfigurator {
		{ (model, cell) in
			if let cell = cell as? TableViewModelCell {
				cell.modelProtocol = model
			}
		}
	}
}

extension AbstractTableViewSection {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		models.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = models[indexPath.row]

		var cell: UITableViewCell
		if reuseIdentifier.isEmpty {
			cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath)
		} else {
			cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		}

		initCellCallbacks(cell)

		modelCellConfigurator(model, cell)

		return cell
	}

	private func initCellCallbacks(_ cell: UITableViewCell) {
		if let cell = cell as? TableViewModelCell {
			cell.onNeedReloadTableView = {[weak self] in
				self?.onNeedReloadTableView?()
			}
		}
	}

	func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		canMove
	}

	func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		if sourceIndexPath.row != destinationIndexPath.row {
			onReorderCellsCallback?(sourceIndexPath.row, destinationIndexPath.row)
		}
	}
}