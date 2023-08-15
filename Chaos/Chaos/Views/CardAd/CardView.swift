//
//  CardView.swift
//  Chaos
//
//  Created by Ali on 12.08.2023.
//

import SwiftUI

struct CardView: View {
    
    @Binding var bundle: CardBundle
    
    var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(bundle.nameAd)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.blue)
                    
                            HStack(spacing: 5) {
                                Text(bundle.priceAd)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Image(systemName: "tengesign")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: { bundle.likedAd.toggle() }) {
                            Image(systemName: bundle.likedAd ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 20, height: 18, alignment: .top)
                                .foregroundColor(bundle.likedAd ? .red : .blue)
                        }
                    }

                    HStack(alignment: .top) {
                        Image(bundle.firstPhotoAd)
                            .resizable()
                            .frame(width: 200, height: 150)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(bundle.description)
                                .font(.system(size: 12, weight: .light))
                                .lineLimit(4)
                                .multilineTextAlignment(.leading)
                
                            Text(bundle.cityAd)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Color(UIColor.darkGray))
                        }
                    }
                                       
                    Rectangle()
                        .foregroundColor(Color(UIColor.separator))
                        .frame(height: 1)
                        .padding(EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0))
                    
                    HStack {
                        Text(bundle.datePublicationAd)
             
                        Image(systemName: "eye")
                            .resizable()
                            .frame(width: 12, height: 8)
                        Text(bundle.countViewsAd)
                        
                        Image(systemName: "heart")
                        Text(bundle.countViewsAd)
                    }
                    .font(.caption)
                    .foregroundColor(Color(UIColor.darkGray))
                }
                .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
            }
            .background(.white)
            .cornerRadius(10)
            .padding(EdgeInsets(top: -4, leading: 8, bottom: 0, trailing: 8))
    }
}


//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
////        CardView(viewModel: CardViewModel())
//        CardView()
//    }
//}
