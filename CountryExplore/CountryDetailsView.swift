//
//  CountryDetailsView.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 19.6.25.
//

import SwiftUI
import Firebase
import MapKit

struct CountryDetailsView: View {
    var selectedN: String
    var selectedC: String
    var selectedT: String
    var selectedLt: String
    var selectedLn: String
    var selectedF: String
    var selectedL: String
    
    var body: some View {
        //Text("Hello, World!")
        
        let lt = Double(selectedLt)
        let ln = Double(selectedLn)
        
        @State var place = MapCameraPosition.region(MKCoordinateRegion(
            center: CLLocationCoordinate2DMake(lt!, ln!), span: MKCoordinateSpan(latitudeDelta: 3.5, longitudeDelta: 3.5)
        ))
        
        /*VStack {
            Text(name)
            Text(language)
            Text(tld)
            Text(unMember)
            Text(capital)
            AsyncImage(url: URL(string: flags))
        }*/
        ScrollView {
            AsyncImage(url: URL(string: selectedF)) { image in
                image.resizable()
            } placeholder: {
                Text("?")
            }
            .frame(width: 200, height: 125)
            Grid {
                GridRow {
                    Text("Name: ").bold()
                    Spacer()
                    Text(selectedN)
                    Spacer()
                }
                GridRow {
                    Text("Capital: ").bold()
                    Spacer()
                    Text(selectedC)
                    Spacer()
                }
                GridRow {
                    Text("Language: ").bold()
                    Spacer()
                    Text(selectedL)
                    Spacer()
                }
                GridRow {
                    Text("TLD: ").bold()
                    Spacer()
                    Text(selectedT)
                    Spacer()
                }
            }
        }
        .padding()
        
        MapReader { reader in
            Map(position: $place, interactionModes: [.rotate, .zoom, .pan])
        }
        .padding()
    }
}

