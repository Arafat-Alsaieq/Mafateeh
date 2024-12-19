////
////  PhraseViewModel.swift
////  Mafateeh
////
////  Created by Maryam Amer Bin Siddique on 17/06/1446 AH.
////
//
//import SwiftUI
//
//class PhraseViewModel: ObservableObject {
//    @Published var savedPhrases: [String] = []
//    @Published var newPhrase: String = ""
//    @Published var editingIndex: Int? = nil
//    @Published var selectedItems: Set<String> = []
//
//    func addPhrase() {
//        if !newPhrase.isEmpty {
//            if let index = editingIndex {
//                savedPhrases[index] = newPhrase
//            } else {
//                savedPhrases.append(newPhrase)
//            }
//            clearInput()
//        }
//    }
//
//    func deleteSelectedItems() {
//        savedPhrases.removeAll { selectedItems.contains($0) }
//        selectedItems.removeAll()
//    }
//
//    private func clearInput() {
//        newPhrase = ""
//        editingIndex = nil
//    }
//}
