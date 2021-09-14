//
//  AppDelegate.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 13.09.2021.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
      _ application: UIApplication,
      configurationForConnecting connectingSceneSession: UISceneSession,
      options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
      let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
      sceneConfig.delegateClass = SceneDelegate.self // 👈🏻
      return sceneConfig
    }
}


