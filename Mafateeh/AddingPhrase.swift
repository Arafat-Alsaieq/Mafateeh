//
//  AddingPhrase.swift
//  Mafateeh
//
//  Created by Lujain sh on 16/12/2024.
//

import SwiftUI

struct AddingPhrase: View {
    @State private var showSheet = false
    @State private var newPhrase: String = "" // To store the user input
    @State private var savedPhrases: [String] = [] // To store the saved phrases

    var body: some View {
        VStack {
            Button("ADD PHRASE") {
                showSheet.toggle()
            }
            .padding()

            List(savedPhrases, id: \.self) { phrase in
                Text(phrase)
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                HStack {
                    Spacer()
                   
                    Button("Save") {
                        if !newPhrase.isEmpty {
                            savedPhrases.append(newPhrase)
                            newPhrase = ""
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
                            .stroke(Color.gray, lineWidth: 0.30)
                    )
                    .padding()

                Spacer()
            }
            .presentationDetents([.height(400), .medium, .large])        }
        .padding()
    }
}

struct AddingPhrase_Previews: PreviewProvider {
    static var previews: some View {
        AddingPhrase()
    }
}
