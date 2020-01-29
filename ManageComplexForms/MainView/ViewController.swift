//
//  ViewController.swift
//  ManageComplexForms
//
//  Created by Denis Kartavenko on 27.01.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var navController: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainPageController = MainPageController()

        navController = UINavigationController(rootViewController: mainPageController)
        navController.modalPresentationStyle = .fullScreen
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.present(navController, animated: true)
    }
}
