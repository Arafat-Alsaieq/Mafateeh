////
////  EmptyStateView.swift
////  Mafateeh
////
////  Created by Maryam Amer Bin Siddique on 17/06/1446 AH.
////
//
//import SwiftUI
//
//struct EmptyStateView: View {
//    @Binding var showSheet: Bool
//    @ObservedObject var viewModel: PhraseViewModel
//
//    var body: some View {
//        VStack {
//            Spacer()
//            VStack(spacing: 16) {
//                Text("💬").font(.system(size: 90)).offset(x: -5, y: 30)
//                Text("⚡️").font(.system(size: 90)).offset(x: 30, y: -150)
//                Text("You have no saved phrases")
//                    .fontWeight(.semibold)
//                    .font(.body)
//                    .padding(.top, -100)
//                    .overlay(
//                        Rectangle()
//                            .foregroundStyle(Color("BG"))
//                            .frame(width: 1000, height: 500)
//                            .offset(y: -40)
//                            .opacity(0.5)
//                    )
//            }
//            Spacer()
//            Button(action: {
//                viewModel.newPhrase = ""
//                viewModel.editingIndex = nil
//                showSheet = true
//            }) {
//                Text("Add Now")
//                    .fontWeight(.semibold)
//                    .frame(maxWidth: .infinity, minHeight: 50)
//                    .background(Color("Button"))
//                    .foregroundColor(.white)
//                    .cornerRadius(25)
//                    .padding(.horizontal, 20)
//            }
//            .padding(.bottom, 40)
//        }
//    }
//}
//
//#Preview {
//    EmptyStateView(
//        showSheet: .constant(false),
//        viewModel: PhraseViewModel()
//    )
//}
