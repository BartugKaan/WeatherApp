//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Bartuğ Kaan Çelebi on 15.02.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
  @EnvironmentObject var locationManager: LocationManager
  
    var body: some View {
      VStack {
        VStack(spacing:20){
          Text("Welcome to the Weather App")
            .bold().font(.title)
          
          Text("Please share your current location to get the weather in your area")
            .padding()
        }
        .multilineTextAlignment(.center)
        .padding()
        
        LocationButton(.shareCurrentLocation) {
          locationManager.requestLocation()
        }
        .clipShape(.capsule)
        .symbolVariant(.fill)
        .foregroundStyle(.white)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
