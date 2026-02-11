//
//  SmokingTypeView.swift
//  Home
//
//  Created by Lujain on 22/08/1447 AH.
//

import SwiftUI

struct SmokingTypeView: View {
    @State private var selectedType: Int? = nil
    @EnvironmentObject var router: NavigationRouter
    @Environment(\.dismiss) private var dismiss
    
    private var isFormComplete: Bool {
        selectedType != nil
    }

    var body: some View {
        ZStack {
            Image("background_img")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 24) {

                LungsCarouselView()

                Text("كم مره تدخن يوميا؟")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                VStack(alignment: .center, spacing: 16) {
                    optionRow(text: "من مره الى مرتين باليوم", tag: 1)
                    optionRow(text: "من ٤ الى ١٠ مرات باليوم", tag: 2)
                    optionRow(text: "اكثر من عشر مرات باليوم", tag: 3)
                }

                NavigationLink {
                    HomeView()
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
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.clear)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal)
        }
    }
    func optionRow(text: String, tag: Int) -> some View {
        Button {
            selectedType = tag
        } label: {
            HStack {
                Image(systemName: selectedType == tag
                      ? "checkmark.square.fill"
                      : "square")
                Text(text)
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

