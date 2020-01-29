//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

class UserInfoModel {
	var firstName: String
	var lastName: String
	var secondName: String
	var age: Int
	var gender: Int

	init(firstName: String, lastName: String, secondName: String, age: Int, gender: Int) {
		self.firstName = firstName
		self.lastName = lastName
		self.secondName = secondName
		self.age = age
		self.gender = gender
	}
}

