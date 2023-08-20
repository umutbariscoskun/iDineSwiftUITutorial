//
//  iDineSwiftUITutorialApp.swift
//  iDineSwiftUITutorial
//
//  Created by Umut Barış Çoşkun on 20.08.2023.
//

import SwiftUI

@main
struct iDineSwiftUITutorialApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
