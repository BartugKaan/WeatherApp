//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Bartuğ Kaan Çelebi on 15.02.2024.
//

import SwiftUI

struct WeatherView: View {
  var weather: ResponseBody
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
