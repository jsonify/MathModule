//
//  AdditionView.swift
//  RealmTimers
//
//  Created by Jason Rueckert on 12/1/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct AdditionView: View {
    @State private var answerText = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 30.0) {
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.system(size: 40, weight: .black))
                            .imageScale(.large)
                            .foregroundColor(.green)
                        
                        VStack {
                            Text("12")
                            Text("8")
                        }
                        .font(.system(size: 60, weight: .black))
                        .foregroundColor(.white)
                    }
                    .font(.largeTitle)
                    
                    Divider()
                        .frame(width: screen.width - 200, height: 2.0)
                        .background(Color.gray)
                }
                
                VStack {
                    ZStack {
                        if answerText.isEmpty {
                            Text("???")
                        }
                        
                        TextField("", text: $answerText)
                            .padding(.horizontal, 100)
                    }
                    .foregroundColor(.white)
                }
                .font(.title)
            }
            .padding(30)
            .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .top)
            .offset(y: 250)
            .background(Color(.darkGray))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            ZStack {
                HStack {
                    Image(systemName: "plus.square.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.horizontal)
                    
                    Text("Addition")
                        .font(.system(size: 24, weight: .black))
                        .frame(width: 200, alignment: .leading)
                }
                .foregroundColor(.white)
                .padding(44)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(Color(#colorLiteral(red: 0, green: 0.746296227, blue: 0, alpha: 1)))
                .shadow(color: Color(#colorLiteral(red: 0, green: 0.746296227, blue: 0, alpha: 1)).opacity(0.4), radius: 10, x: 0, y: 10)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
