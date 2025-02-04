//
//  HomeViewModel.swift
//  vpn_demo_swiftui
//
//  Created by Asim on 04/02/2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    // MARK: PROPERTIES
    @Published var isConnecting = false
    @Published var isConnected = true
    @Published var connectedLocation = "🇵🇰 Lahore, Pakistan"
    private var cancellables = Set<AnyCancellable>()

    
    
    init() {
        self.connectedServer = servers[0]
    }
  
    @Published var connectedServer : Server
    
    
    // MARK: Dummy servers List
    let servers: [Server] = [
        Server(name: "Germany", location: "Berlin", downloadSpeed: 29.88, uploadSpeed: 3.98, isConnected: true, tags: ["#CostSavinng", "#Fastest"]),
        Server(name: "France", location: "Paris", downloadSpeed: 25.50, uploadSpeed: 2.75, isConnected: true, tags: ["EU", "Reliable"]),
        Server(name: "USA", location: "New York", downloadSpeed: 35.10, uploadSpeed: 5.50, isConnected: false, tags: ["NA", "High Latency"]),
        Server(name: "Japan", location: "Tokyo", downloadSpeed: 40.20, uploadSpeed: 4.10, isConnected: true, tags: ["Asia", "Fast"]),
        Server(name: "Australia", location: "Sydney", downloadSpeed: 30.90, uploadSpeed: 3.60, isConnected: true, tags: ["Oceania", "Stable"])
    ]
    
    
    
        
    // MARK: selectRandomServer
    private func selectRandomServer() {
           let filteredServers = servers.filter { $0.id != connectedServer.id }
           if let randomServer = filteredServers.randomElement() {
               connectedServer = randomServer
           }
       }

    // MARK: startConnecting
    public func startConnecting() {
        
        
        if self.isConnected {
            _resetValues()
            return;
        }
        
//        _resetValues()
        
        self.isConnecting = true
        
        Just(Void())
            .delay(for: .seconds(5), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] in
                
                self?.upateConnected()
                self?.selectRandomServer()
                
            })
            .store(in: &cancellables)
    }
    
    
    
    // MARK: _resetValues
    private func _resetValues() {
       
        self.isConnected = false
        self.isConnecting = false
        connectedLocation = "🇵🇰 Lahore, Pakistan"
        
    }
    
    
    // MARK: upateConnected
    private func upateConnected() {
       
        self.isConnecting = false
        
        self.isConnected.toggle()
        
        connectedLocation = "🇷🇺 Russia"

        
    }
}
