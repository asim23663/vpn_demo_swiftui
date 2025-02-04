//
//  FastestServerButtonView.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

struct FastestServerButtonView: View {
    
    
    // MARK: Body
    var body: some View {
        VStack(alignment: .leading) {
            
            
            ZStack {
                HStack {
                    Image(AppImages.fastestServer)
                        .foregroundColor(.yellow)
                    
                    VStack(alignment: .leading){
                        AppTextView(text: "Fastest Server",
                                    textColor: AppColors.white,
                                    fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium))
                        
                        AppTextView(text: "Selected From Fastest Servers",
                                    textColor: AppColors.fontColor2,
                                    fontStyle: AppFonts.INTER_MEDIUM.font(size: AppFontSize.small_2))
                        
                        
                        
                    }
                    Spacer()
                    
                }
                .appBackgoundWithCornerRadius()

            }
        }
        .padding(.top, deviceHeight * 0.08)
    }
}

#Preview {
    FastestServerButtonView()
}
