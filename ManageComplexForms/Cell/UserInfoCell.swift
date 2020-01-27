//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

class UserInfoCell: TableViewModelCell {

	override var modelProtocol: ModelProtocol? {
		didSet {
			guard let model = modelProtocol?.data as? UserInfoModel else { return }
		}
	}
}
