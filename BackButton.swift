import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: { dismiss() }) {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.85))
                    .frame(width: 36, height: 36)
                    .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.black.opacity(0.75))
                    .offset(x: -1)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        HStack {
            Spacer()
            BackButton()
                .padding(.trailing, 12)
                .padding(.top, 8)
        }
    }
}
