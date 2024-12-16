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
                    .disabled(newPhrase.isEmpty) // Disable the button if no text
                }
                
                // text field
                TextField("Enter your phrase...", text: $newPhrase)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
            }
            .presentationDetents([.height(200), .medium, .large])
        }
        .padding()
    }
}

struct AddingPhrase_Previews: PreviewProvider {
    static var previews: some View {
        AddingPhrase()
    }
}
