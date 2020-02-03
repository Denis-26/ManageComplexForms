//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class UserInfoStore: UserInfoStoreProtocol {

	var usersInfo: [UserInfoModel]

	init(usersInfo: [UserInfoModel]) {
		self.usersInfo = usersInfo
	}

	func getModels() -> [UserInfoModel] {
		usersInfo
	}
}
