//
//  SplashView.swift
//  Home
//
//  Created by Lujain on 21/08/1447 AH.
//
import SwiftUI

struct SplashView: View {

    @State private var goNext = false
    @State private var isPulsing = false

    var body: some View {

        ZStack {

            // الخلفية
            Image("background_img")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {

                Text("ابدأ اليوم")
                    .font(.system(size: 36, weight: .medium))

                // صورة الرئة — نبض ثابت بالمكان
                Image("lungs")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .scaleEffect(isPulsing ? 1.05 : 1.0)
                    .animation(
                        .easeInOut(duration: 0.9)
                            .repeatForever(autoreverses: true),
                        value: isPulsing
                    )

                Text("صحتك تستحق")
                    .font(.system(size: 40))
            }

            // الانتقال
            if goNext {
                AgeView()
            }
        }
        .onAppear {

            // تشغيل النبض
            isPulsing = true

            // الانتقال بعد ثانيتين
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                goNext = true
            }
        }
    }
}
