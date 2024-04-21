//
//  MusemApp.swift
//  Musem
//
//  Created by Justin Walker on 4/15/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import CoreText

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure Firebase
        FirebaseApp.configure()
        
        // Register custom fonts asynchronously
        registerCustomFontsAsync()
        
        return true
    }
    
    func registerCustomFontsAsync() {
        // Perform font registration on a background thread
        DispatchQueue.global(qos: .userInitiated).async {
            self.registerCustomFonts()
        }
    }
    
    func registerCustomFonts() {
        let fontNames = ["Exo2-Bold", "Lato-Regular", "Roboto-Regular"]
        fontNames.forEach { registerFont(withName: $0) }
    }
    
    func registerFont(withName fontName: String) {
        let fontExtensions = ["ttf", "otf"]
        
        for extensionType in fontExtensions {
            guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: extensionType) else {
                continue
            }
            
            var error: Unmanaged<CFError>?
            if CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, &error) {
                print("Font \(fontName) registered successfully.")
                break // If registration is successful, break out of the loop to avoid redundant registrations
            } else {
                if let error = error?.takeRetainedValue(), let description = CFErrorCopyDescription(error) {
                    print("Failed to register font \(fontName) with \(extensionType): \(description)")
                } else {
                    print("Failed to register font \(fontName) with \(extensionType): Unknown error.")
                }
            }
        }
    }
}

@main
struct MusemApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView{
        ContentView()
      }
    }
  }
}
