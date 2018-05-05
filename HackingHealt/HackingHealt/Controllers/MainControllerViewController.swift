//
//  ViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 03/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class MainControllerViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let today = TodayTableViewController()
        let todayController = UINavigationController(rootViewController: today)
        todayController.tabBarItem.image = #imageLiteral(resourceName: "TodayIcon")
        todayController.tabBarItem.selectedImage = #imageLiteral(resourceName: "TodayIcon")
        
        let circles = CirclesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let circlesController = UINavigationController(rootViewController: circles)
        circlesController.tabBarItem.image = #imageLiteral(resourceName: "CirclesIcon")
        
        
//        let home = HomeTableViewController(collectionViewLayout: UICollectionViewFlowLayout())
//        let homeController = UINavigationController(rootViewController: home)
//        homeController.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
//        homeController.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_selected")
//        
        let achivments = AchievmentCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let achivmentsController = UINavigationController(rootViewController: achivments)
        achivmentsController.tabBarItem.image = #imageLiteral(resourceName: "Achievments")
        
        
      tabBar.tintColor = .black

        viewControllers = [todayController,circlesController,achivmentsController]
        
        
    }
    
}
