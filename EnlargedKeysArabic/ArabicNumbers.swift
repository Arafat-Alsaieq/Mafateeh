//
//  ArabicNumbers.swift
//  EnlargedKeysArabic
//
//  Created by Maryam Amer Bin Siddique on 30/06/1446 AH.
//

import SwiftUI

struct ArabicNumbers: View {
    @State var proxy: UITextDocumentProxy
    @Binding var showKeyboardview: Bool // <-- Fixed binding
    @State private var enlargedKeys: [String] = [] // Enlarged keys
    @State private var showEnlargedKeys = false // Toggle view state
    @State private var showArabicKeyboard = false // NEW STATE to go back to Arabic Keyboard

    // Grouped Keys (Lowercase)
    let groupNumber: [(String, [String])] = [
        ("1     2     3     4     5                        6     7    8     9     0", ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]),
    ]

    let groupSymbol: [(String, [String])] = [
        ("-  /  :  ;  (   )  $", ["-", "/", ":", ";", "(", ")", "$"])
    ]

    let groupSymbo2: [(String, [String])] = [
        ("&   @   “   .   ,   ?   !", ["&", "@", "“", ".", ",", "?", "!"])
    ]

    var body: some View {
        if showArabicKeyboard { // If Arabic keyboard button is pressed
            Keyboardview(proxy: proxy, showKeyboardview: $showArabicKeyboard, showArabicKeyboard: $showArabicKeyboard) // Switch back to Arabic Keyboard
        } else if showEnlargedKeys {
            // Render the Enlarged Keys Page
            EnlargedKeysView(proxy: proxy, enlargedKeys: $enlargedKeys, showEnlargedKeys: $showEnlargedKeys)

        } else {
            VStack(spacing: 10) {
                VStack(spacing: 10) {
                    // Alphabetic Keyboard View
                    AlphabeticKeyboardView(
                        proxy: proxy,
                        groupNumber: groupNumber,
                        groupSymbol: groupSymbol,
                        groupSymbo2: groupSymbo2,
                        showEnlargedKeys: $showEnlargedKeys,
                        enlargedKeys: $enlargedKeys,
                        showKeyboardview: $showKeyboardview, showArabicKeyboard: $showArabicKeyboard // Pass binding here
                    )
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: Alphabetic Keyboard View
struct AlphabeticKeyboardView: View {
    var proxy: UITextDocumentProxy
    let groupNumber: [(String, [String])]
    let groupSymbol: [(String, [String])]
    let groupSymbo2: [(String, [String])]

    @Binding var showEnlargedKeys: Bool
    @Binding var enlargedKeys: [String]
    @Binding var showKeyboardview: Bool // Fixed Binding
    @Binding var showArabicKeyboard: Bool
                
    var body: some View {
        VStack(spacing: 10) {
            VStack {
                // Numbers Group
                HStack {
                    ForEach(groupNumber, id: \.0) { key, keys in
                        Button(action: {
                            enlargedKeys = keys
                            showEnlargedKeys = true
                        }) {
                            Text(key)
                                .frame(width: 245, height: 108)
                                .font(.system(size: 30))
                                .background(Color(.white))
                                .cornerRadius(8)
                                .foregroundStyle(.black)
                        }
                    }


                // Symbols Group 1
                    ForEach(groupSymbol, id: \.0) { key, keys in
                        Button(action: {
                            enlargedKeys = keys
                            showEnlargedKeys = true
                        }) {
                            Text(key)
                                .frame(width: 104, height: 108)
                                .font(.system(size: 30))
                                .background(Color(.white))
                                .cornerRadius(8)
                                .foregroundStyle(.black)
                        }
                    }
                }

                // Symbols Group 2
                HStack {
                    ForEach(groupSymbo2, id: \.0) { key, keys in
                        Button(action: {
                            enlargedKeys = keys
                            showEnlargedKeys = true
                        }) {
                            Text(key)
                                .frame(width: 290, height: 61)
                                .font(.system(size: 30))
                                .background(Color(.white))
                                .cornerRadius(8)
                                .foregroundStyle(.black)
                        }
                    }
                }

                // Navigation Buttons
                HStack {
                    // Switch back to Arabic Keyboard
                    Button("أ  ب  ج") {
                        showArabicKeyboard = true // Activate Arabic Keyboard
                    }
                    .frame(width: 125, height: 46)
                    .background(Color(.systemGray2))
                    .font(.system(size: 20))
                    .cornerRadius(8)
                    .foregroundStyle(.black)
//                        Keyboardview(proxy: proxy, showKeyboardview: $showKeyboardview)
//                            .navigationBarBackButtonHidden(true)
//                    } label : {
//                        Text("أ  ب  ج")
//                            .frame(width: 125, height: 46)
//                            .background(Color(.systemGray2))
//                            .font(.system(size: 20))
//                            .cornerRadius(8)
//                            .foregroundStyle(.black)
//                    }

                    // Symbols Button
                    Button("#+=") {
                        proxy.insertText("#+=")
                    }
                    .frame(width: 67, height: 46)
                    .background(Color(.systemGray2))
                    .font(.system(size: 20))
                    .cornerRadius(8)
                    .foregroundStyle(.black)

                    // Backspace
                    Button(action: {
                        proxy.deleteBackward()
                    }) {
                        Image(systemName: "delete.left")
                            .frame(width: 72, height: 46)
                            .background(Color(.systemGray2))
                            .font(.system(size: 25))
                            .cornerRadius(8)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.leading, 70)
            }

            // Bottom Row
            HStack {
                Button(action: {}) {
                    Image(systemName: "face.smiling")
                        .frame(width: 56, height: 55)
                        .background(Color(.systemGray2))
                        .font(.system(size: 25))
                        .cornerRadius(8)
                        .foregroundStyle(.black)
                }

                Button("مسافة") {
                    proxy.insertText(" ")
                }
                .frame(maxWidth: .infinity, maxHeight: 56)
                .background(Color(.white))
                .cornerRadius(8)
                .foregroundStyle(.black)

                Button(action: {
                    proxy.insertText("\n")
                }) {
                    Image(systemName: "return.right")
                        .font(.system(size: 25))
                        .foregroundStyle(.black)
                }
                .frame(width: 111, height: 55)
                .background(Color(.systemGray2))
                .cornerRadius(8)
                .padding(.trailing)
            }
            .padding(.bottom, -100)
        }
    }
}
struct EnlargedKeysView: View {
    var proxy: UITextDocumentProxy
    @Binding var enlargedKeys: [String]
    @Binding var showEnlargedKeys: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // السطر الأول: 1، 2، 3، 4
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    ForEach(enlargedKeys.prefix(4), id: \.self) { key in
                        Button(action: {
                            proxy.insertText(key)
                            showEnlargedKeys = false
                        }) {
                            Text(key)
                                .frame(width: 75, height: 75)
                                .background(Color.white)
                                .cornerRadius(8)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                    }
                }
                
                // السطر الثاني: 5، 6، 7
                HStack(spacing: 10) {
                    ForEach(enlargedKeys[4..<7], id: \.self) { key in
                        Button(action: {
                            proxy.insertText(key)
                            showEnlargedKeys = false
                        }) {
                            Text(key)
                                .frame(width: 75, height: 75)
                                .background(Color.white)
                                .cornerRadius(8)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                    }
                }
                
                // السطر الثالث: 8، 9، 0
                HStack(spacing: 10) {
                    ForEach(enlargedKeys[7...], id: \.self) { key in
                        Button(action: {
                            proxy.insertText(key)
                            showEnlargedKeys = false
                        }) {
                            Text(key)
                                .frame(width: 75, height: 75)
                                .background(Color.white)
                                .cornerRadius(8)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            
            VStack (alignment: .center) {
                // زر الرجوع
                Button(action: {
                    showEnlargedKeys = false
                }) {
                    Image(systemName: "arrowshape.turn.up.right")
                        .frame(width: 61, height: 55)
                        .background(Color(.systemGray2))
                        .font(.system(size: 30))
                        .cornerRadius(8)
                        .foregroundColor(.black)
                }
                .padding(.leading, 280)
                .padding(.top, -85)
                
                // زر الحذف
                Button(action: {
                    proxy.deleteBackward()
                }) {
                    Image(systemName: "delete.left")
                        .frame(width: 72, height: 46)
                        .background(Color(.systemGray2))
                        .font(.system(size: 25))
                        .cornerRadius(8)
                        .foregroundColor(.black)
                }
                .padding(.leading, 280)
                .padding(.top, -35)
            }
            // Space Bar Row
            HStack(spacing: 10) {
                Button("space") {
                    proxy.insertText(" ")
                }
                .frame(width: 238, height: 56)
                .background(Color(.white))
                .cornerRadius(8)
                .foregroundStyle(.black)

                // Return Button
                Button("return") {
                    proxy.insertText("\n")
                }
                .frame(width: 112, height: 55)
                .background(Color(.systemGray2))
                .cornerRadius(8)
                .foregroundStyle(.black)
                .padding(.trailing, -5)
           
           }
            .padding(.bottom)
        }
        .padding(.top)
        .padding(.leading)
    }
}
