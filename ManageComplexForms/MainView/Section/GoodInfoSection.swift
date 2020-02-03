//
// Created by Denis Kartavenko on 03.02.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class GoodInfoSection: AbstractTableViewSection {

	private var goodInfoStore: GoodInfoStoreProtocol!
	weak var view: MainPageControllerProtocol?

	init(view: MainPageControllerProtocol, _ goodInfoStore: GoodInfoStoreProtocol?) {
		super.init(
				reuseIdentifier: GoodInfoCell.identifier,
				cellConfigurator: AbstractTableViewSection.defaultCellConfigurator())

		self.goodInfoStore = goodInfoStore
		self.view = view
		canMove = true
		setCallbacks()
		refresh()
	}

	func getGoodsData() -> [GoodInfoModel] {
		goodInfoStore.getModels()
	}

	private func setCallbacks() {

		onNeedReloadTableView = {[weak self] in
			self?.view?.onTableViewDataChanged()
		}

		onReorderCellsCallback = {[weak self] from, to in
			self?.goodInfoStore.swapElements(from: from, to: to)
			self?.refresh()
		}
	}

	private func refresh() {
		let goodsInfo = goodInfoStore.getModels()
		let models: [Model]? = goodsInfo.map { model in
			Model(data: model, reuseIdentifier: GoodInfoCell.identifier)
		}
		setModels(models: models ?? [])
		self.view?.onTableViewDataChanged()
	}
}
