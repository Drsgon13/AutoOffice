//
//  AutoOfficeApp.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 10.09.2021.
//

import SwiftUI

@main
struct AutoOfficeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
