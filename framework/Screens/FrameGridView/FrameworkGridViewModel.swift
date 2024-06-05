//
//  FrameworkGridViewModel.swift
//  framework
//
//  Created by David Zhu on 2024-06-02.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        // This is a stored property, didSet is a Property Observer used by stored property only.
        didSet { isShowingDetailView = true }
    }
    
    // @Published is attached to properties inside an ObservableObject,
    // and tells SwiftUI that it should refresh any views that use this property when it is changed.
    @Published var isShowingDetailView = false
    
    // Three columns.
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
}
