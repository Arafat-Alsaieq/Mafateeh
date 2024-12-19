////
////  ToolbarView.swift
////  Mafateeh
////
////  Created by Maryam Amer Bin Siddique on 17/06/1446 AH.
////
//
//import SwiftUI
//
//struct ToolbarView: View {
//    @ObservedObject var viewModel: PhraseViewModel
//    @Environment(\.editMode) var editMode
//
//    var body: some View {
//        HStack {
//            if !viewModel.savedPhrases.isEmpty {
//                Button(editMode?.wrappedValue == .active ? "Done" : "Select") {
//                    withAnimation {
//                        editMode?.wrappedValue = editMode?.wrappedValue == .active ? .inactive : .active
//                        viewModel.selectedItems.removeAll()
//                    }
//                }
//                if editMode?.wrappedValue == .active {
//                    Button("Delete") {
//                        viewModel.deleteSelectedItems()
//                    }
//                    .foregroundColor(.red)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    ToolbarView(viewModel: PhraseViewModel())
//}
