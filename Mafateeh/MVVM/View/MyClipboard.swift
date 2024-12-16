//
//  MyClipboard.swift
//  Mafateeh
//
//  Created by Maryam Amer Bin Siddique on 15/06/1446 AH.
//

import SwiftUI

struct MyClipboard: View {
    var body: some View {
        NavigationView{
            ZStack {
                    Color("BG")
                        .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    VStack(spacing: 16) {
                        Text("💬")
                            .font(.system(size: 90))
                            .offset(x: -5, y: 30)
                        //                            .padding(.top, 200)
                        // flip text balloon horizontally
                        Text("⚡️")
                            .font(.system(size: 90))
                            .offset(x: 30, y: -150)
                        Text("You have no saved phrases")
                            .fontWeight(.semibold)
                            .font(.body)
                            .padding(.top, -100)
                            .overlay(
                                Rectangle()
                                    .foregroundStyle(Color("BG"))
                                    .frame(width: 1000, height: 500)
                                    .offset(y: -40)
                                    .opacity(0.5)
                            )
                    }
                        Spacer()
                        Button(action: {
                            print("Add Now tapped!")
                        }) {
                            Text("Add Now")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color("Button"))
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .padding(.horizontal, 20)
                        }
                        .padding(.bottom, 40)
                }
                .navigationBarBackButtonHidden(false)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("My Clipboard")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.top, 30)
                    }
                }
                    
            }
        }
    }
}

#Preview {
    MyClipboard()
}
