//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class SectionHolder: AbstractSectionHolder {

	private var userInfoSection: UserInfoSection!
	private var goodInfoSection: GoodInfoSection!
	private weak var view: MainPageControllerProtocol!

	init(view: MainPageControllerProtocol) {
		self.view = view
	}

	func setMainPageWrapper(_ mainPageWrapper: MainPageDataWrapperProtocol) {
		userInfoSection = UserInfoSection(view: view, mainPageWrapper.userInfoStore)
		goodInfoSection = GoodInfoSection(view: view, mainPageWrapper.goodInfoStore)

		sections.append(Section(title: "Users", tableViewSection: userInfoSection))
		sections.append(Section(title: "Goods", tableViewSection: goodInfoSection))
	}

	// It's simple example, but in complex project you can build new structures here
	func getFormValues() -> MainPageModel {
		let usersData = userInfoSection.getUsersData()
		let goodsData = goodInfoSection.getGoodsData()
		var newMainPageModel = MainPageModel(userInfoModels: usersData, goodInfoModels: goodsData)
		return newMainPageModel
	}
}