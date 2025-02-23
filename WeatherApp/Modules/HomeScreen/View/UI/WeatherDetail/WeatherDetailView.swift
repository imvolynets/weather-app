//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

struct WeatherDetailView: View {
    var icon: ImageResource
    var value: String
    
    var body: some View {
        HStack(spacing: 5) {
            Image(icon)
                .foregroundColor(.white)
            Text(value)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold))
        }
    }
}
