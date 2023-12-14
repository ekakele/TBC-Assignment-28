//
//  TransportView.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 15.12.23.
//

import SwiftUI

struct MustSeeView: View {
    var mustSees: [MustSee]
    
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
                        ForEach(mustSees, id: \.self) { mustSee in
                            VStack {
                                Text(mustSee.place)
                                    .font(.system(size: 20))
                                    .bold()
                                    .frame(width: 320, alignment: .leading)
                                    .lineLimit(3)
                                    .foregroundColor(Color(red: 0.98, green: 0.55, blue: 0.14))
                                
                                Spacer()
                                
                                Text(mustSee.details)
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
                .navigationTitle("Must Sees")
            }
        }
    }
}

//mock Preview
struct MustSeeView_Previews: PreviewProvider {
    static var previews: some View {
        let mockMustSees = [
            MustSee(place: "Historic Landmark", details: "Explore the rich history of the city."),
            MustSee(place: "Scenic Viewpoint", details: "Enjoy breathtaking views of the surrounding landscape."),
            MustSee(place: "Cultural Museum", details: "Discover artifacts and exhibits showcasing the local culture.")
        ]
        
        MustSeeView(mustSees: mockMustSees)
    }
}


//#Preview {
//    MustSeeView()
//}

