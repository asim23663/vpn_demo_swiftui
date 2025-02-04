//
//  AppTextView.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

struct AppTextView: View {
    
    // MARK: Properties

//    private
    var text: String = "AppTextView"
    

    var textSize: CGFloat = AppFontSize.regular

    var textColor: Color = AppColors.black

    var fontStyle: Font = AppFonts.INTER_BOLD.font(size: AppFontSize.regular)
    

    
    // MARK: body
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(fontStyle)
//            .padding(.horizontal, AppFontSize.regular)

    }
}


#Preview {
    AppTextView()
}
