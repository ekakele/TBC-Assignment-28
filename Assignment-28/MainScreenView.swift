//
//  ContentView.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 13.12.23.
//

import SwiftUI

struct MainScreenView: View {
    let travelDestinations = TravelDestinationList.topWinterDestinations
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                
                Image("posterOne")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 20)
                    .shadow(radius: 10)
                
                Text("Winter Hot Deals 🔥")
                    .font(.title2)
                    .bold()
                    .lineLimit(2)
                    .padding(.bottom, 6)

                Divider()
                
                List(travelDestinations) { destination in
                    ListCellView(info: destination.info, country: destination.country, dealDeadline: destination.dealDeadline)
                        .listRowBackground(Color.clear)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Travel Destinations")
                .navigationBarItems(
                    leading: userAvatarView(),
                    trailing: notificationIconView()
                )
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Welcome back, Nick!")
                    }
                }
            }
            
        }
    }
}


//stays with main view
struct userAvatarView: View {
    var body: some View {
        Circle()
            .frame(width: 60, height: 60)
            .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.98))
            .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
            .overlay(
                Image("userAvatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .scaleEffect(1.2)
                    .offset(y: 13)
                    .clipShape(Circle())
            )
    }
}

struct notificationIconView: View {
    var body: some View {
        Circle()
            .frame(width: 60, height: 60)
            .foregroundColor(Color(red: 0.92, green: 0.92, blue: 1.00))
//            .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
            .overlay(
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)
                    .overlay(
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 1.00, green: 0.46, blue: 0.23))
                            .offset(x: 8, y: -10)
                            .overlay(
                                Text("3")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                                    .offset(x: 8, y: -10)
                            )
                    )
            )

    }
}



struct DestinationDetailsView: View {
    var body: some View {
        ZStack {
            Color.indigo
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Details Page")
            
            VStack {
                NavigationLink("Transport", destination: Text("Transport Page"))
                
                NavigationLink("Must See", destination: Text("Must See"))
                
                NavigationLink("Hotels", destination: Text("Hotels"))
            }
        }
    }
}

struct ListCellView: View {
    //MARK: Properties
    let info: String
    let country: String
    let dealDeadline: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(info)
                .font(Font.system(size: 18))
                .lineLimit(2)
                                        
            NavigationLink(country, destination: DestinationDetailsView())
                .fontWeight(.semibold)
            
            Text(dealDeadline)
                .font(.subheadline)
                .opacity(0.7)
        }
    }
}

#Preview {
    MainScreenView()
}
