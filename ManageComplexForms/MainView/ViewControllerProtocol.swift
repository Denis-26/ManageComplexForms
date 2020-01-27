//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

protocol ViewControllerProtocol: class {

	func setMainPageModel(mainPageModel: MainPageModel)

	func onTableViewDataChanged()

}