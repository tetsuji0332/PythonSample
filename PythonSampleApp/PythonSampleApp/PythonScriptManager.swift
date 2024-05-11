//
//  PythonScriptManager.swift
//  PythonSampleApp
//
//  Created by 松島哲仁 on 2024/05/07.
//

import Foundation
import PythonKit

class PythonScriptManager {

    func runPythonScript() -> PythonObject {
        let sys = Python.import("sys")
        sys.path.append("/Users/matsushimatetsuji/PythonSample/PythonSampleApp/PythonSampleApp/")
        let file = Python.import("PythonScript")
        
        let response = file.hello_world()
        print(response)
        return response
    }
    
    func helloPythonScript() -> PythonObject {
        let sys = Python.import("sys")
        sys.path.append("/Users/matsushimatetsuji/PythonSample/PythonSampleApp/PythonSampleApp/")
        let file = Python.import("PythonScript")
        
        let response = file.hello("哲仁")
        print(response)
        return response
    }
    
    func ggg() -> PythonObject {
        let sys = Python.import("sys")
        sys.path.append("/Users/matsushimatetsuji/PythonSample/PythonSampleApp/PythonSampleApp/")
        let file = Python.import("PythonScript")
        
        let response = file.ggg()
        print(response)
        return response
    }
    
}


