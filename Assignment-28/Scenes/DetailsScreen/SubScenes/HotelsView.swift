//
//  TransportView.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 15.12.23.
//

import SwiftUI

struct HotelsView: View {
    var hotels: [Hotel]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.16, green: 0.20, blue: 0.25)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Image("posterTwo")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 10)
                    
                    Text("Our Top Picks")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    ScrollView {
                        ForEach(hotels, id: \.self) { hotel in
                            VStack {
                                HStack {
                                    Text(hotel.name)
                                        .font(.system(size: 20))
                                        .bold()
                                        .lineLimit(3)
                                        .foregroundColor(.orange)
                                    
                                    Spacer()
                                    
                                    Text("\(hotel.rating) ⭐️")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color(red: 1.00, green: 0.89, blue: 0.51))
                                        .bold()
                                        .shadow(radius: 10)
                                }
                                Spacer()
                                
                                Text(hotel.details)
                                    .font(.system(size: 20))
                                    .frame(width: 320, alignment: .leading)
                            }
                            .padding(.horizontal)
                            .padding(.vertical)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .navigationTitle("Hotels")
            }
        }
    }
}

//mock Preview
struct HotelsView_Previews: PreviewProvider {
    static var previews: some View {
        let mockHotels = [
            Hotel(name: "Luxury Suites", rating: 5, details: "Elegant rooms with stunning views."),
            Hotel(name: "Grand Resort", rating: 4, details: "Modern amenities and spa services."),
            Hotel(name: "Cozy Inn", rating: 3, details: "Charming accommodation with a fireplace.")
        ]
        
        HotelsView(hotels: mockHotels)
    }
}


//#Preview {
//    HotelsView()
//}

