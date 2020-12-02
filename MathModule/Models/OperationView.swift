//
//  OperationView.swift
//  MathModule
//
//  Created by Jason Rueckert on 12/2/20.
//

import SwiftUI

struct OperationView: View {
    var section: OperationTopicView
    var width: CGFloat = 325
    var height: CGFloat = 100
    
    var body: some View {
        HStack {
            section.image
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.horizontal)
            
            
            VStack {
                Text(section.topic)
                    .font(.system(size: 28, weight: .black))
                    .frame(width: 200, alignment: .leading)
                
                HStack(spacing: 30.0) {
                    Text(section.equation)
                    Text("Level \(section.level)")
                        .font(.caption)
                        .frame(width: 70, height: 20)
                        .background(section.color)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .font(.subheadline)
            }
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(20)
        .shadow(color: section.color.opacity(0.4), radius: 10, x: 0, y: 0   )
    }
}


struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        OperationView(section: OperationTopicView(topic: "Addition", equation: "2 + 4 = 6", level: 1, image: Image(systemName: "plus.square.fill"), color: Color(#colorLiteral(red: 0, green: 0.746296227, blue: 0, alpha: 1))))
    }
}

struct OperationTopicView: Identifiable {
    var id = UUID().uuidString
    var topic: String
    var equation: String
    var level: Int
    var image: Image
    var color: Color
}

let operationData = [
    OperationTopicView(topic: "Addition", equation: "2 + 4 = 6", level: 1, image: Image(systemName: "plus.square.fill"), color: Color(#colorLiteral(red: 0, green: 0.746296227, blue: 0, alpha: 1))),
    OperationTopicView(topic: "Subtraction", equation: "9 - 5 = 4", level: 1, image: Image(systemName: "minus.square.fill"), color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))),
    OperationTopicView(topic: "Multiplication", equation: "2 x 4 = 8", level: 1, image: Image(systemName: "multiply.square.fill"), color: Color(#colorLiteral(red: 0.9473446012, green: 0.723336637, blue: 0.1284327209, alpha: 1))),
    OperationTopicView(topic: "Division", equation: "10 / 2 = 5", level: 1, image: Image(systemName: "divide.square.fill"), color: Color(#colorLiteral(red: 0.006537661422, green: 0.4778559804, blue: 0.9984870553, alpha: 1)))
]
