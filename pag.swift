//
//  pag.swift
//  Home
//
//  Created by Lujain on 21/08/1447 AH.
//
import SwiftUI

struct pagView: View {
    @Environment(\.dismiss) private var dismiss
    
    let mainColor = Color(red: 0.12, green: 0.24, blue: 0.45)
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // الخلفية
                Image("background_img")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
               
                // الأزرار
                VStack(spacing: 30) {
                    Spacer()
                    
                    // زر تمارين التنفس → يفتح BreathingView
                    NavigationLink {
                        BreathingView()
                    } label: {
                        MenuButton(title: "تمارين التنفس", imageName: "face", color: mainColor)
                    }
                    
                    NavigationLink {
                        helpingView()
                    } label: {
                        MenuButton(title: "نصائح فورية", imageName: "clock", color: mainColor)
                    }
                    
                    NavigationLink {
                        GroundingView()
                    } label: {
                        MenuButton(title: "التشتيت", imageName: "hand", color: mainColor)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
            }
        }
    }
}

// تصميم الزر الموحد
struct MenuButton: View {
    var title: String
    var imageName: String
    var color: Color
    
    var body: some View {
        ZStack {
            
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            HStack {
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
                    .padding(.trailing, 15)
            }
        }
        .frame(height: 75)
        .background(color)
        .cornerRadius(40)
        .shadow(radius: 5)
    }
}


#Preview {
    pagView()
}

