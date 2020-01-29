//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class UserInfoSection: AbstractTableViewSection {

	private var userInfoStore: UserInfoStoreProtocol!
	weak var view: MainPageControllerProtocol?

	init(view: MainPageControllerProtocol, _ userInfoStore: UserInfoStoreProtocol?) {
		super.init(
				reuseIdentifier: UserInfoCell.identifier,
				cellConfigurator: AbstractTableViewSection.defaultCellConfigurator())

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

	func getUsersData() -> [UserInfoModel] {
		userInfoStore.getModels()
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