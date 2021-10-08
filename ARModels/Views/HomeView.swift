//
//  ContentView.swift
//  ModelAR
//
//  Created by Artem Palyutin on 07.10.2021.
//

import SwiftUI
import RealityKit

struct HomeView : View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: ModelAR?
    @State private var modelConfirmedForPlacement: ModelAR?
    
    var modelsAR: [ModelAR] = {
        let fileManager = FileManager.default
        
        guard let path = Bundle.main.resourcePath,
              let files = try? fileManager.contentsOfDirectory(atPath: path) else {
                  return []
              }
        
        var availableModels: [ModelAR] = []
        for fileName in files where fileName.hasSuffix("usdz") {
            let modelName = fileName.replacingOccurrences(of: ".usdz", with: "")
            let modelAR = ModelAR(modelName: modelName)
            availableModels.append(modelAR)
        }
        return availableModels
    }()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement)
            
            if isPlacementEnabled {
                PlacementButtonsView(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, modelConfirmedForPlacement: $modelConfirmedForPlacement)
            } else {
                PickerView(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, modelsAR: modelsAR)
            }
        }
        .ignoresSafeArea()
    }
}










#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
