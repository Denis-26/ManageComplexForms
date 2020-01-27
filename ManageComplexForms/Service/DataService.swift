//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

class DataService: DataServiceProtocol {

	func getMainPageModel() -> MainPageModel {
		var userInfo = UserInfoModel("Albert", "Albertov", "Albertovich", 25, 1)
		return MainPageModel(userInfoModels: userInfo)
	}
}
