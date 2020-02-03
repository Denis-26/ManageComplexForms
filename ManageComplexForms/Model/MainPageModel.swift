//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation


class MainPageModel {

	var userInfoModels: [UserInfoModel]
	var goodInfoModels: [GoodInfoModel]

	init(userInfoModels: [UserInfoModel], goodInfoModels: [GoodInfoModel]) {
		self.userInfoModels = userInfoModels
		self.goodInfoModels = goodInfoModels
	}
}