//
//  PythonSampleAppApp.swift
//  PythonSampleApp
//
//  Created by 松島哲仁 on 2024/05/07.
//

import SwiftUI
import PythonKit

@main
struct PythonSampleAppApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    PythonLibrary.useLibrary(at: "/Users/matsushimatetsuji/.pyenv/versions/3.11.4/bin/python")
                }
        }
    }
}
