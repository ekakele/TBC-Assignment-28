//
//  DetailsScreenView.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import SwiftUI

struct DetailsScreenView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: DetailsScreenViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.16, green: 0.20, blue: 0.25)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10) {
                    let imageURL = URL(string: viewModel.destination.image)
                    
                    AsyncImage(
                        url: imageURL,
                        content: { fetchedImage in
                            fetchedImage
                                .resizable()
                                .shadow(radius: 10)
                                .cornerRadius(4)
                                .padding(.top, 20)
                            
                        }, placeholder: {
                            ProgressView()
                        })
                    
                    Spacer()
                    
                    Text("General Info")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 350, alignment: .leading)
                        .padding(.vertical, 10)
                    
                    Text(viewModel.destination.details.generalInfo)
                        .font(.system(size: 20))
                        .frame(width: 320, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    
                    Spacer()
                    
                    Text("See Detailed Info")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 350, alignment: .leading)
                        .padding(.vertical, 10)
                    
                    HStack {
                        CustomButton(action: {
                        }, label: "Transport", icon: "car", destination: TransportView(transports: viewModel.destination.details.transport))
                        
                        CustomButton(action: {
                        }, label: "Must See", icon: "eye", destination: MustSeeView(mustSees: viewModel.destination.details.mustSee))
                        
                        CustomButton(action: {
                        }, label: "Hotels", icon: "bed.double", destination: HotelsView(hotels: viewModel.destination.details.hotels))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .navigationTitle("Details Page")
            }
        }
    }
}

struct CustomButton<Destination: View>: View {
    // MARK: - Properties
    var action: () -> Void
    var label: String
    var icon: String
    var destination: Destination
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            NavigationLink(destination: destination) {
                VStack(spacing: 8) {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    
                    Text(label)
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                }
                .frame(width: 75)
                .padding()
                .background(Color.orange.cornerRadius(6))
                .opacity(0.8)
                .shadow(radius: 10)
            }
        }
    }
}

// MARK: - Mock Preview
//struct DetailsScreenPreview: PreviewProvider {
//    static var previews: some View {
//        DetailsScreenView(viewModel: DetailsScreenViewModel(destination: mockData().topWinterDestinations.first!))
//    }
//
//    static func mockData() -> DestinationModel {
//        let transport1 = Transport(mode: "Airplane", details: "Direct flight available")
//        let transport2 = Transport(mode: "Train", details: "Scenic route with comfortable seating")
//
//        let mustSee1 = MustSee(place: "Snowy Mountains", details: "Breathtaking views and skiing opportunities")
//        let mustSee2 = MustSee(place: "Ice Sculpture Festival", details: "Artistic creations made of ice")
//
//        let hotel1 = Hotel(name: "Winter Lodge", rating: 4, details: "Cozy rooms with fireplace")
//        let hotel2 = Hotel(name: "Frosty Retreat", rating: 5, details: "Luxurious accommodations with spa")
//
//        let details = Details(
//            transport: [transport1, transport2],
//            mustSee: [mustSee1, mustSee2],
//            hotels: [hotel1, hotel2],
//            generalInfo: "Experience the magic of winter in this amazing destination!"
//        )
//
//        return DestinationModel(topWinterDestinations: [TopWinterDestination(image: "", location: "Winter Wonderland", dealDeadline: "2023-12-31", info: "Explore the beauty of winter", details: details)])
//    }
//}

// MARK: - Preview
#Preview {
    MainScreenView(viewModel: MainScreenViewModel())
}
