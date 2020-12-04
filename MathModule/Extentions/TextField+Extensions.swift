//
//  TextField+Extensions.swift
//  MathModule
//
//  Created by Jason Rueckert on 12/3/20.
//

import SwiftUI


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
