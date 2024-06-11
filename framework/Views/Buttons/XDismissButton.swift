//
//  XDismissButton.swift
//  framework
//
//  Created by David Zhu on 2024-06-05.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowing = false
            } label: {
                // .label dynamically adjusts based on the current appearance mode (e.g., light or dark mode) to ensure readability.
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

#Preview {
    XDismissButton(isShowing: .constant(false))
}
