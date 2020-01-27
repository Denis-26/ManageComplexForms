//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

protocol UserInfoStoreProtocol {

	private(set) var usersInfo { get }

	func swapElements(from: Int, to: Int)

	func removeElement(_ indexPath: IndexPath)

	func addModel(_ model: UserInfoModel)

	func getModels() -> [UserInfoModel]
}

