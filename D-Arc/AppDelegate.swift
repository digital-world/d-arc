//
//  AppDelegate.swift
//  D-Arc
//
//  Created by WarGrey Ju on 2020/2/1.
//  Copyright © 2020 WarGrey Ju. All rights reserved.
//

import UIKit;
import SpriteKit;
import GameplayKit;

class GameViewController: UIViewController {
    override func loadView() {
        self.view = SKView(frame: UIScreen.main.bounds);
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        
        if let view = self.view as! SKView? {
            // Load the SKScene manually
            let scene = DArcScene(size: view.bounds.size);
            
            scene.scaleMode = .aspectFill;
            view.presentScene(scene);
            
            view.ignoresSiblingOrder = true;
            
            view.showsFPS = true;
            view.showsNodeCount = true;
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?;
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let gui = UIWindow(frame: UIScreen.main.bounds);
        
        gui.backgroundColor = UIColor.white;
        gui.rootViewController = GameViewController();
        gui.makeKeyAndVisible();
        
        self.window = gui;
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
}
