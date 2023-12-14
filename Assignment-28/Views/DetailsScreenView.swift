//
//  DetailsScreenView.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import SwiftUI

struct DetailsScreenView: View {
        @ObservedObject var viewModel: DetailsScreenViewModel
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                VStack(spacing: 6) {
                    Image("posterTwo")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 20)
                        .shadow(radius: 10)
                    
                    Spacer()
                    
                    Text("General Info")
                        .font(.title2)
                        .bold()
                        .lineLimit(2)
                        .padding(.bottom, 6)
                    
                    Text("info text")
                        .font(.system(size: 18))
                    
                    Spacer()
                    
                    Text("Recommendations")
                        .font(.title2)
                        .bold()
                        .lineLimit(2)
                        .padding(.bottom, 12)
                    
                    HStack {
                        CustomButton(action: {
                        }, label: "Transport", destination: TransportView())

                        CustomButton(action: {
                        }, label: "Must See", destination: MustSeeView())

                        CustomButton(action: {
                        }, label: "Hotels", destination: HotelsView())
                    }
                    
                    Spacer()
                }
                .background(Color(red: 0.16, green: 0.20, blue: 0.25))
                .foregroundColor(.white)
                .navigationTitle("Details Page")
            }
        }
    }
}

struct CustomButton<Destination: View>: View {
    var action: () -> Void
    var label: String
    var destination: Destination
    
    var body: some View {
        Button(action: action) {
            NavigationLink(destination: destination) {
                Text(label)
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 85, height: 20)
                    .padding()
                    .background(Color.orange.cornerRadius(6))
                    .opacity(0.8)
            }
        }
    }
}


struct TransportView: View {
    
    var body: some View {
        VStack {
            Text("Transport View")
                .font(.title)
                .padding()
            Text("This is the Transport view.")
        }
    }
}

struct MustSeeView: View {
    var body: some View {
        VStack {
            Text("Must See View")
                .font(.title)
                .padding()
            Text("This is the Must See view.")
        }
    }
}

struct HotelsView: View {
    var body: some View {
        VStack {
            Text("Hotels View")
                .font(.title)
                .padding()
            Text("This is the Hotels view.")
        }
    }
}



#Preview {
    DetailsScreenView(viewModel: DetailsScreenViewModel())
}
