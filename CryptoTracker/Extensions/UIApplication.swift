//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 11/05/25.
//

import Foundation
import SwiftUI


extension UIApplication {
    func endEditing () {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
