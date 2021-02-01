//
//  TabBarViewController.swift
//  TopNotchPhysiqueProgramatically
//
//  Created by Tommy Smale on 10/1/20.
//  Copyright © 2020 Tommy Smale. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func loadView() {
        super.loadView()
        


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedVC = UINavigationController(rootViewController: FeedTableViewController())
        let postVC = UINavigationController(rootViewController: PostViewController())
        let profVC = UINavigationController(rootViewController: ProfileViewController())

        // Do any additional setup after loading the view.
        //let feedNavigationController = UINavigationController(rootViewController: feedVC)
        //let postNavigationController = UINavigationController(rootViewController: postVC)
        
        /*
        let feedBarItem = UIBarItem()
        feedBarItem(title: "Feed", image: nil, tag: 0)4
        */
        
        //for some reason self.tabBarItem(UITabBarItem(title: "Feed", image: nil, tag: 0)
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)
        postVC.tabBarItem = UITabBarItem(title: "New Post", image: nil, tag: 1)
        profVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 2)


        self.viewControllers = [feedVC, postVC, profVC]
        self.selectedIndex = 0
    

    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
