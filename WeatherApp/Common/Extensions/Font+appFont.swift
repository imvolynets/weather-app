//
//  Font+appFont.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

extension Font {
    static func appFont(font: CustomFont = .inter,
                        style: CustomFontStyle = .regular,
                        size: CGFloat) -> Font {
        let fontName = "\(font.rawValue)-\(style.rawValue)"
        
        return custom(fontName, size: size)
    }
}
