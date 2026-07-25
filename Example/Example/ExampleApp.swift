//
//  ExampleApp.swift
//  Example
//
//  Created by Taufik Fadlurahman Fajari on 21/07/26.
//

import SwiftUI

@main
struct ExampleApp: App {
    private let appLifecycleObserver = AppLifecycleObserver()

    init() {
        appLifecycleObserver.start()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
