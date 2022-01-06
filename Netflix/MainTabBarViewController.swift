//
//  ViewController.swift
//  Netflix
//
//  Created by Bryan on 2022/1/6.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let vc1 = HomeViewController()
        let vc2 = UpcomingViewController()
        let vc3 = SearchViewController()
        let vc4 = DownloadViewController()
        
        let navVC1 = UINavigationController(rootViewController: vc1)
        let navVC2 = UINavigationController(rootViewController: vc2)
        let navVC3 = UINavigationController(rootViewController: vc3)
        let navVC4 = UINavigationController(rootViewController: vc4)
        
        navVC1.title = "Home"
        navVC2.title = "Upcoming"
        navVC3.title = "Search"
        navVC4.title = "Download"
        
        navVC1.tabBarItem.image = UIImage(systemName: "house")
        navVC2.tabBarItem.image = UIImage(systemName: "play.circle")
        navVC3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        navVC4.tabBarItem.image = UIImage(systemName: "square.and.arrow.down.fill")
        
        tabBar.tintColor = .label
        
        setViewControllers([navVC1,navVC2,navVC3,navVC4], animated: true)
        
    }


}

