//
//  SmokingDurationView.swift
//  Home
//
//  Created by Lujain on 22/08/1447 AH.
//

import SwiftUI

struct SmokingDurationView: View {
    @State private var selectedOption: Int? = nil
    
    private var isFormComplete: Bool {
        selectedOption != nil
    }

    var body: some View {
        ZStack {
            Image("background_img")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 24) {

                LungsCarouselView()

                Text("كم مدة تدخينك إجمالاً؟")
                    .font(.title2)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 16) {
                    optionRow(text: "أقل من سنة", tag: 1)
                    optionRow(text: "من سنة إلى خمس سنوات", tag: 2)
                    optionRow(text: "أكثر من خمس سنوات", tag: 3)
                }

                NavigationLink {
                    SmokingTypeView()
                } label: {
                    Text("التالي")
                        .frame(width: 200, height: 50) // عرض ثابت
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color(red: 0.20, green: 0.30, blue: 0.55))
                        )
                }
                .disabled(!isFormComplete)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.clear)
            }
        }
    }

    func optionRow(text: String, tag: Int) -> some View {
        Button {
            selectedOption = tag
        } label: {
            HStack {
                Image(systemName: selectedOption == tag
                      ? "checkmark.square.fill"
                      : "square")
                Text(text)
            }
            .font(.body)
            .foregroundColor(.black)
        }
    }
}

