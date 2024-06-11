//
//  SafariView.swift
//  framework
//
//  Created by David Zhu on 2024-06-04.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    // typealias Context = UIViewControllerRepresentableContext<Self>
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // This method is usually left empty for SFSafariViewController.
    }
}
