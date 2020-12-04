//
//  OperationsViewModel.swift
//  MathModule
//
//  Created by Jason Rueckert on 12/2/20.
//

import SwiftUI
import Combine

class OperationsViewModel: ObservableObject {
    @Published var progressValue: Float = 0.0
    
    func startProgressBar() {
        for _ in 0...80 {
            self.progressValue += 0.015
        }
    }
    
    func resetProgressBar() {
        self.progressValue = 0.0
    }
}
