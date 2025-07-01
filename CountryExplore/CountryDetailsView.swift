//
//  CountryDetailsView.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 19.6.25.
//

import SwiftUI
import Firebase
import MapKit
import FirebaseAuth

struct CountryDetailsView: View {
    var selectedN: String
    var selectedC: String
    var selectedT: String
    var selectedLt: String
    var selectedLn: String
    var selectedF: String
    var selectedL: String
    var selectedP: String
    var pickedC: String
    
    @State private var isPresentWebView = false
    
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
        
        VStack {
            Button ("Add To Favorites") {
                let mail = (Auth.auth().currentUser?.email)!
                
                let f : [String : String] = ["name" : selectedN, "language" : selectedL, "tld" : selectedT, "capital" : selectedC, "continent" : pickedC, "flag" : selectedF, "lt" : selectedLt, "ln" : selectedLn, "poi" : selectedP, "email" : mail]
                
                Database.database().reference().child("favorites").child(mail).setValue(f)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
            .background(.green)
            .clipShape(.rect(cornerRadius: 7))
            .padding()
            
            AsyncImage(url: URL(string: selectedF)) { image in
                image.resizable()
            } placeholder: {
                Text("?")
            }
            .frame(width: 200, height: 125)
            .padding()
            
            ScrollView {
                Grid {
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
                    GridRow {
                        Text("Places of interest: ").bold()
                        Spacer()
                        Text(selectedP)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Button ("See details") {
                isPresentWebView = true
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
            .sheet(isPresented: $isPresentWebView) {
                NavigationStack {
                    WebView(url: URL(string: "https://en.wikipedia.org/wiki/\(selectedN)")!)
                    
                        .ignoresSafeArea()
                        .navigationTitle(selectedN)
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            
            MapReader { reader in
                Map(position: $place, interactionModes: [.rotate, .zoom, .pan])
            }
            .padding()
        }
        .background {
            switch pickedC {
            case "Africa":
                Color.red.opacity(0.25)
                
            case "Asia":
                Color.yellow.opacity(0.25)
            
            case "Europe":
                Color.green.opacity(0.25)
            
            case "North America":
                Color.orange.opacity(0.25)
            
            case "Oceania":
                Color.blue.opacity(0.25)
            
            case "South America":
                Color.purple.opacity(0.25)
                
            default:
                Color.accentColor
            }
        }
        .navigationTitle(selectedN)
    }
}
