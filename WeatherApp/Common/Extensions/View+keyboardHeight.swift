//
//  View+keyboardHeight.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import SwiftUI

extension View {
    func keyboardHeight(_ state: Binding<CGFloat>) -> some View {
        self.modifier(KeyboardProvider(keyboardHeight: state))
    }
}
