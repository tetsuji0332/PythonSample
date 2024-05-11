//
//  ContentView.swift
//  PythonSampleApp
//
//  Created by 松島哲仁 on 2024/05/07.
//

import SwiftUI
import PythonKit

struct ContentView: View {
    let jjj = PythonScriptManager()
    @State var showResult: Bool = false
    var body: some View {
        Image("mainIcon")
        Button(action: {
            showResult.toggle()
        }) {
            Text("Run Python Script")
        }
        if showResult {
            Text(String("\(jjj.helloPythonScript())"))
        }
    }
}

#Preview {
    ContentView()
}
