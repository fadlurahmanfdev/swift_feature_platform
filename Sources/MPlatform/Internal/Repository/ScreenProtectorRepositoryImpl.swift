//
//  ScreenProtectorRepositoryImpl.swift
//  MPlatform
//
//  Created by Taufik Fadlurahman Fajari on 09/08/26.
//

import UIKit

final class ScreenProtectorRepositoryImpl: ScreenProtectorRepository {
    private var secureField: UITextField?
    private var screenCaptureProtectionEnabled: Bool = false
    private var dataLeakageProtectionEnabled: Bool = false
    private var privacyView: UIView?

    func initialize() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillResignActive),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }

    func close() {
        NotificationCenter.default.removeObserver(self)
    }

    func disableScreenCapture() {
        guard screenCaptureProtectionEnabled == false else {
            print("Already enabled Screen Capture Protection")
            return
        }

        guard secureField == nil else {
            secureField?.isSecureTextEntry = true
            screenCaptureProtectionEnabled = true
            print("Re-enable Screen Capture Protection")
            return
        }

        guard let window = self.window else {
            return
        }

        let secureField = UITextField()
        secureField.isSecureTextEntry = true
        secureField.isUserInteractionEnabled = false
        secureField.translatesAutoresizingMaskIntoConstraints = false

        window.addSubview(secureField)
        NSLayoutConstraint.activate([
            secureField.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            secureField.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            secureField.widthAnchor.constraint(equalToConstant: 0),
            secureField.heightAnchor.constraint(equalToConstant: 0),
        ])

        guard let superLayer = window.layer.superlayer else {
            return
        }

        guard let secureLayer = secureField.layer.sublayers?.last else {
            secureField.removeFromSuperview()
            return
        }

        superLayer.addSublayer(secureField.layer)
        secureLayer.addSublayer(window.layer)

        self.secureField = secureField
        screenCaptureProtectionEnabled = true
        print("Enabled Screen Protector Protection")
    }

    func enableScreenCapture() {
        guard screenCaptureProtectionEnabled == true else {
            print("Screen Capture Protection already disabled")
            return
        }

        guard let secureField = self.secureField else {
            print(
                "Unable to disabled Screen Capture Protection caused by secure field missing"
            )
            return
        }

        secureField.isSecureTextEntry = false

        screenCaptureProtectionEnabled = false
        print("Disabled Screen Protector Protection")
    }

    func enableDataLeakageProtection() {
        self.dataLeakageProtectionEnabled = true
        print("Enabled Data Lekage Protection")
    }

    func disableDataLeakageProtection() {
        self.dataLeakageProtectionEnabled = false
        print("Disabled Data Leakage Protection")
    }

    @MainActor
    private func overrideOverlayBlackView() {
        guard let window = self.window else {
            return
        }

        let overlay = UIView(frame: window.bounds)
        overlay.backgroundColor = .black

        window.addSubview(overlay)

        privacyView = overlay
    }

    @MainActor
    private func removeOverlayBlackView() {
        guard let privacyView = self.privacyView else {
            print("There is no Data Lekage Protection")
            return
        }

        privacyView.removeFromSuperview()
        self.privacyView = nil
    }

    @MainActor
    @objc
    private func appWillResignActive() {
        if dataLeakageProtectionEnabled {
            overrideOverlayBlackView()
        }
    }

    @MainActor
    @objc
    private func appDidBecomeActive() {
        if dataLeakageProtectionEnabled {
            removeOverlayBlackView()
        }
    }

    @MainActor
    private var window: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }
    }
}
