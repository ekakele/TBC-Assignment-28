////
////  draft.swift
////  Assignment-28
////
////  Created by Eka Kelenjeridze on 14.12.23.
////
//
//import Foundation
//
//struct MainScreenView: View {
//    @ObservedObject var viewModel: MainScreenViewModel
//
//    init(viewModel: MainScreenViewModel) {
//        self.viewModel = viewModel
//    }
//
//    var body: some View {
//        VStack {
//            // Your view content here
//            Text("Top Winter Destinations:")
//                .font(.headline)
//            List(viewModel.travelDestinations, id: \.id) { destination in
//                Text(destination.name)
//                // Add more destination details as needed
//            }
//
//            // Other parts of your view
//        }
//        .onAppear {
//            // Fetch data when the view appears
//            viewModel.fetchTravelDestinations()
//            viewModel.fetchTravelTips()
//        }
//    }
//}
//
//struct MainScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainScreenView(viewModel: MainScreenViewModel())
//    }
//}
