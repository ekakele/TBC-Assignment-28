//
//  TransportView.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 15.12.23.
//

import SwiftUI

struct TransportView: View {
    var transports: [Transport]
    
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
                    
                    Text("Prime Suggestions")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    ScrollView {
                        ForEach(transports, id: \.self) { transport in
                            VStack {
                                Text(transport.mode)
                                    .font(.system(size: 20))
                                    .bold()
                                    .frame(width: 320, alignment: .leading)
                                    .lineLimit(3)
                                    .foregroundColor(.appOrange)
                                
                                Spacer()
                                
                                Text(transport.details)
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
                .navigationTitle("Transport")
            }
        }
    }
}

//mock Preview
struct TransportView_Previews: PreviewProvider {
    static var previews: some View {
        let mockTransports = [
            Transport(mode: "Flight", details: "Non-stop flight from New York"),
            Transport(mode: "Rental Car", details: "Scenic route through the countryside"),
            Transport(mode: "Shuttle Service", details: "Luxury coach with Wi-Fi and onboard services")
        ]
        
        TransportView(transports: mockTransports)
    }
}


//#Preview {
//    TransportView()
//}

