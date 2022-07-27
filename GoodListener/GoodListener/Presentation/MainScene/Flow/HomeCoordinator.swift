//
//  HomeCoordinator.swift
//  GoodListener
//
//  Created by cheonsong on 2022/07/26.
//

import Foundation
import UIKit

protocol HomeCoordinating: AnyObject {
    
}

class HomeCoordinator: CoordinatorType {
    var childCoordinators: [CoordinatorType] = []
    weak var parentCoordinator: MainCoordinating?
    
    var navigationController: UINavigationController
    
    init(coordinating: MainCoordinating?) {
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
        self.parentCoordinator = coordinating
    }
    
    func start() {
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinating {
    
}