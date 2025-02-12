//
//  vpn_demo_swiftuiApp.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import SwiftUI
import SwiftData

@main
struct vpn_demo_swiftuiApp: App {


    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
//        .modelContainer(sharedModelContainer)
    }
    
    init() {
        
        debugPrint("vpn_demo_swiftuiApp --> ")
        for familyName in UIFont.familyNames {
            print (familyName)
            for fontName in UIFont.fontNames (forFamilyName:
                                                familyName) {
                print ("-- \(fontName) " )
                
                
            }
        }
    }
}
