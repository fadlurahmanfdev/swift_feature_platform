import Foundation

public class MPlatform {
    private let deviceRepository: DeviceRepository
    private let screenProtector: ScreenProtectorRepository

    public init() {
        deviceRepository = DeviceRepositoryImpl()
        screenProtector = ScreenProtectorRepositoryImpl()
    }
    
    public func initialize() {
        screenProtector.initialize()
    }

    public func deviceModel() throws -> String {
        return try deviceRepository.deviceModel()
    }

    public func deviceID() -> String? {
        return deviceRepository.deviceID()
    }
    
    @MainActor
    public func disableScreenCapture() {
        screenProtector.disableScreenCapture()
    }
    
    @MainActor
    public func enableScreenCapture() {
        screenProtector.enableScreenCapture()
    }
    
    @MainActor
    public func enableDataLeakageProtection() {
        screenProtector.enableDataLeakageProtection()
    }
    
    @MainActor
    public func disableDataLeakageProtection() {
        screenProtector.disableDataLeakageProtection()
    }
}
