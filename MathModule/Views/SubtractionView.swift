//
//  SubtractionView.swift
//  RealmTimers
//
//  Created by Jason Rueckert on 12/1/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct SubtractionView: View {
//    var body: some View {
//        ZStack {
//            Color.red
//
//            Text("Subtraction Here")
//        }
//    }
    
    @StateObject var numberModelVM = NumberViewModel()
    @State private var score = 0
    @State private var reset = true
    @State private var progressValue: Float = 0.0
    
    @AppStorage("subtractionLevel") var subtractionLevel: Int = 1
    
    fileprivate func checkAnswer() {
        if numberModelVM.correctSubtractionAnswer == Int(numberModelVM.userAnswer) {
            score += 1
            
            withAnimation(Animation.default.speed(0.55)){
                if progressValue < 0.91 {
                    progressValue += 0.1
                } else {
                    resetProgressBar()
                }
            }
            
            if score == 10 {
                subtractionLevel += 1
                numberModelVM.subtractionLevel += 1
                print("numberModelVM: \(numberModelVM.subtractionLevel)\nlevel: \(subtractionLevel)")
            } else if score == 20 {
                subtractionLevel += 1
                numberModelVM.subtractionLevel += 1
                print("numberModelVM: \(numberModelVM.subtractionLevel)\nlevel: \(subtractionLevel)")
            } else if score == 30 {
                subtractionLevel += 1
                numberModelVM.subtractionLevel += 1
                print("numberModelVM: \(numberModelVM.subtractionLevel)\nlevel: \(subtractionLevel)")
            } else if score == 40 {
                subtractionLevel += 1
                numberModelVM.subtractionLevel += 1
                print("numberModelVM: \(numberModelVM.subtractionLevel)\nlevel: \(subtractionLevel)")
            } else if score == 50 {
                subtractionLevel += 1
                numberModelVM.subtractionLevel += 1
                print("numberModelVM: \(numberModelVM.subtractionLevel)\nlevel: \(subtractionLevel)")
            }
            
            numberModelVM.newSubtractionEquation()
            numberModelVM.userAnswer = ""
            reset = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                numberModelVM.userAnswer = ""
                self.reset = true
            }
        }
    }
    
    func resetProgressBar() {
        self.progressValue = 0.1
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 20.0) {
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "minus")
                            .font(.system(size: 40, weight: .black))
                            .imageScale(.large)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                        
                        VStack {
                            Text("\(numberModelVM.topNumberSub)")
                            Text("\(numberModelVM.bottomNumberSub)")
                        }
                        .font(.system(size: 60, weight: .black))
                        .foregroundColor(.white)
                    }
                    .font(.largeTitle)
                    
                    Divider()
                        .frame(width: screen.width - 200, height: 2.0)
                        .background(Color.gray)
                }
                
                HStack {
                    Spacer()
                    VStack {
                        ZStack {
                            if numberModelVM.userAnswer.isEmpty {
                                Text("???")
//                                For debugging
//                                Text("\(numberModelVM.correctSubtractionAnswer)")
                                    .font(.system(size: 60, weight: .black))
                            }
                            
                            TextField("", text: $numberModelVM.userAnswer)
                                .keyboardType(.numberPad)
                                .frame(width: 200, height: 70)
                                .font(.system(size: 60, weight: .black))
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.leading, .trailing], 4)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                                .multilineTextAlignment(TextAlignment.trailing)
                        }
                        .foregroundColor(.white)
                    }
                    .font(.title)
                    
                    Spacer()
                    
                    Button(action: {
                        reset = false
                        checkAnswer()
                        UIApplication.shared.endEditing()
                        
                    }) {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))))
                    }
                }
            }
            .padding(30)
            .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .top)
            .offset(y: 170)
            .background(Color(.darkGray))
            
            ZStack {
                VStack {
                    HStack {
                        VStack(alignment: .center, spacing: 5.0) {
                            Text("Subtraction")
                                .font(.system(size: 24, weight: .black))
                            ProgressBar(value: $progressValue, progressColor: Color(#colorLiteral(red: 0.006537661422, green: 0.4778559804, blue: 0.9984870553, alpha: 1)))
                                .frame(height: 20)
                            
                            HStack {
                                Text("Score: \(score)")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(reset ? .white : .red)
                                
                                Spacer()
                                
                                HStack(spacing: 5.0) {
                                    Text("Level")
                                    
                                    Text("\(subtractionLevel)")
                                        .onAppear {
                                            numberModelVM.subtractionLevel = subtractionLevel
                                        }
                                }
                                .font(.system(size: 24, weight: .bold))
                            }
                            
                        }
                        .padding(.top, 10)
                    }
                    .foregroundColor(.white)
                    .padding(.top, 90)
                    .padding(.bottom, 40)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, maxHeight: 180)
                    .background(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                    .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)).opacity(0.4), radius: 10, x: 0, y: 10)
                    
                }
                
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            print("numberModelVM: \(numberModelVM.subtractionLevel)\nlevel: \(subtractionLevel)")
        }
    }
}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
