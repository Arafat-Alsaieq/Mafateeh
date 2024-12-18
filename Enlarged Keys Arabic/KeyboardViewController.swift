import SwiftUI

struct KeyboardView: View {
    // Define rows of Arabic keys
    let rows = [
        ["ا", "ب", "ت", "ث", "ج", "ح", "خ"],
        ["د", "ذ", "ر", "ز", "س", "ش", "ص"],
        ["ض", "ط", "ظ", "ع", "غ", "ف", "ق"],
        ["ك", "ل", "م", "ن", "ه", "و", "ي"],
        ["مسافة", "حذف"]
    ]
    
    // Closure to handle key taps
    var keyTapped: (String) -> Void = { key in
        print("تم الضغط على المفتاح: \(key)")
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: 10) {
                    ForEach(rows[rowIndex], id: \.self) { key in
                        KeyButton(label: key) {
                            keyTapped(key)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}

struct KeyButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(8)
                .shadow(radius: 2)
        }
    }
}

// Preview
struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView { key in
            print("تم الضغط على المفتاح: \(key)")
        }
        .previewLayout(.sizeThatFits)
    }
}
