//
//  breathingView.swift
//  Home
//
//  Created by Lujain on 21/08/1447 AH.
//

import SwiftUI

struct BreathingView: View {
    let mainColor = Color(red: 0.12, green: 0.24, blue: 0.45)
    @State private var rotate = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            // الخلفية
            Image("background_img")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer(minLength: 0)

                // الدائرة المتنفسة
                ZStack {
                    // الدائرة الرمادية
                    Circle()
                        .stroke(Color.gray.opacity(0.25), lineWidth: 22)
                        .frame(width: 230, height: 230)

                    // الجزء الأزرق المتحرك
                    Circle()
                        .trim(from: 0, to: 0.22)
                        .stroke(
                            mainColor,
                            style: StrokeStyle(lineWidth: 22, lineCap: .round)
                        )
                        .frame(width: 230, height: 230)
                        .rotationEffect(.degrees(rotate ? 360 : 0))
                        .animation(
                            .linear(duration: 4)
                                .repeatForever(autoreverses: false),
                            value: rotate
                        )

                    // النص في المنتصف
                    VStack(spacing: 8) {
                        Text("خذ نفس عميق..")
                            .font(.title)
                            .bold()
                            .foregroundColor(mainColor)

                        Text("شهيق .. زفير")
                            .foregroundColor(mainColor)
                    }
                }
                .onAppear { rotate = true }

                Spacer()

                // الأزرار
                HStack(spacing: 20) {
                    Button("نجحت في تجاوز الرغبة") {
                        // TODO: Handle success action
                    }
                    .padding()
                    .frame(width: 170)
                    .background(mainColor)
                    .foregroundColor(.white)
                    .clipShape(Capsule())

                    Button("لم أنجح في تجاوز الرغبة") {
                        // TODO: Handle failure action
                    }
                    .padding()
                    .frame(width: 170)
                    .background(mainColor)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(false)
        .navigationTitle("تمارين التنفس")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BreathingView()
}

