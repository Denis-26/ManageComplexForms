//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

class DataService: DataServiceProtocol {

	func getMainPageModel() -> MainPageModel {
		var usersInfo = [UserInfoModel]()
		usersInfo.append(UserInfoModel(firstName: "Albert1", lastName: "Albertov1", secondName: "Albertovich1", age: 25, gender: 1))
		usersInfo.append(UserInfoModel(firstName: "Albert2", lastName: "Albertov2", secondName: "Albertovich2", age: 25, gender: 1))
		usersInfo.append(UserInfoModel(firstName: "Albert3", lastName: "Albertov3", secondName: "Albertovich3", age: 25, gender: 1))
		usersInfo.append(UserInfoModel(firstName: "Albert3", lastName: "Albertov3", secondName: "Albertovich3", age: 25, gender: 1))
		usersInfo.append(UserInfoModel(firstName: "Albert3", lastName: "Albertov3", secondName: "Albertovich3", age: 25, gender: 1))
		usersInfo.append(UserInfoModel(firstName: "Albert3", lastName: "Albertov3", secondName: "Albertovich3", age: 25, gender: 1))
		usersInfo.append(UserInfoModel(firstName: "Albert3", lastName: "Albertov3", secondName: "Albertovich3", age: 25, gender: 1))
		return MainPageModel(userInfoModels: usersInfo)
	}
}
