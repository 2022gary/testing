//
//  SceneDelegate.swift
//  test
//
//  Created by Gary Weng on 1/1/22.
//

import Foundation
// SceneDelegate.swift
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
    
            let window = UIWindow(windowScene: windowScene)
            let tabBar = TabBarState()
            window.rootViewController = UIHostingController(rootView: contentView.environmentObject(tabBar))
            self.window = window
            window.makeKeyAndVisible()
            
            //监听TabBarState状态
            tabBar.$hidden.receive(subscriber: AnySubscriber(receiveSubscription: {
     (sub) in
                sub.request(.unlimited)
            }, receiveValue: {
     (value) -> Subscribers.Demand in
                self.tabBarHidden(hidden: value)
                return .none
            }))
        }
    }

    func tabBarHidden(hidden:Bool){
    
        for viewController in self.window!.rootViewController!.children {
    
            if viewController.isKind(of: UITabBarController.self) {
    
                let tabBarController = viewController as! UITabBarController
                if tabBarController.tabBar.isHidden != hidden {
    
                    tabBarController.tabBar.isHidden = hidden
                }
                return
            }
        }
    }
