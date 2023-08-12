//
//  CardView.swift
//  Chaos
//
//  Created by Ali on 12.08.2023.
//

import SwiftUI

struct CardView: View {
    
//    @ObservedObject public var viewModel: CardViewModel
    @State private var isHeartClicked = false
    @State private var isPressed = false
    
    func randomInRange(range: ClosedRange<Int>) -> Int {
           return Int.random(in: range)
    }
    
//    func randomMonth() -> String {
//            let months = [
//                "January", "February", "March", "April", "May", "June",
//                "July", "August", "September", "October", "November", "December"
//            ]
//            return months.randomElement() ?? ""
//    }
    
    let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = " "
            return formatter
    }()
    
    var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Land Cruiser Prado")
                            .foregroundColor(.blue)
                            .font(.title3)
                            .bold()
                        Spacer()
                        Button(action: { isHeartClicked.toggle() }) {
                            Image(systemName: isHeartClicked ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 20, height: 18)
                                .foregroundColor(isHeartClicked ? .red : .blue)
                        }
                    }

                    HStack(alignment: .top) {
                        Image("toyota")
                            .resizable()
                            .frame(width: 200, height: 150)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("2018 г. /Б/v SUV 4.6 л / betrol КПП automatic white / metallicExcalibur. Вложений не требует. В родной краске. Небольшой т...")
                                .font(.body)
                                .lineLimit(4)
                            
                            Text("Uralsk")
                                .foregroundColor(Color(UIColor.darkGray))
                        }
                    }
                                       
                    Rectangle()
                        .foregroundColor(Color(UIColor.separator))
                        .frame(height: 1)
                        .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                    
                    HStack(alignment: .top) {
                        Group {
                            //Text("\(randomInRange(range: 1...28))\(randomMonth())")
                            
                            Text(numberFormatter.string(from: NSNumber(value: randomInRange(range: 1000...999999))) ?? "")
                            
                            Image(systemName: "heart")
                            Text("\(randomInRange(range: 0...100))")
                        }
                        .foregroundColor(Color(UIColor.darkGray))
                    }
                }
                .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
            }
            .background(.white)
            .cornerRadius(15)
            .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
//        CardView(viewModel: CardViewModel())
        CardView()
    }
}
