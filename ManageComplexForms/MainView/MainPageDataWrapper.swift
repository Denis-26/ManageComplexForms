//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

protocol MainPageDataWrapperProtocol {

	var userInfoStore: UserInfoStore { get }
	var goodInfoStore: GoodInfoStore { get }

	func setMainPageModel(_ mainPageModel: MainPageModel)
}

class MainPageDataWrapper: MainPageDataWrapperProtocol {

	private(set) var userInfoStore: UserInfoStore
	private(set) var goodInfoStore: GoodInfoStore

	init() {
		userInfoStore = UserInfoStore(usersInfo: [])
		goodInfoStore = GoodInfoStore(goodsInfo: [])
	}

	func setMainPageModel(_ mainPageModel: MainPageModel) {
		userInfoStore = UserInfoStore(usersInfo: mainPageModel.userInfoModels)
		goodInfoStore = GoodInfoStore(goodsInfo: mainPageModel.goodInfoModels)
	}
}