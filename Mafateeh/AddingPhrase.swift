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
            // Button to open the sheet
            Button("ADD PHRASE") {
                showSheet.toggle()
            }
            .padding()

            // Display saved phrases in a List
            List(savedPhrases, id: \.self) { phrase in
                Text(phrase)
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                HStack {
                    Spacer()
                    // Save button
                    Button("Save") {
                        if !newPhrase.isEmpty {
                            savedPhrases.append(newPhrase) // Save new phrase
                            newPhrase = "" // Clear text field
                            showSheet = false // Close the sheet
                        }
                    }
                    .padding()
                    .disabled(newPhrase.isEmpty) // Disable button if text is empty
                }

                // Enlarged text box using TextEditor
                TextEditor(text: $newPhrase)
                    .frame(width: 356, height: 199) // Specify desired size
                    .cornerRadius(10) // Rounded corners for style
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1) // Border for clarity
                    )
                    .padding()

                Spacer()
            }
            .presentationDetents([.height(400), .medium, .large]) // Customizable detents
        }
        .padding()
    }
}

struct AddingPhrase_Previews: PreviewProvider {
    static var previews: some View {
        AddingPhrase()
    }
}
