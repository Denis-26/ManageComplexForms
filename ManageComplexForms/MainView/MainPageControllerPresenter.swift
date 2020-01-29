//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

class MainPageControllerPresenter {

	var service: DataServiceProtocol!
	weak var view: MainPageControllerProtocol?

	init(view: MainPageControllerProtocol, _ service: DataServiceProtocol) {
		self.view = view
		self.service = service
	}

	func start() {
		let userInfo = service.getMainPageModel()
		view?.setMainPageModel(mainPageModel: userInfo)
	}
}
