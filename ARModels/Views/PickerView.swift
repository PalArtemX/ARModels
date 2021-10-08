//
//  PickerView.swift
//  ModelAR
//
//  Created by Artem Palyutin on 07.10.2021.
//

import SwiftUI

struct PickerView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: ModelAR?
    
    let modelsAR: [ModelAR]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0..<modelsAR.count) { index in
                    Button {
                        selectedModel = modelsAR[index]
                        
                        isPlacementEnabled = true
                    } label: {
                        modelsAR[index].image
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80)
                            .opacity(0.7)
                            .shadow(radius: 2)
                            .cornerRadius(10)
                            
                    }
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.2))
    }
}










struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
