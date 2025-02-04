//
//  View.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

extension View {
    
    
    // MARK: appBackgoundWithCornerRadius
    func appBackgoundWithCornerRadius() -> some View {
        self.padding()
            .frame(maxWidth: .infinity)
            .background(AppColors.gray)
            .cornerRadius(AppCornerRadious.normal)
            .overlay(
                RoundedRectangle(cornerRadius: AppCornerRadious.normal)
                    .stroke(AppColors.white, lineWidth: 0.15) // Stroke color and width
            )
            .padding(.horizontal, AppPaddings.medium)
    }
    
}
