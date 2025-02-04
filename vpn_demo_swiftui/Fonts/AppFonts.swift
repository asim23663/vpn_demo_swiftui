//
//  AppFonts.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import Foundation
import SwiftUI

enum AppFonts {
    case INTER_LIGHT
    case INTER_BLACK
    case INTER_BOLD
    case INTER_MEDIUM
   
   
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .INTER_LIGHT:
            return .custom("Inter_18pt-Light", size: size)
        case .INTER_BLACK:
            return .custom("Inter_18pt-Black", size: size)
        case .INTER_BOLD:
            return .custom("Inter_18pt-Bold", size: size) 
        case .INTER_MEDIUM:
            return .custom("Inter_18pt-Medium", size: size)
      
            
        }
    }
}
