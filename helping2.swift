//
//  helping2.swift
//  Home
//
//  Created by Lujain on 21/08/1447 AH.
//
import SwiftUI

struct GroundingItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct GroundingView: View {
    @Environment(\.dismiss) private var dismiss

    let groundingTips = [
        GroundingItem(title: "إشغال اليد", description: "أمسك قلم، فنجال، أو اعصر يدك"),
        GroundingItem(title: "ارسم خطوط عشوائية", description: "مو لازم فن بس حركة مستمرة"),
        GroundingItem(title: "تتبع حدود يدك بإصابعك", description: "امش حول شكل يدك ببطء")
    ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            // 1. الخلفية الثابتة
            Image("background_img")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                // 2. الهيدر (السهم العلوي بنفس مكان كود الإعدادات)
             

                Spacer()
                
                // 3. عنوان البوكس (التشتيت) - مكانه الآن فوق البوكس مباشرة
                Text("التشتيت")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(Color(red: 0.20, green: 0.30, blue: 0.55))
                    .padding(.bottom, 10)

                // 4. منطقة الكروت القابلة للسحب (TabView)
                TabView(selection: $currentIndex) {
                    ForEach(0..<groundingTips.count, id: \.self) { index in
                        VStack(spacing: 12) {
                            Text(groundingTips[index].title)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.25, green: 0.35, blue: 0.60))
                            
                            Text(groundingTips[index].description)
                                .font(.system(size: 16))
                                .foregroundColor(Color(red: 0.35, green: 0.45, blue: 0.65))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
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
                .frame(height: 220)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                // 5. مؤشر النقاط السفلي للبوكس
                HStack(spacing: 8) {
                    ForEach(0..<groundingTips.count, id: \.self) { index in
                        Circle()
                            .fill(currentIndex == index ? Color(red: 0.25, green: 0.35, blue: 0.60) : Color.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                            .animation(.easeInOut, value: currentIndex)
                    }
                }
                .padding(.top, 5)
                
                Spacer()
                
                // 6. الأزرار السفلية الثابتة في الشاشة
                HStack(spacing: 20) {
                    bottomButton(title: "نجحت في\nتجاوز الرغبة")
                    bottomButton(title: "لم أنجح في\nتجاوز الرغبة")
                }
                .padding(.bottom, 50)
            }
        }
    }
    
    // تصميم الأزرار السفلية
    func bottomButton(title: String) -> some View {
        Button(action: {
            // Action
        }) {
            Text(title)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: 155, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(red: 0.20, green: 0.30, blue: 0.55))
                )
        }
    }
}

#Preview {
    GroundingView()
}

