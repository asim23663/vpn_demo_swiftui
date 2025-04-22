//
//  DashboardView.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI

struct DashboardView: View {
    
    // MARK: PROPERTIES
    @State var selectedIndex: Int = 0
    
    
    // MARK: Body
    var body: some View {
        
        
        VStack {
            
            AppBottomTabsView(tabs: BottomTabType.allCases.map({ $0.tabItem }),
                              selectedIndex: $selectedIndex) { index in
                
                let type = BottomTabType(rawValue: index) ?? .home
                
                getTabView(type: type)
            }
            
        }
        
        
        
        //        .edgesIgnoringSafeArea(.all)
        
    }
    
    // MARK: getTabView
    @ViewBuilder
    func getTabView(type: BottomTabType) -> some View {
        
        switch type {
            
        case .home:
            
            
           HomeView()
            
        
            
        case .countries:
            Text("Countries")
                .edgesIgnoringSafeArea(.top)
            //        .statusBar(hidden: true)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
            
        case .settings:
            Text("Settings")
                .edgesIgnoringSafeArea(.top)
            //        .statusBar(hidden: true)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    DashboardView()
}



// MARK: AppBottomTabsView
struct AppBottomTabsView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                
                ForEach(tabs.indices) { index in
                    
                    
                    content(index)
                        .tag(index)
                    //                        .badge(10)
                    
                    
                    
                }
                
                
            }
            
            VStack {
                Spacer()
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
        }
        
    }
}


struct TabItemData {
    let image: String
    let selectedImage: String
    let title: String
}

struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    //    var height: CGFloat = 80
    var width: CGFloat = UIScreen.main.bounds.width - 0
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(tabbarItems.indices) { index in
                let item = tabbarItems[index]
                
                ZStack {
                    
                    
                    Button {
                        self.selectedIndex = index
                    } label: {
                        let isSelected = selectedIndex == index
                        TabItemView(data: item, isSelected: isSelected)
                        
                    }
                }
                
                
                
                Spacer()
            }
        }
        
        .frame(width: width)
        //        .padding(.bottom)
        .background(AppColors.appColor)
        //        .background(RoundedCorners(color: appColor, tl: 8, tr: 8, bl: 0, br: 0))
        
        
        //        .cornerRadius(8)
        //                .shadow(radius: 5, x: 0, y: 4)
    }
}


struct TabItemView: View {
    
    let data: TabItemData
    let isSelected: Bool
    
    
    var body: some View {
        VStack {
            /// // if slect and unselect image different
            // Image(isSelected ? data.selectedImage : data.image)
            
            VStack{
                
                
                
                
                //                Image(systemName: data.image)
                Image(data.image)
                
                    .renderingMode(.template)
                
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(isSelected ? AppColors.secondaryColor : AppColors.unSelectedColor)
                //                    .padding(.top, 10)
                
                AppTextView(text: data.image, textColor: isSelected ? AppColors.secondaryColor : AppColors.unSelectedColor,
                            fontStyle: AppFonts.INTER_MEDIUM.font(size: AppFontSize.regular))
                
                //                if isSelected {
                //                    RoundedRectangle(cornerRadius: 8)
                //                        .fill(Color.white)
                //                        .frame(width: 40, height: 2)
                //                }
                
                
            }
            .padding(.top)
            
        }
        
        //        .foregroundColor(Color.black)
        //        .foregroundColor(isSelected ? tabSelectedColor : tabUnSelectedColor)
    }
}

// Tabs for Business

enum BottomTabType: Int, CaseIterable {
    case home = 0
    case countries
    case settings
    
    var tabItem: TabItemData {
        
        switch self {
            
        case .home:
            return TabItemData(image: AppImages.home,
                               selectedImage: "",
                               title: "Home")
            
        case .countries:
            return TabItemData(image: AppImages.countries,
                               selectedImage: "",
                               title: "countries")
        case .settings:
            return TabItemData(image: AppImages.settings,
                               selectedImage: "",
                               title: "settings")
            //        case .setting:
            //            return TabItemData(image: "ic_setting",
            //                               selectedImage: "ic_profile",
            //                               title: "")
        }
    }
}
