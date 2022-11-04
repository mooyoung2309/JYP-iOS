//
//  TabBarViewController.swift
//  JYP-iOS
//
//  Created by 송영모 on 2022/07/17.
//  Copyright © 2022 JYP-iOS. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.layer.borderWidth = 1.0
        tabBar.layer.borderColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1)

        let myPlannerReactor = MyPlannerReactor()
        let myPlannerNavigationViewController = UINavigationController(rootViewController: MyPlannerViewController(reactor: myPlannerReactor))
        let myPlannerTabBarItem = UITabBarItem(title: nil, image: JYPIOSAsset.myJourneyInactive.image.withRenderingMode(.alwaysOriginal), selectedImage: JYPIOSAsset.myJourneyActive.image.withRenderingMode(.alwaysOriginal))
        myPlannerTabBarItem.imageInsets = .init(top: 9, left: 0, bottom: -9, right: 0)

        let anotherJourneyViewController = UINavigationController(rootViewController: AnotherJourneyViewController())
        let anotherJourneyTabBarItem = UITabBarItem(title: nil, image: JYPIOSAsset.anotherJourneyInactive.image.withRenderingMode(.alwaysOriginal), selectedImage: JYPIOSAsset.anotherJourneyActive.image.withRenderingMode(.alwaysOriginal))
        anotherJourneyTabBarItem.imageInsets = .init(top: 9, left: 0, bottom: -9, right: 0)

        let myPageNavigationViewController = UINavigationController(rootViewController: MyPageViewController())
        let myPageTabBarItem = UITabBarItem(title: nil, image: JYPIOSAsset.myPageInactive.image.withRenderingMode(.alwaysOriginal), selectedImage: JYPIOSAsset.myPageActive.image.withRenderingMode(.alwaysOriginal))
        myPageTabBarItem.imageInsets = .init(top: 9, left: 0, bottom: -9, right: 0)
        
        let plannerNavigationViewController = UINavigationController(rootViewController: PlannerViewController(reactor: PlannerReactor(state: .init(journey: .init(id: "", name: "", startDate: 0, endDate: 0, themePath: .city, users: [])))))
        let plannerTabBarItem = UITabBarItem(title: nil, image: JYPIOSAsset.myPageInactive.image.withRenderingMode(.alwaysOriginal), selectedImage: JYPIOSAsset.myPageInactive.image.withRenderingMode(.alwaysOriginal))
        plannerTabBarItem.imageInsets = .init(top: 9, left: 0, bottom: -9, right: 0)

        myPlannerNavigationViewController.tabBarItem = myPlannerTabBarItem
        anotherJourneyViewController.tabBarItem = anotherJourneyTabBarItem
        myPageNavigationViewController.tabBarItem = myPageTabBarItem
        plannerNavigationViewController.tabBarItem = plannerTabBarItem

        viewControllers = [myPlannerNavigationViewController, anotherJourneyViewController, myPageNavigationViewController, plannerNavigationViewController]
        selectedIndex = 0
    }
}
