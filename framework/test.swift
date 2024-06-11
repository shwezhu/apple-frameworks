//
//  test.swift
//  framework
//
//  Created by David Zhu on 2024-06-07.
//

import SwiftUI

struct Test: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Go to screen 1", value: "1")
                NavigationLink("Go to screen 1", value: "2")
                NavigationLink("Go to screen 1", value: "3")
                // Other NavigationLinks
            }
            .navigationDestination(for: String.self) { value in
                Text("This is screen number \(value)")
            }
        }
    }
}

#Preview {
    Test()
}
