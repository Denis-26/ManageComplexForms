//
// Created by Denis Kartavenko on 03.02.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

class GoodInfoCell: TableViewModelCell {

	private var container: UIStackView!
	private var label: UILabel!
	private var goodName: CustomTextField!
	private var goodDescription: CustomTextField!

	private var model: GoodInfoModel!

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
	}

	private func initViews() {
		container = ViewBuilder.buildStackView()
		container.spacing = 10
		label = ViewBuilder.buildLabel(text: "Good info:")
		goodName = ViewBuilder.buildCustomTextField(placeholder: "Good name")
		goodDescription = ViewBuilder.buildCustomTextField(placeholder: "Good description")
	}

	private func addViews() {
		contentView.addSubview(container)

		container.addArrangedSubview(label)
		container.addArrangedSubview(goodName)
		container.addArrangedSubview(goodDescription)
	}

	private func constraintViews() {
		LayoutUtil.stretchToSubview(container)
	}

	override var modelProtocol: ModelProtocol? {
		didSet {
			guard let model = modelProtocol?.data as? GoodInfoModel else { return }
			self.model = model
			setupCallbacks()

			goodName.text = model.goodName
			goodDescription.text = model.description
		}
	}

	private func setupCallbacks() {
		goodName.onEditingChange = {[weak self] newValue in
			self?.model.goodName = newValue
		}

		goodDescription.onEditingChange = {[weak self] newValue in
			self?.model.description = newValue
		}
	}
}
