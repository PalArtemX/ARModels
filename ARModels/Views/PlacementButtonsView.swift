//
//  PlacementButtonsView.swift
//  ModelAR
//
//  Created by Artem Palyutin on 07.10.2021.
//

import SwiftUI

struct PlacementButtonsView: View {
    
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: ModelAR?
    @Binding var modelConfirmedForPlacement: ModelAR?
    
    var body: some View {
        HStack(spacing: 50.0) {
            // MARK: - Cancel Button
            Button(role: .cancel) {
                resetPlacementParameters()
            } label: {
                Image(systemName: "x.circle.fill")
                    .foregroundStyle(.red)
            }
            // MARK: - Confirm Button
            Button {
                modelConfirmedForPlacement = selectedModel
                resetPlacementParameters()
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
            }


        }
        .font(.largeTitle)
        .symbolRenderingMode(.hierarchical)
        .padding()
        .padding(.bottom)
    }
    
    // MARK: - func resetPlacementParameters
    func resetPlacementParameters() {
        isPlacementEnabled = false
        selectedModel = nil
    }
}










struct PlacementButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
