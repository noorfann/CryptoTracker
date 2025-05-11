//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 11/05/25.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
    
}
