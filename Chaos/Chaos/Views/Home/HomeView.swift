//
//  HomeView.swift
//  Chaos
//
//  Created by Ali on 11.08.2023.
//

import SwiftUI

struct ButtonData: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let title: String
    let shotTitle: String
}

struct HomeView: View {

    let buttonsData: [ButtonData] = [
            ButtonData(imageName: "car.side", title: "Cars", shotTitle: "cars"),
            ButtonData(imageName: "car.2", title: "Cars by Kolesa.kz", shotTitle: "carsByKolesa"),
            ButtonData(imageName: "cart", title: "Spareparts store", shotTitle: "SparepartsStore" ),
            ButtonData(imageName: "engine.combustion", title: "Spare parts", shotTitle: "SpareParts"),
            ButtonData(imageName: "bus.fill", title: "Commercial", shotTitle: "Commercial"),
            ButtonData(imageName: "wrench.adjustable", title: "Repair and services", shotTitle: "repairAndServices"),
            ButtonData(imageName: "creditcard", title: "Fines and services", shotTitle: "finesAndServices"),
            ButtonData(imageName: "questionmark.bubble", title: "Kolesa Guide", shotTitle: "kolesaGuide")
        ]
        
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    @StateObject var cardData = CardViewModel()
    @StateObject var storyData = StoryViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical){
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 8) {
                                ForEach($storyData.stories) { $bundle in
                                    StoryDesignView(bundle: $bundle)
                                        .environmentObject(storyData)
                                }
                            }
                            .padding(.leading, 2)
                        }
                    }
                    .padding(.bottom, 5)
                    .id(1)
                    
                    
                    LazyVGrid(columns: adaptiveColumns) {
                        ForEach(buttonsData, id: \.self) { buttons in
                            NavigationLink(destination: destinationForButton(buttons), label:  {
                                VStack {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color(.white))
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                           
                                        
                                        VStack(spacing: 10) {
                                            Image(systemName: "\(buttons.imageName)")
                                                .resizable()
                                                .frame(width: 20, height: 14, alignment: .bottom)
                                                .foregroundColor(.blue)
                                            
                                            Text(buttons.title)
                                                .frame(width: 86)
                                                .font(.system(size: 10, weight: .regular))
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                }
                            })
                            .padding(.top, -8)
                        }
                    }
                    .padding(.leading, 6)
                    .padding(.trailing, 6)
                    
                    
                    VStack {
//                        ForEach(1...20, id: \.self) { index in
//                            CardView()
//                                .environmentObject(cardData)
//                        }
                        ForEach($cardData.cardsAd) { $bundle in
                            CardView(bundle: $bundle)
                                .environmentObject(storyData)
                        }
                    }
                }
            }
            .navigationBarItems(
                leading: Image("logoKolesa")
                            .resizable()
                            .frame(width: 100, height: 22, alignment: .leading),
                trailing: NavigationLink(destination: Text("News")) {
                    Text("News")
                        .foregroundColor(.blue)
            })
            .background(Color(UIColor.systemGray5))
        }
        .overlay(
            StoryView()
                .environmentObject(storyData)
        )
    }
    
    
func destinationForButton(_ button: ButtonData) -> some View {
       switch button.shotTitle {
       case "cars":
           return AnyView(CarsView())
       case "carsByKolesa":
           return AnyView(CarsByKolesaView())
       case "SparepartsStore":
           return AnyView(SparepartsStoreView())
       case "SpareParts":
           return AnyView(SparePartsView())
       case "Commercial":
           return AnyView(CommercialView())
       case "repairAndServices":
           return AnyView(RepairAndServicesView())
       case "finesAndServices":
           return AnyView(FinesAndServicesView())
       case "kolesaGuide":
           return AnyView(KolesaGuideView())
       default:
           return AnyView(EmptyView())
       }
   }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


///
///
///
///
///
///
///
///
///
///
///
///
///

struct CarsView: View {
    var body: some View {
        Text("Cars View")
    }
}

struct CarsByKolesaView: View {
    var body: some View {
        Text("Cars by Kolesa View")
    }
}

struct SparepartsStoreView: View {
    var body: some View {
        Text("Spareparts Store View")
    }
}

struct SparePartsView: View {
    var body: some View {
        Text("Spare Parts View")
    }
}

struct CommercialView: View {
    var body: some View {
        Text("Commercial View")
    }
}

struct RepairAndServicesView: View {
    var body: some View {
        Text("Repair and Services View")
    }
}

struct FinesAndServicesView: View {
    var body: some View {
        Text("Fines and Services View")
    }
}

struct KolesaGuideView: View {
    @State private var hours = 0
      @State private var minutes = 0
      @State private var seconds = 0

      var body: some View {
          VStack {
              Text("Selected Time: \(formatTime(hours: hours, minutes: minutes, seconds: seconds))")
              
              HStack {
                  Picker("Hours", selection: $hours) {
                      ForEach(0..<24, id: \.self) { hour in
                          Text("\(hour) h")
                      }
                  }
                  .pickerStyle(WheelPickerStyle())
                  
                  Picker("Minutes", selection: $minutes) {
                      ForEach(0..<60, id: \.self) { minute in
                          Text("\(minute) m")
                      }
                  }
                  .pickerStyle(WheelPickerStyle())
                  
                  Picker("Seconds", selection: $seconds) {
                      ForEach(0..<60, id: \.self) { second in
                          Text("\(second) s")
                      }
                  }
                  .pickerStyle(WheelPickerStyle())
              }
          }
      }
      
      private func formatTime(hours: Int, minutes: Int, seconds: Int) -> String {
          return String(format: "%02d h | %02d m | %02d s", hours, minutes, seconds)
      }
}
