//
//  AFButton.swift
//  framework
//
//  Created by David Zhu on 2024-06-01.
//

import SwiftUI

struct AFButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 250, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}

#Preview {
    AFButton(title: "hello")
}
