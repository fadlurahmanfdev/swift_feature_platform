//
//  AppLifecycleObserver.swift
//  Example
//
//  Observes app inactive / active transitions so you can react
//  (e.g. hide sensitive UI, pause work, restore UI).
//

import UIKit
import MPlatform

final class AppLifecycleObserver {
    let mPlatform = MPlatform()
    
    func start() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillResignActive),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }

    func stop() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc
    func appWillResignActive() {
        // App is about to become inactive (home button, Control Center,
        // incoming call, switching apps, etc.)
        // Hide sensitive UI / pause sensitive work here.
//        print("[AppLifecycle] willResignActive — app became inactive")
//        mPlatform.preventScreenshot()
    }

    @objc
    func appDidBecomeActive() {
        // App is active again in the foreground.
        // Restore UI / resume work here.
//        print("[AppLifecycle] didBecomeActive — app became active")
    }

    deinit {
        stop()
    }
}
