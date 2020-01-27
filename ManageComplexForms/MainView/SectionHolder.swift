//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class SectionHolder: AbstractSectionHolder {

	var userInfoSection: UserInfoSection!
	weak var view: ViewControllerProtocol!

	init(view: ViewControllerProtocol) {
		self.view = view
	}

	func setMainPageWrapper(_ mainPageWrapper: MainPageDataWrapperProtocol) {
		userInfoSection = UserInfoSection(view: view, mainPageWrapper.userInfoStore)
	}
}