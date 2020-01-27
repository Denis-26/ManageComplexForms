//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

class ViewControllerPresenter {

	var service: DataServiceProtocol!
	weak var view: ViewControllerProtocol?

	init(view: ViewControllerProtocol, _ service: DataServiceProtocol) {
		self.view = view
		self.service = service
	}

	func start() {
		let userInfo = service.getMainPageModel()
		view?.setMainPageModel(mainPageModel: userInfo)
	}
}
