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
    ZStack(alignment: .leading){
      VStack{
        VStack(alignment: .leading, spacing: 5){
          Text("\(weather.name)")
            .bold().font(.title)
          Text("Today, \(Date().formatted(.dateTime.day().month().year().hour().minute()))")
            .fontWeight(.light)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        Spacer()
        
        VStack{
          HStack{
            VStack(spacing:20){
              Image(systemName: "sun.max.fill")
                .font(.system(size: 40))
              
              Text(weather.weather[0].main)
            }
            .frame(width: 150, alignment: .leading)
            
            Spacer()
            
            Text(weather.main.feelsLike.rounDouble() + "°")
              .font(.system(size: 100))
              .fontWeight(.bold)
              .padding()
          }
          Spacer()
            .frame(height: 80)
          
          AsyncImage(url: URL(string: "https://www.freeiconspng.com/uploads/city-town-cityskyline-png-14.png")){ image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width:350, height: 150)
          } placeholder: {
            ProgressView()
          }
          Spacer()
          
        }
        .frame(maxWidth: .infinity)
        
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      
      VStack{
        Spacer()
        VStack(alignment: .leading, spacing: 20){
          Text("Weather Noew")
            .bold().padding(.bottom)
          
          HStack{
            WeatherRow(logo: "thermometer", name: "Min Temp", value: weather.main.tempMin.rounDouble() + "°" )
            Spacer()
            WeatherRow(logo: "thermometer", name: "Max Temp", value: weather.main.tempMax.rounDouble() + "°" )
          }
          HStack{
            WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.rounDouble() + "m/s" )
            Spacer()
            WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.rounDouble() + "%" )
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.bottom, 20)
        .foregroundStyle(Color(hue: 0.688, saturation: 1.0, brightness: 0.712))
        .background(.white)
        .cornerRadius(20, corners: [.topLeft,.topRight])
      }
      
    }
    .ignoresSafeArea(edges:.bottom)
    .background(Color(hue: 0.688, saturation: 1.0, brightness: 0.712))
    .preferredColorScheme(.dark)
  }
}

#Preview {
  WeatherView(weather: previewWeather)
}
