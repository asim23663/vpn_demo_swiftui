//
//  AppRatingsView.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

struct AppRatingsView: View {
    
    
    // MARK: Body
    var body: some View {
        
        VStack {
            
            AppTextView(
                text: "if you appreciate it, please give us 5 stars.",
                        textColor: AppColors.white,
                fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium))

                
            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < 3 ? "star.fill" : "star")
                        .foregroundColor(AppColors.white)
                }
            }
            .padding(.top,1)
        }
        .appBackgoundWithCornerRadius()
        .padding(.bottom,AppPaddings.medium)
    }
}

#Preview {
    AppRatingsView()
}
