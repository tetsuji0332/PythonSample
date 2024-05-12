//
//  ContentView.swift
//  PythonSampleApp
//
//  Created by 松島哲仁 on 2024/05/07.
//

import SwiftUI
import PythonKit
import PhotosUI

struct ContentView: View {
    
    private let viewModel = ContentViewModel()
    
    @State var selectedItem:  [PhotosPickerItem] = []
    @State var selectedTargetImage: NSImage?
    @State var selectedComparingImage: NSImage?
    @State var responseText: PythonObject?
    
    
    @State var showResult: Bool = false
    var body: some View {
        VStack {
            Text("画像比較するよ")
            Image("mainIcon")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipped()
            PhotosPicker(
                selection: $selectedItem,
                maxSelectionCount: 2
            ) {
                Text("写真フォルダを開く")
            }
            .onChange(of: selectedItem) { item in
                Task {
                    guard let targetImageData = try? await item[0].loadTransferable(type: Data.self),
                          let comparingImageData = try? await item[1].loadTransferable(type: Data.self) else {
                        return
                    }
                    let targetData = targetImageData as Data
                    let comparingData = comparingImageData as Data
                    setupSelectedImage(targetData: targetData, comparingData: comparingData)
                    viewModel.compareImage(targetData: targetData, comparingData: comparingData)
                }
            }
        }
        
        
        if let targetImage = selectedTargetImage,
           let comparingImage = selectedComparingImage {
            HStack {
                Image(nsImage: targetImage)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                Image(nsImage: comparingImage)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
        }
    }
}

#Preview {
    ContentView()
}


extension ContentView {
    
    func setupSelectedImage(targetData: Data, comparingData: Data) {
        guard let targetImage = viewModel.createNSImage(data: targetData) else { return }
        guard let comparingImage = viewModel.createNSImage(data: comparingData) else { return }
        selectedTargetImage = targetImage
        selectedComparingImage = comparingImage
    }
    
}
