import SwiftUI

struct LungStatusView: View {
    @Environment(\.dismiss) private var dismiss

    private let mainBlue = Color(red: 0.18, green: 0.22, blue: 0.50)

    struct LungSection: View {
        var imageName: String
        var title: String
        var subtitle: String
        var titleColor: Color

        var body: some View {
            VStack(spacing: 8) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 170)
                    .opacity(0.95)

                Text(title)
                    .font(.system(size: 21, weight: .bold))
                    .foregroundColor(titleColor)

                Text(subtitle)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.black.opacity(0.65))
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
    }

    var body: some View {
        ZStack {
            // Background fills the entire screen
            Image("background_img")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Content
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    LungSection(
                        imageName: "lungs",
                        title: "استقرار",
                        subtitle: "جسمك يتنفس براحة",
                        titleColor: mainBlue
                    )

                    LungSection(
                        imageName: "lungs2",
                        title: "تحسّن",
                        subtitle: "التغيير بدأ",
                        titleColor: mainBlue
                    )

                    LungSection(
                        imageName: "lungs3",
                        title: "انتكاس",
                        subtitle: "التعثر جزء من الرحلة",
                        titleColor: mainBlue
                    )
                }
                .padding(.top, 25)
                .padding(.bottom, 80)
                .padding(.horizontal, 25)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LungStatusView()
}

