//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

protocol AbstractTableViewSectionProtocol: UITableViewDataSource {
	var onReorderCellsCallback: ((_ from: Int, _ to: Int) -> Void)? { get set }
	var onRemoveCellCallback: ((_ indexPath: IndexPath) -> Void)? { get set }
	var onNeedReloadTableView: (() -> Void)? { get set }
	var canMove: Bool { get set }

	func getModels() -> [ModelProtocol]
	func setModels(models: [ModelProtocol])
	func removeModel(_ indexPath: IndexPath)
	func addModel(_ item: ModelProtocol, at index: Int)
}