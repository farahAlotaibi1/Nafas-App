//
//  helping.swift
//  Home
//
//  Created by Lujain on 21/08/1447 AH.
//

import SwiftUI

struct TipItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct helpingView: View {
    @Environment(\.dismiss) private var dismiss
    // مصفوفة تحتوي على البيانات الثلاثة المطلوبة
    let tips = [
        TipItem(title: "اشرب ماء الآن", description: "شرب الماء يقلل إحساس\nالرغبة مؤقتًا"),
        TipItem(title: "التثبيت", description: "عد أشياء حولك و٣ أشياء مربعة قريبة منك"),
        TipItem(title: "تغيير إحساس الفم", description: "جرب شيء بارد أو علكة")
    ]
    
    @State private var currentPage = 0
    
    var body: some View {
        ZStack {
            // 1. الخلفية الثابتة
            Image("background_img") // تأكد من وجود الصورة في Assets
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                // --- 2. الهيدر (السهم المحدث ليكون مطابقاً تماماً) ---
              
                
                Spacer()
                
                // 3. العنوان الثابت فوق البوكس
                Text("نصائح فورية")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 58/255, green: 86/255, blue: 142/255))
                    .padding(.bottom, 10)
                
                // 4. الجزء المتحرك (البوكسات)
                TabView(selection: $currentPage) {
                    ForEach(0..<tips.count, id: \.self) { index in
                        VStack(spacing: 15) {
                            Text(tips[index].title)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 58/255, green: 86/255, blue: 142/255))
                            
                            Text(tips[index].description)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 90/255, green: 110/255, blue: 150/255))
                                .lineSpacing(4)
                        }
                        .frame(width: 280, height: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                                )
                        )
                        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                        .tag(index)
                    }
                }
                .frame(height: 250)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                // 5. نقاط التقدم المخصصة
                HStack(spacing: 8) {
                    ForEach(0..<tips.count, id: \.self) { index in
                        Circle()
                            .fill(currentPage == index ? Color(red: 58/255, green: 86/255, blue: 142/255) : Color.gray.opacity(0.4))
                            .frame(width: 8, height: 8)
                            .animation(.spring(), value: currentPage)
                    }
                }
                .padding(.bottom, 30)
                
                // 6. الأزرار السفلية الثابتة
                HStack(spacing: 20) {
                    actionButton(title: "نجحت في\nتجاوز الرغبة")
                    actionButton(title: "لم أنجح في\nتجاوز الرغبة")
                }
                .padding(.bottom, 40)
                
                Spacer()
            }
        }
    }
    
    func actionButton(title: String) -> some View {
        Button(action: {
            // Action here
        }) {
            Text(title)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: 150, height: 55)
                .background(Color(red: 58/255, green: 86/255, blue: 142/255))
                .cornerRadius(30)
        }
    }
}

#Preview {
    helpingView()
}
