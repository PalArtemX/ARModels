//
//  ARViewContainer.swift
//  ModelAR
//
//  Created by Artem Palyutin on 07.10.2021.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: ModelAR?
    
    // MARK: - func makeUIView
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // MARK: - AR Configuration
        // Configuring the configuration -- Настройка конфигурации
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        // For devices with lidar function -- Для устройств с функцией лидара
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        // Starting the configuration -- Запуск конфигурации
        arView.session.run(config)
        
        
        
        return arView
        
    }
    
    // MARK: func updateUIView
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelAR = modelConfirmedForPlacement {
            
            if let modelEntity = modelAR.modelEntity {
                let anchorEntity = AnchorEntity(plane: .any)
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                
                uiView.scene.addAnchor(anchorEntity)
            }
            
            DispatchQueue.main.async {
                modelConfirmedForPlacement = nil
            }
        }
    }
    
}
