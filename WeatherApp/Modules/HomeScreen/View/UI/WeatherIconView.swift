//
//  WeatherIconView.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import SwiftUI
import Kingfisher

struct WeatherIconView: View {
    let iconCode: String
    
    var size: CGFloat?
    
    var body: some View {
        let iconURL = URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")
        
        KFImage(iconURL)
            .resizable()
            .scaledToFit()
    }
}
