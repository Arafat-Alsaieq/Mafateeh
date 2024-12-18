import SwiftUI

struct KeyboardView: View {
    // Define rows of keys
    let rows = [
        ["A", "B", "C", "D", "E"],
        ["F", "G", "H", "I", "J"],
        ["K", "L", "M", "N", "O"],
        ["P", "Q", "R", "S", "T"],
        ["Space", "Delete"]
    ]
    
    // Closure to handle key taps
    var keyTapped: (String) -> Void = { key in
        print("Key tapped: \(key)")
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
            print("Key tapped: \(key)")
        }
        .previewLayout(.sizeThatFits)
    }
}


