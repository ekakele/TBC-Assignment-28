//
//  ContentView.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 13.12.23.
//

import SwiftUI

struct MainScreenView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: MainScreenViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
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
                            ListCellView(destination: destination)
                                .listRowBackground(Color.clear)
                        }
                    }
                    //                     destinaton
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

struct userAvatarView: View {
    // MARK: - Body
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
    // MARK: - Body
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
                    .foregroundColor(.appOrange)
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

struct ListCellView: View {
    //MARK: Properties
    let destination: TopWinterDestination
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(destination.info)
                .font(Font.system(size: 18))
                .lineLimit(2)
            
            NavigationLink(destination.location, destination: DetailsScreenView(viewModel: DetailsScreenViewModel(destination: destination)))
                .fontWeight(.semibold)
            
            //            Navigaton
            
            Text(destination.dealDeadline)
                .font(.subheadline)
                .opacity(0.7)
        }
    }
}

struct randomTravelTipsButton: View {
    // MARK: - Properties
    @State var showAlert: Bool = false
    @ObservedObject var viewModel: MainScreenViewModel
    
    // MARK: - Body
    var body: some View {
        Button {
            showAlert.toggle()
        } label: {
            Image(systemName: "lightbulb.max")
                .resizable()
                .frame(width: 30, height: 30)
                .font(.title.weight(.semibold))
                .padding()
                .background(Color(red: 1.00, green: 0.80, blue: 0.29))
                .opacity(0.8)
                .foregroundColor(Color(red: 0.16, green: 0.20, blue: 0.25))
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

// MARK: - Preview
#Preview {
    MainScreenView(viewModel: MainScreenViewModel())
}
