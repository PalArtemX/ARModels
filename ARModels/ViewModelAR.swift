//
//  ViewModelAR.swift
//  ModelAR
//
//  Created by Artem Palyutin on 08.10.2021.
//

import Foundation
import RealityKit
import SwiftUI
import Combine


class ModelAR {
    
    var modelName: String
    var image: Image
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image = Image(modelName)
        
        let fileName = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                print("error")
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
            })
            
    }
}

