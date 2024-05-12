//
//  PythonScriptManager.swift
//  PythonSampleApp
//
//  Created by 松島哲仁 on 2024/05/07.
//

import Foundation
import PythonKit

class PythonManager {

    static let shared = PythonManager()
    
    private let sys = Python.import("sys")
    private let path = "/Users/matsushimatetsuji/PythonSample/PythonSampleApp/PythonSampleApp/"
    private let fileName = "PythonScript"
    private var handler: PythonObject?
    
    private init() {
        sys.path.append(path)
        handler = Python.import(fileName)
        runPythonScript()
    }
    
    private func runPythonScript() {
        guard let handler else {
            print("RunPythonScript: Failed")
            return
        }
        let response = handler.runScript()
        print(response)
    }
    
    func compareImage(targetData: Data, comparingData: Data) -> PythonObject? {
        guard let handler else {
            return nil
        }
        let imageDataBase64String0 = targetData.base64EncodedString()
        let imageDataBase64String1 = comparingData.base64EncodedString()
        let response = handler.compareImage(imageDataBase64String0, imageDataBase64String1)
        print("compareImage()")
        print(response)
        return response
    }
    
}


