//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class UserInfoSection: AbstractTableViewSection {

	private var userInfoStore: UserInfoStoreProtocol!
	weak var view: ViewControllerProtocol?

	init(view: ViewControllerProtocol, _ userInfoStore: UserInfoStoreProtocol?) {
		super.init(cellConfigurator: { model, cell in
			if let cell = cell as? TableViewModelCell {
				cell.modelProtocol = model
			}
		})

		self.userInfoStore = userInfoStore
		self.view = view
		setCallbacks()
		refresh()
	}

	private func setCallbacks() {
		onNeedReloadTableView = {[weak self] in
			self?.view?.onTableViewDataChanged()
		}

		onReorderCellsCallback = {[weak self] from, to in
			self?.userInfoStore.swapElements(from: from, to: to)
			self?.refresh()
		}

		onRemoveCellCallback = {[weak self] indexPath in
			self?.userInfoStore.removeElement(indexPath)
			self?.refresh()
		}
	}

	func addModel(model: UserInfoModel) {
		userInfoStore.addModel(model)
		refresh()
	}

	private func refresh() {
		let usersInfo = userInfoStore.getModels()
		let models: [Model]? = usersInfo.map { model in
			Model(data: model, reuseIdentifier: UserInfoCell.identifier)
		}
		setModels(models: models ?? [])
		self.view?.onTableViewDataChanged()
	}
}