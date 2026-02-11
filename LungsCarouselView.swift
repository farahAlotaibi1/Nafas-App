//
//  LungsCarouselView.swift
//  Home
//
//  Created by Lujain on 22/08/1447 AH.
//
import SwiftUI
internal import Combine

struct LungsCarouselView: View {
    private let images = ["lungs", "lungs2", "lungs3"]
    @State private var currentIndex = 0

    let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()

    var body: some View {
        Image(images[currentIndex])
            .resizable()
            .scaledToFit()
            .frame(height: 140)
            .onReceive(timer) { _ in
                withAnimation(.easeInOut(duration: 0.6)) {
                    currentIndex = (currentIndex + 1) % images.count
                }
            }
    }
}
