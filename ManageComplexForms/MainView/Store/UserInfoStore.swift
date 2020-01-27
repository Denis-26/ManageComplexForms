//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

class UserInfoStore: UserInfoStoreProtocol {

	var usersInfo: [UserInfoModel]

	init(usersInfo: [UserInfoModel]) {
		self.usersInfo = usersInfo
	}

	func swapElements(from: Int, to: Int) {
		let usersInfoFrom = usersInfo[from]
		let usersInfoTo = usersInfo[to]
		usersInfo.remove(at: from)
		usersInfo.insert(usersInfoFrom, at: to)
	}

	func removeElement(_ indexPath: IndexPath) {
		usersInfo.remove(at: indexPath.row)
	}

	func addModel(_ model: UserInfoModel) {
		usersInfo.append(model)
	}

	func getModels() -> [UserInfoModel] {
		usersInfo
	}
}
