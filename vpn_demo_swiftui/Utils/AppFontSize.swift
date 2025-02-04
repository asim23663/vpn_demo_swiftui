//
//  AppFontSize.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

// MARK: Device Width & Height
let deviceHeight = UIScreen.main.bounds.height
let deviceWidth  = UIScreen.main.bounds.width

// MARK: AppFontSize
struct AppFontSize {
    
    static let small: CGFloat = 8
    static let small_2: CGFloat = 10

    static let regular: CGFloat = deviceHeight < 700 ? 12 : 12
    static let medium: CGFloat = 16
    static let medium2: CGFloat = 20
    static let large: CGFloat = 34
    static let bottomTabs: CGFloat = 100

}
