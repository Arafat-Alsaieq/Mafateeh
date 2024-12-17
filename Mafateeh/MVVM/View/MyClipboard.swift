//
//  MyClipboard.swift
//  Mafateeh
//
//  Created by Maryam Amer Bin Siddique on 15/06/1446 AH.
//

import SwiftUI

struct MyClipboard: View {
    @State private var savedPhrases: [String] = []
    @State private var showSheet: Bool = false
    @State private var newPhrase: String = ""
    @State private var editingIndex: Int? = nil
    @State private var selectedItems: Set<String> = []
    
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("BG")
                    .edgesIgnoringSafeArea(.all)
                
                if savedPhrases.isEmpty {
                    VStack {
                        Spacer()
                        VStack(spacing: 16) {
                            Text("💬")
                                .font(.system(size: 90))
                                .offset(x: -5, y: 30)
                            // !! haven't flipped text balloon horizontally !!
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
                            newPhrase = ""
                            editingIndex = nil
                            showSheet = true
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
                } else {
                    List(selection: $selectedItems) {
                        ForEach(savedPhrases, id: \.self) { phrase in
                            Text(phrase)
                                .onTapGesture {
                                    if editMode?.wrappedValue == .inactive {
                                        newPhrase = phrase
                                        editingIndex = savedPhrases.firstIndex(of: phrase)
                                        showSheet = true
                                    }
//                                    newPhrase = savedPhrases[index]
//                                    editingIndex = index
//                                    showSheet = true
                                }
                        }
                    }
                    .environment(\.editMode, editMode)
                    .listStyle(PlainListStyle())
                    .padding(.top, 40)
                    .padding(.horizontal, 20)

                    
                    Spacer()
                    
                    if editMode?.wrappedValue != .active {
                        Button(action: {
                            newPhrase = ""
                            editingIndex = nil
                            showSheet = true
                        }) {
                            Text("Add Phrase")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color("Button"))
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .padding(.horizontal, 20)
                        }
                        .padding(.top, 610)
                    }
                }
            }
            .navigationBarBackButtonHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("My Clipboard")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.top, 30)
                    }
                if !savedPhrases.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(editMode?.wrappedValue == .active ? "Done" : "Select") {
                            withAnimation {
                                editMode?.wrappedValue = editMode?.wrappedValue == .active ? .inactive : .active
                                selectedItems.removeAll()
                            }
                        }
                    }

                    if editMode?.wrappedValue == .active {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Select All") {
                                if selectedItems.count == savedPhrases.count {
                                    selectedItems.removeAll()
                                } else {
                                    selectedItems = Set(savedPhrases)
                                }
                            }
                        }
                    }
                }
                
                if editMode?.wrappedValue == .active && !selectedItems.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete") {
                            deleteSelectedItems()
                        }
                        .foregroundColor(.red)
                        .padding(.bottom, 50)
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                AddPhraseSheet(
                    newPhrase: $newPhrase,
                    savedPhrases: $savedPhrases,
                    showSheet: $showSheet,
                    editingIndex: $editingIndex
                )
            }
        }
    }
    
    func deleteSelectedItems() {
        savedPhrases.removeAll { selectedItems.contains($0) }
        selectedItems.removeAll()
        withAnimation {
            editMode?.wrappedValue = .inactive
        }
    }
}

struct AddPhraseSheet: View {
    @Binding var newPhrase: String
    @Binding var savedPhrases : [String]
    @Binding var showSheet: Bool
    @Binding var editingIndex: Int?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showSheet = false
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .medium))
                        .padding()
                }
                Spacer()
                Button("Save") {
                    if !newPhrase.isEmpty {
                        if let index = editingIndex {
                            // Update the existing phrase
                            savedPhrases[index] = newPhrase
                        } else {
                            // Add a new phrase
                            savedPhrases.append(newPhrase)
                        }
                        newPhrase = ""
                        editingIndex = nil
                        showSheet = false
                    }
                }
                .padding()
                .disabled(newPhrase.isEmpty)
            }
            TextEditor(text: $newPhrase)
                .frame(width: 356, height: 199)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.20)
                )
                .padding()

            Spacer()
        }
    }
    
}



#Preview {
    MyClipboard()
}
