//
//  NumberViewModel.swift
//  MathModule
//
//  Created by Jason Rueckert on 12/3/20.
//

import SwiftUI

class NumberViewModel: ObservableObject {
    
    @Published var topNumberAdd: Int = 0
    @Published var bottomNumberAdd: Int = 0
    @Published var correctAdditionAnswer = 0
    @Published var additionLevel: Int = 1
    
    @Published var topNumberSub: Int = 0
    @Published var bottomNumberSub: Int = 0
    @Published var correctSubtractionAnswer = 0
    @Published var subtractionLevel: Int = 1 

    @Published var userAnswer = ""
    @Published var score: Int = 0
    
    init() {
        self.topNumberAdd = Int.random(in: 8 ... (additionLevel * 10))
        self.bottomNumberAdd = Int.random(in: 0 ... 8)
        self.correctAdditionAnswer = topNumberAdd + bottomNumberAdd
        self.topNumberSub = Int.random(in: 8 ... (subtractionLevel * 10))
        self.bottomNumberSub = Int.random(in: 0 ... 8)
        self.correctSubtractionAnswer = topNumberSub - bottomNumberSub
    }
    
    func newAdditionEquation(){
        topNumberAdd = Int.random(in: 0 ... (additionLevel * 10))
        bottomNumberAdd = Int.random(in: 0 ... 9)
        correctAdditionAnswer = topNumberAdd + bottomNumberAdd
    }
    
    func newSubtractionEquation(){
        topNumberSub = Int.random(in: 8 ... (subtractionLevel * 10))
        bottomNumberSub = Int.random(in: 0 ... 8)
        correctSubtractionAnswer = topNumberSub - bottomNumberSub
    }
}


