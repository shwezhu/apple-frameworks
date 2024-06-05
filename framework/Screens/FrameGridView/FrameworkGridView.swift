//
//  FrameworkGridView.swift
//  framework
//
//  Created by David Zhu on 2024-06-01.
//

import SwiftUI

struct FrameworkGridView: View {
    // @StateObject: used to store new instances of reference type data that conforms to the ObservableObject protocol. This owns its data.
    // ‼️ Every time FrameworkGridView be destroyed and recreated,
    // @StateObject and @State will stay alive and be held off somewhere and persist.
    @StateObject var viewModel = FrameworkGridViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    // id: 保证每个视图的唯一性, Framework confirms Identifiable, so don't need sepcify id parameter.
                    // A hashable id matters in SwiftUI as well as in other view-tree based frameworks like React.
                    // https://stackoverflow.com/a/72236955/16317008
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            // .navigationBarTitle() and .navigationBarItem() are modifiers on the View inside of the NavigationView, not on the NavigationView itself
            // https://stackoverflow.com/a/56659019/16317008
            // https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui
            .navigationTitle("🍏 Frameworks")  // 每个页面都有一个自己的 title
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}
