////
////  ListView.swift
////  Mafateeh
////
////  Created by Maryam Amer Bin Siddique on 17/06/1446 AH.
////
//
//import SwiftUI
//
//struct ListView: View {
//    @ObservedObject var viewModel: PhraseViewModel
//    @Environment(\.editMode) var editMode
//    @Binding var showSheet: Bool
//
//    var body: some View {
//        List(selection: $viewModel.selectedItems) {
//            ForEach(viewModel.savedPhrases, id: \.self) { phrase in
//                Text(phrase)
//                    .onTapGesture {
//                        if editMode?.wrappedValue == .inactive {
//                            viewModel.newPhrase = phrase
//                            viewModel.editingIndex = viewModel.savedPhrases.firstIndex(of: phrase)
//                            showSheet = true
//                        }
//                    }
//            }
//        }
//        .listStyle(PlainListStyle())
//        .padding(.top, 40)
//        .padding(.horizontal, 20)
//
//        Spacer()
//
//        if editMode?.wrappedValue != .active {
//            Button(action: {
//                viewModel.newPhrase = ""
//                viewModel.editingIndex = nil
//                showSheet = true
//            }) {
//                Text("Add Phrase")
//                    .fontWeight(.semibold)
//                    .frame(maxWidth: .infinity, minHeight: 50)
//                    .background(Color("Button"))
//                    .foregroundColor(.white)
//                    .cornerRadius(25)
//                    .padding(.horizontal, 20)
//            }
//            .padding(.top, 610)
//        }
//    }
//}
//
//#Preview {
//    ListView(
//        viewModel: {
//            let viewModel = PhraseViewModel()
//            viewModel.savedPhrases = ["Example Phrase 1", "Example Phrase 2"]
//            return viewModel
//        }(),
//        showSheet: .constant(false)
//    )
//}
