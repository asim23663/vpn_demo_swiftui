//
//  Server.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import Foundation


struct Server: Identifiable {
    let id: UUID
    let name: String
    let location: String
    let downloadSpeed: Double // in kb/s
    let uploadSpeed: Double // in kb/s
    let isConnected: Bool
    let tags: [String] // Property for tags
    
    init(name: String, location: String, downloadSpeed: Double, uploadSpeed: Double, isConnected: Bool, tags: [String]) {
        self.id = UUID()
        self.name = name
        self.location = location
        self.downloadSpeed = downloadSpeed
        self.uploadSpeed = uploadSpeed
        self.isConnected = isConnected
        self.tags = tags
    }
    
    
    
    // MARK: getDownloadingSpeed
    func getDownloadingSpeed() -> String {
        
        return "\(downloadSpeed) kb/s"
    } 
    
    // MARK: getUploadingSpeed
    func getUploadingSpeed() -> String {
        
        return "\(uploadSpeed) kb/s"
    }
}
