//
//  XMarkButton.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 11/05/25.
//

import SwiftUI

struct XMarkButton: View {
    var action: () -> Void
    
    var body: some View {
        Button (action: {
            action()
        }, label: {
          Image(systemName: "xmark")
            .font(.headline)
        })
    }
}

#Preview {
    XMarkButton {
        print("test")
    }
}
