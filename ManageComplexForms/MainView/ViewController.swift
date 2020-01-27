//
//  ViewController.swift
//  ManageComplexForms
//
//  Created by Denis Kartavenko on 27.01.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit


class ViewController: UIViewController, ViewControllerProtocol {

    private var sectionsHolder: SectionHolder!
    private var presenter: ViewControllerPresenter!
    private var mainPageWrapper: MainPageDataWrapperProtocol!

    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mainPageWrapper = MainPageDataWrapper()
        presenter = ViewControllerPresenter(view: self, DataService())

        initViews()
        addViews()
        constrainViews()
    }

    private func initViews() {
        sectionsHolder = SectionHolder(view: self)

        tableView = UITableView()
        tableView.delegate = sectionsHolder
        tableView.dataSource = sectionsHolder
    }

    private func addViews() {
        view.addSubview(tableView)
    }

    private func constrainViews() {

    }

    func setMainPageModel(mainPageModel: MainPageModel) {
        mainPageWrapper.setMainPageModel(mainPageModel)
        sectionsHolder.setMainPageWrapper(mainPageWrapper)
    }

    func onTableViewDataChanged() {
        tableView.reloadData()
    }
}
