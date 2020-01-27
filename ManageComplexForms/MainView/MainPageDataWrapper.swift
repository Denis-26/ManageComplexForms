//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

protocol MainPageDataWrapperProtocol {

	var userInfoStore: UserInfoStore { get }

	func setMainPageModel(_ mainPageModel: MainPageModel)
}

class MainPageDataWrapper: MainPageDataWrapperProtocol {

	private(set) var userInfoStore: UserInfoStore

	init() {
		userInfoStore = UserInfoStore(usersInfo: [])
	}

	func setMainPageModel(_ mainPageModel: MainPageModel) {
		userInfoStore = UserInfoStore(usersInfo: mainPageModel.userInfoModels)
	}
}