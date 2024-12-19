////
////  AddPhraseSheet.swift
////  Mafateeh
////
////  Created by Maryam Amer Bin Siddique on 17/06/1446 AH.
////
//
//import SwiftUI
//
//struct AddPhraseSheet: View {
//    @ObservedObject var viewModel: PhraseViewModel
//    @Binding var showSheet: Bool
//
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: {
//                    showSheet = false
//                }) {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(.blue)
//                        .font(.system(size: 20, weight: .medium))
//                        .padding()
//                }
//                Spacer()
//                Button("Save") {
//                    viewModel.addPhrase()
//                    showSheet = false
//                }
//                .padding()
//                .disabled(viewModel.newPhrase.isEmpty)
//            }
//            TextEditor(text: $viewModel.newPhrase)
//                .frame(width: 356, height: 199)
//                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.gray, lineWidth: 0.20)
//                )
//                .padding()
//
//            Spacer()
//        }
//    }
//}
//
//#Preview {
//    AddPhraseSheet(
//        viewModel: PhraseViewModel(),
//        showSheet: .constant(true)
//    )
//}
