//
//  ContentViewModel.swift
//  PythonSampleApp
//
//  Created by 松島哲仁 on 2024/05/12.
//

import Foundation
import AppKit
import PythonKit

class ContentViewModel {
 
    func createNSImage(data: Data) -> NSImage? {
        return NSImage(data: data)
    }
    
    func compareImage(targetData: Data?, comparingData: Data?) {
        guard let targetData, let comparingData else {
            return
        }
        let responseText = PythonManager.shared.compareImage(targetData: targetData, comparingData: comparingData)
        print(responseText)
    }
    
}
