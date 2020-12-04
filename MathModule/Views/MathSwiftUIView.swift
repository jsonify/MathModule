//
//  MathSwiftUIView.swift
//  MathModule
//
//  Created by Jason Rueckert on 12/2/20.
//

import SwiftUI

enum OperatorType: Int, Identifiable {
    var id: Int {
        rawValue
    }
    
    case add, subtract, multiply, divide
}

struct Settings: Codable {
    let darkMode: Bool
    let name: String
}

struct MathSwiftUIView: View {
    @State private var output: String = ""
    
    @State private var selectedTarget: OperatorType? = nil
    @State private var showProfile = false
    
    @AppStorage("additionLevel") private var additionLevel: Int = 0
    @AppStorage("subtractionLevel") private var subtractionLevel: Int = 0
//    @Binding var level: Int
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1))
            
            VStack {
                HStack {
                    Text("Hello Cousteau.")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image("cousteau")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 30)
                
                HStack {
                    Text("Lets get a new high score today!")
                        .padding(.leading, 40)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                
                VStack(spacing: 50.0) {
//                    Button(action: {
//                        selectedTarget = .add
//                    }, label: {
//                        OperationView(section: OperationTopicView(topic: "Addition", equation: "2 + 4 = 6", level: additionLevel, image: Image(systemName: "plus.square.fill"), color: Color(#colorLiteral(red: 0, green: 0.746296227, blue: 0, alpha: 1))))
//                    })
                    
                        OperationView(section: OperationTopicView(topic: "Addition", equation: "2 + 4 = 6", level: additionLevel, image: Image(systemName: "plus.square.fill"), color: Color(#colorLiteral(red: 0, green: 0.746296227, blue: 0, alpha: 1))))
                            .onTapGesture {
                                selectedTarget = .add
                            }
                    
    
                        OperationView(section: OperationTopicView(topic: "Subtraction", equation: "9 - 5 = 4", level: subtractionLevel, image: Image(systemName: "minus.square.fill"), color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))))
                            .onTapGesture {
                                selectedTarget = .subtract
                            }
                    
//                    Button(action: {
//                        selectedTarget = .multiply
//                    }, label: {
//                        OperationView(section: OperationTopicView(topic: "Multiplication", equation: "2 x 4 = 8", level: 1, image: Image(systemName: "multiply.square.fill"), color: Color(#colorLiteral(red: 0.9473446012, green: 0.723336637, blue: 0.1284327209, alpha: 1))))
//                    })
//
//                    Button(action: {
//                        selectedTarget = .divide
//                    }, label: {
//                        OperationView(section: OperationTopicView(topic: "Division", equation: "10 / 2 = 5", level: 1, image: Image(systemName: "divide.square.fill"), color: Color(#colorLiteral(red: 0.006537661422, green: 0.4778559804, blue: 0.9984870553, alpha: 1))))
//                    })
                    
                }
                
                Spacer()
            }
            .padding(.top, 44)
            
        }
        .ignoresSafeArea()
        .sheet(item: $selectedTarget) { selectedTarget in
            switch selectedTarget {
            case .add:
                AdditionView()
            case .subtract:
                SubtractionView()
            case .multiply:
                MultiplicationView()
            case .divide:
                GaugeView()
//                DivisionView()
            }
        }
    }
}

struct MathSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MathSwiftUIView()
    }
}

let screen = UIScreen.main.bounds

