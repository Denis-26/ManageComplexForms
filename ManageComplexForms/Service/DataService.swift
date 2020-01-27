//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

class DataService: DataServiceProtocol {

	func getMainPageModel() -> MainPageModel {
		var usersInfo = [UserInfoModel(firstName: "Albert", lastName: "Albertov", secondName: "Albertovich", age: 25, gender: 1)]
		return MainPageModel(userInfoModels: usersInfo)
	}
}
