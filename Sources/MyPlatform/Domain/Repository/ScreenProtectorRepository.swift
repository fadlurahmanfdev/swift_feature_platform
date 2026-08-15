//
//  ScreenProtectorRepository.swift
//  MyPlatform
//
//  Created by Taufik Fadlurahman Fajari on 09/08/26.
//

protocol ScreenProtectorRepository {
    func initialize()
    
    @MainActor
    func disableScreenCapture()
    
    @MainActor
    func enableScreenCapture()
    
    @MainActor
    func enableDataLeakageProtection()
    
    @MainActor
    func disableDataLeakageProtection()
}
