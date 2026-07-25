//
//  ContentView.swift
//  Example
//
//  Created by Taufik Fadlurahman Fajari on 21/07/26.
//

import MPlatform
import SwiftUI

struct ContentView: View {
    let features = [
        Feature(
            id: "FETCH_DEVICE_MODEL",
            title: "Fetch Device Model",
            subtitle: "Returning iOS Model (e.g., iPhone 16,1)"
        ),
        Feature(
            id: "FETCH_DEVICE_ID",
            title: "Fetch Device ID",
            subtitle: "Returning Device ID"
        ),
        Feature(
            id: "DISABLE_SCREEN_CAPTURE",
            title: "Disable Screen Capture",
            subtitle: "Preventing App for doing any screenshot or screen capture"
        ),
        Feature(
            id: "ENABLE_SCREEN_CAPTURE",
            title: "Enable Screen Capture",
            subtitle: "Re-enabled App for doing any screenshot or screen capture"
        ),
        Feature(
            id: "ENABLE_DATA_LEAKAGE_PROTECTION",
            title: "Enable Data Lekage Protection",
            subtitle: "Override black view when app going inactive"
        ),
        Feature(
            id: "DISABLE_DATA_LEAKGE_PROTECTION",
            title: "Disable Data Lekage Protection",
            subtitle: "do not show override black view when app going inactive"
        )
    ]
    
    let mPlatform = MPlatform()
    
    init() {
        mPlatform.initialize()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(features, id: \.id) { feature in
                        HStack(alignment: .center) {
                            Image(systemName: "equal.square")
                                .foregroundStyle(.black)
                            VStack(alignment: .leading) {
                                Text(feature.title)
                                Text(feature.subtitle).font(.caption)
                            }.onTapGesture {
                                onTapGesture(id: feature.id)
                            } .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        }
                        
                    }
                }
            }
            .padding()
            .navigationTitle("Example MPlatform")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func onTapGesture(id:String){
        switch id {
        case "FETCH_DEVICE_MODEL": fetchDeviceModel()
        case "FETCH_DEVICE_ID": fetchDeviceID()
        case "DISABLE_SCREEN_CAPTURE": disabledScreenCapture()
        case "ENABLE_SCREEN_CAPTURE": enableScreenCapture()
        case "ENABLE_DATA_LEAKAGE_PROTECTION": enableDataLeakageProtection()
        case "DISABLE_DATA_LEAKAGE_PROTECTION": disableDataLeakageProtection()
        default: break
        }
    }
    
    func fetchDeviceModel(){
        do {
            let deviceModel = try mPlatform.deviceModel()
            print("Device Model: \(deviceModel)")
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func fetchDeviceID(){
        do {
            let deviceID = mPlatform.deviceID()
            print("Device ID: \(deviceID)")
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func disabledScreenCapture(){
        mPlatform.disableScreenCapture()
    }
    
    func enableScreenCapture(){
        mPlatform.enableScreenCapture()
    }
    
    func enableDataLeakageProtection(){
        mPlatform.enableDataLeakageProtection()
    }
    
    func disableDataLeakageProtection(){
        mPlatform.disableDataLeakageProtection()
    }
}

#Preview {
    ContentView()
}
