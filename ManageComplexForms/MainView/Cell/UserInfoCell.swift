//
// Created by Denis Kartavenko on 27.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit


class UserInfoCell: TableViewModelCell {

	private var container: UIStackView!
	private var label: UILabel!
	private var firstName: CustomTextField!
	private var lastName: CustomTextField!
	private var secondName: CustomTextField!
	private var age: CustomTextField!
	private var gender: CustomTextField!

	private var model: UserInfoModel!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: reuseIdentifier)
		initialize()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initialize()
	}

	private func initialize() {
		initViews()
		addViews()
		constraintViews()
		setupCallbacks()
	}

	private func initViews() {
		container = ViewBuilder.buildStackView()
		container.spacing = 10
		label = ViewBuilder.buildLabel(text: "User info:")
		firstName = ViewBuilder.buildCustomTextField(placeholder: "First Name")
		lastName = ViewBuilder.buildCustomTextField(placeholder: "Last Name")
		secondName = ViewBuilder.buildCustomTextField(placeholder: "Second Name")
		age = ViewBuilder.buildCustomTextField(placeholder: "Age")
		gender = ViewBuilder.buildCustomTextField(placeholder: "Gender")
	}

	private func addViews() {
		contentView.addSubview(container)

		container.addArrangedSubview(label)
		container.addArrangedSubview(firstName)
		container.addArrangedSubview(lastName)
		container.addArrangedSubview(secondName)
		container.addArrangedSubview(age)
		container.addArrangedSubview(gender)
	}

	private func constraintViews() {
		LayoutUtil.stretchToSubview(container)
	}

	private func setupCallbacks() {
		firstName.onEditingChange = {[weak self] newValue in
			self?.model.firstName = newValue
		}

		lastName.onEditingChange = {[weak self] newValue in
			self?.model.lastName = newValue
		}

		secondName.onEditingChange = {[weak self] newValue in
			self?.model.secondName = newValue
		}

		age.onEditingChange = {[weak self] newValue in
			self?.model.age = NumberUtil.toInt(newValue)
		}

		gender.onEditingChange = {[weak self] newValue in
			self?.model.gender = NumberUtil.toInt(newValue)
		}
	}

	override var modelProtocol: ModelProtocol? {
		didSet {
			guard let model = modelProtocol?.data as? UserInfoModel else { return }
			self.model = model

			firstName.text = model.firstName
			lastName.text = model.lastName
			secondName.text = model.secondName
			age.text = String(model.age)
			gender.text = model.gender == 1 ? "Male" : "Female"
		}
	}
}
