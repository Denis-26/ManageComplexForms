//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import Foundation

protocol UserInfoStoreProtocol {

	var usersInfo: [UserInfoModel] { get }

	func getModels() -> [UserInfoModel]
}

