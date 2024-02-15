//
//  ContentView.swift
//  WeatherApp
//
//  Created by Bartuğ Kaan Çelebi on 15.02.2024.
//

import SwiftUI

struct ContentView: View {
  @StateObject var locationMananger = LocationManager()
  var body: some View {
    VStack {
      
      if let location = locationMananger.location{
        Text("Your cordinates are: \(location.longitude), \(location.latitude)")
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
