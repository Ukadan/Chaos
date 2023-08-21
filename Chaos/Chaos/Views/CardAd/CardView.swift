//
//  CardView.swift
//  Chaos
//
//  Created by Ali on 12.08.2023.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var settings: AppSettings
    @Binding var bundle: CardBundle
    
    var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(bundle.nameAd)
                                .font(.system(size: 16, weight: settings.darkMode ? .bold : .medium))
                                .foregroundColor(settings.darkMode ? .white : .blue)
                    
                            HStack(spacing: 5) {
                                Text(bundle.priceAd)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Image(systemName: "tengesign")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            bundle.likedAd.toggle()
                            if bundle.likedAd {
                                bundle.likeCountsAd += 1
                            } else {
                                bundle.likeCountsAd -= 1
                            }
                        }) {
                            Image(systemName: bundle.likedAd ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 20, height: 18, alignment: .top)
                                .foregroundColor(bundle.likedAd ? .red : (settings.darkMode ? .white : .blue))
                        }
                    }

                    HStack(alignment: .top) {
                        ZStack(alignment: .bottomTrailing) {
                            Image(bundle.firstPhotoAd)
                                .resizable()
                                .frame(width: 200, height: 150)
                                .cornerRadius(10)
                            
    
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width: 24, height: 18)
                                    .cornerRadius(5)
                                    .opacity(0.8)

                                Text("\(bundle.photoAd.count)")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                   
                            }
                            .padding(.bottom, 6)
                            .padding(.trailing, 6)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(bundle.description)
                                .font(.system(size: 12, weight: .light))
                                .lineLimit(4)
                                .multilineTextAlignment(.leading)
                
                            Text(bundle.cityAd)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(settings.darkMode ? Color(UIColor.lightGray) : Color(UIColor.darkGray))
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
                        Text("\(bundle.likeCountsAd)")
                    }
                    .font(.caption)
                    .foregroundColor(settings.darkMode ? Color(UIColor.lightGray) : Color(UIColor.darkGray))
                }
                .padding(EdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18))
            }
            .background(settings.darkMode ? .black : .white)
            .cornerRadius(10)
            .padding(EdgeInsets(top: -4, leading: 8, bottom: 0, trailing: 8))
    }
}


//struct CardView_Previews: PreviewProvider {
//    @Binding var bundle: CardBundle
//    static var previews: some View {
////        CardView(viewModel: CardViewModel())
//        CardView bundle: bundle)
//    }
//}
