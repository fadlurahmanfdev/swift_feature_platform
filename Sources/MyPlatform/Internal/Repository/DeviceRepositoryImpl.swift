import Darwin
import UIKit

internal final class DeviceRepositoryImpl: DeviceRepository {
    func deviceModel() throws -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") {
            identifier,
            element in
            guard let value = element.value as? Int8, value != 0 else {
                return identifier
            }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    func deviceID() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }

}
