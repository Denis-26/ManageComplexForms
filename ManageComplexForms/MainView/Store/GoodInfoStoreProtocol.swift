//
// Created by Denis Kartavenko on 03.02.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

protocol GoodInfoStoreProtocol {

	var goodsInfo: [GoodInfoModel] { get }

	func swapElements(from: Int, to: Int)

	func getModels() -> [GoodInfoModel]

}
