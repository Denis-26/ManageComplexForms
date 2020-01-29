//
// Created by Denis Kartavenko on 29.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import UIKit

class MainPageController: UIViewController, MainPageControllerProtocol {

	private var sectionsHolder: SectionHolder!
	private var presenter: MainPageControllerPresenter!
	private var mainPageWrapper: MainPageDataWrapperProtocol!

	private var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()

		mainPageWrapper = MainPageDataWrapper()
		presenter = MainPageControllerPresenter(view: self, DataService())

		initViews()
		addViews()
		constrainViews()
		setupToolBarItems()

		presenter.start()
	}

	private func initViews() {
		sectionsHolder = SectionHolder(view: self)

		tableView = UITableView()
		tableView.delegate = sectionsHolder
		tableView.dataSource = sectionsHolder
		tableView.register(UserInfoCell.self, forCellReuseIdentifier: UserInfoCell.identifier)
	}

	private func addViews() {
		view.addSubview(tableView)
	}

	private func constrainViews() {
		LayoutUtil.stretchToSubview(tableView, padding: LayoutUtil.Padding(0))
	}

	private func setupToolBarItems() {
		navigationController?.setToolbarHidden(false, animated: false)
		let toolbar = navigationController?.toolbar
		toolbar?.barTintColor = .gray

		var items = [UIBarButtonItem]()

		let button = UIButton()
		button.setTitle("Save", for: .normal)
		button.addTarget(self, action: #selector(onSubmit), for: .touchUpInside)
		let barButton = UIBarButtonItem(customView: button)

		items.append(barButton)
		toolbarItems = items
	}

	@objc private func onSubmit() {
		let newFormValues = sectionsHolder.getFormValues()
		newFormValues.userInfoModels.map { value in
			debugPrint(value.firstName, value.lastName, value.secondName, value.age, value.gender)
		}
	}

	func setMainPageModel(mainPageModel: MainPageModel) {
		mainPageWrapper.setMainPageModel(mainPageModel)
		sectionsHolder.setMainPageWrapper(mainPageWrapper)
		onTableViewDataChanged()
	}

	func onTableViewDataChanged() {
		tableView.reloadData()
	}
}
