//
//  Assignment_28App.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 13.12.23.
//

import SwiftUI

@main
struct Assignment_28App: App {
    @StateObject private var mainSceneViewModel = MainScreenViewModel()

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            MainScreenView(viewModel: mainSceneViewModel)
                .environmentObject(mainSceneViewModel)
        }
    }
}
