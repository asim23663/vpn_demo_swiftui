//
//  ConnectedServerView.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

struct ConnectedServerView: View {
    
    @Binding var serverData: Server
    
    // MARK: Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(AppImages.germany)
                   
    
                
                VStack(alignment: .leading) {
                   
                    AppTextView(text: serverData.name,
                                textColor: AppColors.white,
                                fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium))
                    
                   
                    
                    HStack {
                        ForEach(serverData.tags, id: \.self) { tag in
                            
                            AppTextView(text: tag,
                                        textColor: AppColors.white,
                                        fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.small_2))
                            .padding(.horizontal,AppPaddings.small)
                            .padding(.vertical,4)
                            .background(AppColors.white.opacity(0.1))
                            .cornerRadius(100)
                           
                        }
                    }
//                    .padding(.top, 5)
                    
                   
                   
                }
                
                Spacer()
                
                Button {
                    
                    
                } label: {
                    Image(AppImages.refresh)
                }

                
               
                   
            }
            Divider()
                .background(AppColors.fontColor)
                .padding(.vertical,AppPaddings.small)
            
            HStack {
                
                Image(AppImages.downloading)
                AppTextView(text: serverData.getDownloadingSpeed(),
                            textColor: AppColors.white,
                            fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium))
                
                Spacer()
                
                Image(AppImages.uploading)
                AppTextView(text: serverData.getUploadingSpeed(),
                            textColor: AppColors.white,
                            fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium))
            }
            
            
        }
        .appBackgoundWithCornerRadius()
        .padding(.top)
    }
}

//#Preview {
//    ConnectedServerView(server: )
//}
