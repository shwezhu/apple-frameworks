//
//  DetailsPage.swift
//  framework
//
//  Created by David Zhu on 2024-06-01.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            XDismissButton(isShowing: $isShowingDetailView)
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $isShowingSafariView) {
            if let url = URL(string: framework.urlString) {
                SafariView(url: url)
            } else {
                Text("Invalid URL")
            }
        }
    }
}

#Preview {
    let data = MockData.frameworks[0]
    @State var isShowing = true
    return FrameworkDetailView(framework: data, isShowingDetailView: $isShowing)
}
