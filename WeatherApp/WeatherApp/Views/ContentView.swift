//
//  ContentView.swift
//  WeatherApp
//
//  Created by Bartuğ Kaan Çelebi on 15.02.2024.
//

import SwiftUI

struct ContentView: View {
  @StateObject var locationMananger = LocationManager()
  var weatherManager = WeatherManager()
  @State var weather: ResponseBody?
  
  var body: some View {
    VStack {
      
      if let location = locationMananger.location{
        if let weather = weather{
          WeatherView(weather: weather)
        } else{
          LoadingView()
            .task {
              do{
                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
              }
              catch{
                print("Error while getting weather: \(error)")
              }
            }
        }
      } else {
        if locationMananger.isLoading{
          LoadingView()
        } else {
          WelcomeView()
            .environmentObject(locationMananger)
        }
      }
    }
    .background(Color(hue: 0.688, saturation: 1.0, brightness: 0.712))
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
  }
}

#Preview {
  ContentView()
}
