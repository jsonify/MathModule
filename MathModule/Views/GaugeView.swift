//
//  GaugeView.swift
//  MathModule
//
//  Created by Jason Rueckert on 12/2/20.
//

import SwiftUI

struct GaugeView: View {
    var body: some View {
        Home()
    }
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView()
    }
}

struct Home: View {
    @ObservedObject var operationsVM = OperationsViewModel()
    
    @State private var progress: CGFloat = 0
    @State var progressValue: Float = 0.0
    
    let colors = [Color("Color1"), Color("Color2")]
    
    var body: some View {
        ProgressBar(value: $progressValue, progressColor: Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
            .frame(height: 20)
        VStack {
            VStack {

                Button(action: {
                    operationsVM.startProgressBar()
                }) {
                    Text("Start Progress")
                }.padding()

                Button(action: {
                    operationsVM.resetProgressBar()
                }) {
                    Text("Reset")
                }

                Spacer()
            }.padding()

//            VStack {
//                CircleMeter(progress: $progress)
//
//                HStack(spacing: 25) {
//                    Button(action: {
//                        withAnimation(Animation.default.speed(0.55)) {
//                            if progress != 100 {
//                                progress += 10
//
//                            }
//                        }
//                    }, label: {
//                        Text("Update")
//                            .padding(.vertical, 10)
//                            .frame(width: (UIScreen.main.bounds.width - 50) / 2)
//                    })
//                    .background(Capsule().stroke(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
//
//                    Button(action: {
//                        withAnimation(Animation.default.speed(0.55)) {
//                            progress = 0
//                        }
//                    }, label: {
//                        Text("Reset")
//                            .padding(.vertical, 10)
//                            .frame(width: (UIScreen.main.bounds.width - 50) / 2)
//                    })
//                    .background(Capsule().stroke(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
//                }
//                .padding(.top, 55)
//            }
        }
        
    }
    func startProgressBar() {
//        for _ in 0...80 {
//            self.progressValue += 0.015
//        }
        
    }
    
    func resetProgressBar() {
        self.progressValue = 0.0
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    var progressColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
//                    .foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                    .foregroundColor(progressColor)
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}

struct CircleMeter: View {
    var progress: CGFloat
    
    let colors = [Color("Color1"), Color("Color2")]
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.black.opacity(0.1), lineWidth: 55)
                    .frame(width: 280, height: 280)
                
                Circle()
                    .trim(from: 0, to: setProgress())
                    .stroke(AngularGradient(gradient: .init(colors: colors), center: .center, angle: .init(degrees: 180)), lineWidth: 55)
                    .frame(width: 280, height: 280)
            }
            .rotationEffect(.init(degrees: 180))
        }
        .padding(.bottom, -140)
    }
    
    func setProgress() -> CGFloat {
        let temp = self.progress / 2
        return temp * 0.01
    }
}

