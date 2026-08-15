protocol DeviceRepository {
    func deviceModel() throws -> String
    func deviceID() -> String?
}
