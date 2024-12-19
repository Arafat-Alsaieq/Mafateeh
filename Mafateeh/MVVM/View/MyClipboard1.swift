////
////  MyClipboard1.swift
////  Mafateeh
////
////  Created by Maryam Amer Bin Siddique on 17/06/1446 AH.
////
//
//import SwiftUI
//
//struct MyClipboard1: View {
//    @StateObject private var viewModel = PhraseViewModel()
//    @State private var showSheet: Bool = false
//    @Environment(\.editMode) private var editMode
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color("BG").edgesIgnoringSafeArea(.all)
//
//                if viewModel.savedPhrases.isEmpty {
//                    EmptyStateView(showSheet: $showSheet, viewModel: viewModel)
//                } else {
//                    ListView(viewModel: viewModel, showSheet: $showSheet)
//                }
//            }
//            .navigationBarTitle("My Clipboard", displayMode: .inline)
//            .toolbar {
//                ToolbarView(viewModel: viewModel)
//            }
//            .sheet(isPresented: $showSheet) {
//                AddPhraseSheet(viewModel: viewModel, showSheet: $showSheet)
//            }
//        }
//    }
//}
//
//#Preview {
//    MyClipboard1()
//}
