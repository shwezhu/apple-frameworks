//
//  ContentView.swift
//  weather
//
//  Created by David Zhu on 2024-05-29.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Halifax, CA")
                MainWeatherStatusView(imageName: "sun.snow.fill", temperature: -2)
                HStack(spacing: 20) {
                    WeatherDayView(imageName: "snow", dayOfWeek: "TUE", temperature: -3)
                    WeatherDayView(imageName: "sun.rain.fill", dayOfWeek: "WED", temperature: -5)
                    WeatherDayView(imageName: "sun.max.fill", dayOfWeek: "THU", temperature: -2)
                    WeatherDayView(imageName: "wind", dayOfWeek: "FRI", temperature: 0)
                }
                Spacer() // Fill the remaining space in a VStack, pushing views above to the top.
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time")
                }
                Spacer() // 想象成弹簧卡在中间
            }
        }
    }
}

struct WeatherDayView: View {
    var imageName: String
    var dayOfWeek: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundStyle(.white)
                .padding()
            VStack(spacing: 10) {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 26, weight: .medium))
                    .foregroundStyle(.white)
            }
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]),
//                       startPoint:.top,
//                       endPoint: .bottom)
//            .edgesIgnoringSafeArea(.all)
        ContainerRelativeShape()
            .fill(.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            // Every modifier wraps the previous view into another view.
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) { // spacing: space between views in VStack
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable() // 让图像可以调整大小
                .aspectRatio(contentMode: .fit) // 缩放模式
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    var title: String = "button"
    var texColor: Color = .blue
    var backgroundColor: Color = .white
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(texColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}

#Preview {
    ContentView()
}
