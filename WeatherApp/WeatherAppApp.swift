//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SelectLocationView()
//                    .navigationBarHidden(true)
            }
        }
    }
}
