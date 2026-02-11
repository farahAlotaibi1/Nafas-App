//
//  SettingsView.swift
//  Home
//
//  Created by Lujain on 20/08/1447 AH.
//
import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss   // مهم للرجوع للصفحة السابقة

    @AppStorage("user_name") private var name = ""
    @AppStorage("user_age") private var age = ""
    @AppStorage("user_weight") private var weight = ""
    @AppStorage("selected_daily_cigarettes") private var selectedDailyCigarettes: String = ""
    @AppStorage("selected_period") private var selectedPeriod: String = ""

    var lungImageName: String {
        switch selectedDailyCigarettes {
        case "١-٣": return "lungs"
        case "٤-١٠": return "lungs2"
        case "١٠+": return "lungs3"
        default: return "lungs1"
        }
    }

    var lungTitle: String {
        switch selectedDailyCigarettes {
        case "١-٣": return "استقرار"
        case "٤-١٠": return "تحسّن"
        case "١٠+": return "انتكاس"
        default: return "استقرار"
        }
    }

    var lungSubtitle: String {
        switch selectedDailyCigarettes {
        case "١-٣": return "جسمك يتنفس براحة"
        case "٤-١٠": return "التغيير بدأ"
        case "١٠+": return "التعثّر جزء من الرحلة"
        default: return "جسمك يتنفس براحة"
        }
    }

    var body: some View {
        ZStack {
            Image("background_img")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Header
                HStack {
                    Text("الإعدادات")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(hex: "2C3E50"))
                        .frame(maxWidth: .infinity, alignment: .center)

                    Spacer()

               
                }
                .padding()

                ScrollView {
                    VStack(spacing: 25) {
                        // Lung Status Section
                        HStack(spacing: 15) {
                            Spacer()
                            VStack(alignment: .trailing, spacing: 4) {
                                Text(lungTitle)
                                    .font(.system(size: 20, weight: .bold))
                                Text(lungSubtitle)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }

                            Image(lungImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        }

                        inputSection(title: "الاسم", placeholder: "ناصر", text: $name)
                        inputSection(title: "العمر", placeholder: "٢٥", text: $age)
                        

                        VStack(alignment: .trailing, spacing: 12) {
                            Text("كم مرة تدخن يومياً؟")
                                .font(.system(size: 16, weight: .bold))
                            HStack {
                                chipButton(title: "١٠+", selection: $selectedDailyCigarettes)
                                chipButton(title: "٤-١٠", selection: $selectedDailyCigarettes)
                                chipButton(title: "١-٣", selection: $selectedDailyCigarettes)
                            }
                        }

                        VStack(alignment: .trailing, spacing: 12) {
                            Text("منذ متى تدخن؟")
                                .font(.system(size: 16, weight: .bold))
                            HStack {
                                chipButton(title: "فترة طويلة", selection: $selectedPeriod)
                                chipButton(title: "فترة متوسطة", selection: $selectedPeriod)
                                chipButton(title: "فترة قصيرة", selection: $selectedPeriod)
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                }
            }
        }
    }

    func inputSection(title: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
            TextField(placeholder, text: text)
                .multilineTextAlignment(.trailing)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
        }
    }

    func chipButton(title: String, selection: Binding<String>) -> some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(selection.wrappedValue == title ? Color(red: 0.18, green: 0.22, blue: 0.50) : Color.white.opacity(0.8))
            .foregroundColor(selection.wrappedValue == title ? .white : .black)
            .cornerRadius(10)
            .onTapGesture {
                selection.wrappedValue = title
            }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        self.init(
            red: Double((rgb >> 16) & 0xFF) / 255,
            green: Double((rgb >> 8) & 0xFF) / 255,
            blue: Double(rgb & 0xFF) / 255
        )
    }
}

#Preview {
    SettingsView()
}
