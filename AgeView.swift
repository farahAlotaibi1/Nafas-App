//
//  AgeView.swift
//  Home
//
//  Created by Lujain on 22/08/1447 AH.
//
import SwiftUI

struct AgeView: View {
    @State private var day = ""
    @State private var month = ""
    @State private var year = ""
    @State private var name = ""
    
    private var isFormComplete: Bool {
        !name.isEmpty && !day.isEmpty && !month.isEmpty && !year.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background_img")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    LungsCarouselView()
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("تاريخ الميلاد")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 12) {
                            TextField("DD", text: $day)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .frame(width: 64, height: 48)
                                .padding(.horizontal, 8)
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            
                            TextField("MM", text: $month)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .frame(width: 64, height: 48)
                                .padding(.horizontal, 8)
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            
                            TextField("YYYY", text: $year)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .frame(width: 96, height: 48)
                                .padding(.horizontal, 8)
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        }
                    }
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("الاسم")
                            .font(.headline)
                            .multilineTextAlignment(.center)

                        TextField("مثلاً: ناصر", text: $name)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled(false)
                            .multilineTextAlignment(.center)
                            .frame(width: 220, height: 48)
                            .padding(.horizontal, 12)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                    
                    NavigationLink {
                        SmokingDurationView()
                    } label: {
                        Text("التالي")
                            .frame(width: 200, height: 50)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(red: 0.20, green: 0.30, blue: 0.55))
                            )
                    }
                    .disabled(!isFormComplete)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
        }
    }
}

