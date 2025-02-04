//
//  AppProgressView.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

struct AppProgressView: View {
    
    
    // MARK: PROPERTIES
    var scaleEffect: CGFloat = 1.5
    
    // MARK: Body
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: AppColors.white))
            .padding(.horizontal,4)
//            .frame(height: size)
            .scaleEffect(scaleEffect)
    }
}

#Preview {
    AppProgressView()
}
