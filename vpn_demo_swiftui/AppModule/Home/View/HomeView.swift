//
//  HomeView.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: Propeties
    @StateObject private var mViewModel = HomeViewModel()

    
    // MARK: body
    var body: some View {
        ZStack {
            
            AppColors.appColor.edgesIgnoringSafeArea(.all)
            
            if mViewModel.isConnected {
                
                VStack {
                    
                    LinearGradient(gradient: Gradient(colors: [
                        AppColors.connectedColor.opacity(0.5), AppColors.appColor.opacity(0.1)
                    ]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 150)
                    .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            } else {
                VStack {
                    
                    LinearGradient(gradient: Gradient(colors: [
                        AppColors.secondaryColor, AppColors.appColor.opacity(0.1)
                    ]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 150)
                    .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
            
            
            
            VStack {
                
                
                if mViewModel.isConnecting {
                    HStack(spacing: 0) {
                        AppProgressView()
                        AppTextView(
                            text: "Connecting...",
                            textColor: AppColors.fontColor3,
                            fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium2))
                        .padding(.leading, AppPaddings.small)
                    }
                    .padding(.top, deviceHeight * 0.01)
                } else {
                    Image(mViewModel.isConnected ? AppImages.protected: "UnProtected")
//                        .padding(.top,10)
                }
               
               
                
                
                
                HStack {
                    AppTextView(text: "Current Location:", textColor: AppColors.white,
                                fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.regular))
                    
                    
                    if mViewModel.isConnecting {
                        HStack(spacing: 0) {
                            AppProgressView(scaleEffect: 1.0)
                            AppTextView(
                                text: "Loading...",
                                textColor: AppColors.fontColor3,
                                fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.regular))
                            .padding(.leading,AppPaddings.small)
                        }
                        .padding(.leading,4)
                        
                    } else {
                        AppTextView(text: mViewModel.connectedLocation, textColor: AppColors.white,
                                    fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.regular))
                    }
                }
               
                
               
                
                Spacer()
                
                if mViewModel.isConnected {
                    AppRatingsView()
                        .padding(.bottom,AppPaddings.medium)
//                    Spacer()
                }
               
                Button {
                    
                    debugPrint("Connecting ... ")
                    mViewModel.startConnecting()
                } label: {
                    
                    
                    Image(
                        
                        mViewModel.isConnecting ? AppImages.connecting : 
                            mViewModel.isConnected ? AppImages.connected : AppImages.connectBg)
                        .overlay(
                            
                            ZStack {
                                
                                
                                if mViewModel.isConnecting {
                                    AppTextView(
                                        text: "Connecting...",
                                        textColor: AppColors.fontColor3,
                                        fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium)
                                    )
                                    .padding(12)
                                } else {
                                    AppTextView(
                                        text: mViewModel.isConnected ? "Connected" : "Connect",
                                        textColor: mViewModel.isConnected ? AppColors.white :AppColors.fontColor3,
                                        fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium)
                                    )
                                    .padding(12)
                                }
                               
                            }
                                .transition(.opacity)
                                .frame(width: 190, height: 150) // Fixed width and height
                                .padding(.bottom, 20)
                                

                            
                        )
                }

                
                
                
                if !mViewModel.isConnecting {
                    
                    HStack {
                        Image(AppImages.tapToConnect)
                        AppTextView(
                            text: mViewModel.isConnected ? "Tap to disconnect" : "Tap to connect",
                            textColor: AppColors.fontColor,
                            fontStyle: AppFonts.INTER_BOLD.font(size: AppFontSize.medium)
                        )
                        
                    }
                    .padding()
                }
                
                
                if mViewModel.isConnected {
                    ConnectedServerView(serverData: $mViewModel.connectedServer)
                } else {
                    FastestServerButtonView()
                }
                

                
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    HomeView()
}




