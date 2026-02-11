//
//  ContentView.swift
//  Home
//
//  Created by Lujain on 20/08/1447 AH.
//

import SwiftUI

// MARK: - DayBox
enum DayStatus {
    case success
    case failed
    case normal
}

struct DayBox: View {
    let day: Int
    let status: DayStatus

    var body: some View {
        Text("\(day)")
            .frame(width: 36, height: 36)
            .background(backgroundColor)
            .cornerRadius(8)
            .foregroundColor(.white)
    }

    var backgroundColor: Color {
        switch status {
        case .success:
            return .blue
        case .failed:
            return .blue
        case .normal:
            return Color.gray.opacity(0.3)
        }
    }
}

// MARK: - StatView
struct StatView: View {
    let icon: String
    let value: String
    let title: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(color)

            Text(value)
                .font(.title3)
                .fontWeight(.semibold)

            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - HomeView
struct HomeView: View {

    @EnvironmentObject var router: NavigationRouter

    @State private var startDays = 33
    @State private var moneySaved = 60
    @State private var nicotineLevel = 2

    @State private var path = NavigationPath()

    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 7)

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                // Background
                Image("background_img")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 18) {
                    
                    // Lungs Image (taps to lungs page)
                    NavigationLink(destination: LungStatusView()) {
                        Image("lungs_img")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    
                    // Stats Card
                    statsCard
                    
                    // Calendar
                    calendarSection
                    
                    Spacer(minLength: 10)

                    // Action Button: Navigate to pagView
                    Spacer(minLength: 10)

                    NavigationLink(destination: pagView()) {
                        Text("أشعر بالرغبة بالتدخين")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 56)
                            .frame(maxWidth: 320)
                            .background(Color(red: 0.18, green: 0.22, blue: 0.50))
                            .cornerRadius(28)
                            .shadow(color: .blue.opacity(0.3), radius: 8, y: 4)
                    }

                    Spacer(minLength: 60)
                }}
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                            .frame(width: 42, height: 42)
                            .background(
                                Circle()
                                    .fill(.white.opacity(0.35))
                            )
                            .shadow(color: .black.opacity(0.1), radius: 6, y: 3)
                    }
                }
            }
        }
    }

    // MARK: - Stats Card
    private var statsCard: some View {
        HStack(spacing: 28) {
            StatView(
                icon: "dollarsign.circle.fill",
                value: "\(moneySaved)%",
                title: "وفّرت",
                color: Color(red: 0.55, green: 0.85, blue: 0.65)
            )

            StatView(
                icon: "calendar",
                value: "\(startDays)",
                title: "يوم",
                color: .blue
            )

            StatView(
                icon: "waveform.path.ecg",
                value: "\(nicotineLevel)",
                title: "نيكوتين",
                color: .teal
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.25))
        )
        .padding(.horizontal)
    }

    // MARK: - Calendar Section
    private var calendarSection: some View {
        VStack(spacing: 12) {

            HStack {
                Text("Feb")
                    .font(.headline)

                Spacer()

                Text("2026")
                    .font(.headline)
            }

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(1...31, id: \.self) { day in
                    DayBox(
                        day: day,
                        status: day >= 9 && day <= 13 ? .success : .normal
                    )
                }
            }
        }
        .padding()
        .frame(maxWidth: 340)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.25))
        )
    }
}

