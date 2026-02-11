//
//  Color+Hex.swift
//  Home
//
//  Created by Lujain on 22/08/1447 AH.
//
import SwiftUI

extension Color {
    static func hexColor(_ hex: String) -> Color {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255

        return Color(red: r, green: g, blue: b)
    }
}
