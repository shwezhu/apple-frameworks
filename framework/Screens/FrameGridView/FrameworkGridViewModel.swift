//
//  FrameworkGridViewModel.swift
//  framework
//
//  Created by David Zhu on 2024-06-02.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    // Three columns.
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
}
