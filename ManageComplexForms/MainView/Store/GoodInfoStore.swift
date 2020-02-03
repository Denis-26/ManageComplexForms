//
// Created by Denis Kartavenko on 03.02.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class GoodInfoStore: GoodInfoStoreProtocol {

	var goodsInfo: [GoodInfoModel]

	init(goodsInfo: [GoodInfoModel]) {
		self.goodsInfo = goodsInfo
	}

	func swapElements(from: Int, to: Int) {
		let fromElem = goodsInfo[from]
		let toElem = goodsInfo[to]
		goodsInfo.remove(at: from)
		goodsInfo.insert(fromElem, at: to)
	}

	func getModels() -> [GoodInfoModel] {
		goodsInfo
	}

}
