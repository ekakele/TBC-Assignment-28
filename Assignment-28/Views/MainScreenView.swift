//
//  ContentView.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 13.12.23.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                
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
                    
                    List {
                        ForEach(viewModel.travelDestinations, id: \.self) { destination in
                            ListCellView(info: destination.info, location: destination.location, dealDeadline: destination.dealDeadline)
                                .listRowBackground(Color.clear)
                        }
                    }
                    .onAppear {
                        viewModel.fetchTravelDestinations()
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
                                .font(.title3)
                                .bold()
                        }
                    }
                }
                .background(Color(red: 0.16, green: 0.20, blue: 0.25))
                .foregroundColor(.white)
                
                randomTravelTipsButton(viewModel: MainScreenViewModel())
            }
        }
    }
}

//stays with main view
struct userAvatarView: View {
    var body: some View {
        Circle()
            .frame(width: 55, height: 55)
            .foregroundColor(Color(red: 0.79, green: 0.83, blue: 0.89))
            .opacity(0.8)
            .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
            .overlay(
                Image("userAvatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .scaleEffect(1.2)
                    .offset(y: 13)
                    .clipShape(Circle())
            )
    }
}

struct notificationIconView: View {
    var body: some View {
        Image(systemName: "bell")
            .resizable()
            .frame(width: 26, height: 26)
            .foregroundColor(.white)
            .opacity(0.8)
            .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
        
            .overlay(
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 1.00, green: 0.46, blue: 0.23))
                    .offset(x: 10, y: -10)
                    .overlay(
                        Text("3")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: 10, y: -10)
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
    let location: String
    let dealDeadline: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(info)
                .font(Font.system(size: 18))
                .lineLimit(2)
            
            NavigationLink(location, destination: DestinationDetailsView())
                .fontWeight(.semibold)
            
            Text(dealDeadline)
                .font(.subheadline)
                .opacity(0.7)
        }
    }
}

//alert
struct randomTravelTipsButton: View {
    @State var showAlert: Bool = false
    @ObservedObject var viewModel: MainScreenViewModel
    
    
    var body: some View {
        Button {
            showAlert.toggle()
        } label: {
            Image(systemName: "lightbulb")
                .resizable()
                .frame(width: 22, height: 30)
                .font(.title.weight(.semibold))
                .padding()
                .background(Color(red: 1.00, green: 0.46, blue: 0.23))
                .opacity(0.9)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(color: .yellow, radius: 4, x: 0.1, y: 0.1)
        }
        .padding()
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("💡Random Travel Tips"),
                message: Text(viewModel.getRandomTipsAlert())
            )
        })
    }
}

#Preview {
    MainScreenView(viewModel: MainScreenViewModel())
}
