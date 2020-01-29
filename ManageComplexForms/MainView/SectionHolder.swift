//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class SectionHolder: AbstractSectionHolder {

	var userInfoSection: UserInfoSection!
	weak var view: MainPageControllerProtocol!

	init(view: MainPageControllerProtocol) {
		self.view = view
	}

	func setMainPageWrapper(_ mainPageWrapper: MainPageDataWrapperProtocol) {
		userInfoSection = UserInfoSection(view: view, mainPageWrapper.userInfoStore)

		sections.append(Section(title: "Users", tableViewSection: userInfoSection))
	}

	// It's simple example, but in complex project you can build new structures here
	func getFormValues() -> MainPageModel {
		let usersData = userInfoSection.getUsersData()
		var newMainPageModel = MainPageModel(userInfoModels: usersData)
		return newMainPageModel
	}
}