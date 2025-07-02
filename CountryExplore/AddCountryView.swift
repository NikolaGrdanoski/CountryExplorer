//
//  AddCountryView.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 19.6.25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct AddCountryView: View {
    @State private var isPresented = false
    @State private var isPresenting = false
    @State var alertDisplay = false
    @State var name: String = ""
    @State var language: String = ""
    @State var continent: String = ""
    @State var capital: String = ""
    @State var tld: String = ""
    @State var flag: String = ""
    @State var lt: String = ""
    @State var ln: String = ""
    @State var poi: String = ""
    @State private var pickedC = ""
    
    let continents = ["Africa", "Asia", "Europe", "North America", "Oceania", "South America"]
    
    @State var allList = allC(all: [])
    
    var body: some View {
        //Text("Hello, World!")
        
        NavigationLink(destination: ContentView(), isActive: self.$isPresenting, label: {
            Button ("Sign Out") {
                try? Auth.auth().signOut()
                isPresenting = true
            }
        })
        .navigationBarBackButtonHidden()
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: 7))
        .padding()
        
        Spacer()
        
            NavigationStack {
                ScrollView {
                    Text("New Country")
                        .foregroundStyle(.green)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    TextField("Name", text: $name)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.blue)
                        .textFieldStyle(.roundedBorder)
                        .padding(1)
                    
                    TextField("Language", text: $language)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.blue)
                        .textFieldStyle(.roundedBorder)
                        .padding(1)
                    
                    TextField("TLD", text: $tld)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.blue)
                        .textFieldStyle(.roundedBorder)
                        .padding(1)
                    
                    TextField("Capital", text: $capital)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.blue)
                        .textFieldStyle(.roundedBorder)
                        .padding(1)
                    
                    TextField("Flag", text: $flag)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.blue)
                        .textFieldStyle(.roundedBorder)
                        .padding(1)
                    
                    TextField("Lt", text: $lt)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.blue)
                        .textFieldStyle(.roundedBorder)
                        .padding(1)
                    
                    TextField("Ln", text: $ln)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.blue)
                        .textFieldStyle(.roundedBorder)
                        .padding(1)
                    
                    TextField("Places of interest", text: $poi)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.blue)
                        .textFieldStyle(.roundedBorder)
                        .padding(1)
                    
                    Picker("Select a continent", selection: $pickedC) {
                        ForEach(continents, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    /*NavigationLink("Select address", destination: AddressSelectMapView())
                     .foregroundStyle(.white)
                     .background(.purple)
                     .buttonBorderShape(.roundedRectangle)
                     .buttonStyle(.bordered)
                     .clipShape(.rect(cornerRadius: 9))
                     .padding()*/
                    
                    Spacer()
                    
                    NavigationLink(destination: CountryView(), isActive: self.$isPresented, label: {
                        Button("Add") {
                            if (name.isEmpty || language.isEmpty || capital.isEmpty || pickedC.isEmpty || tld.isEmpty || flag.isEmpty || lt.isEmpty || ln.isEmpty || poi.isEmpty) {
                                alertDisplay = true
                            }
                            else {
                                let c : [String : String] = ["name" : name, "language" : language, "tld" : tld, "capital" : capital, "continent" : pickedC, "flag" : flag, "lt" : lt, "ln" : ln, "poi": poi]
                                
                                Database.database().reference().child("country").child(name).setValue(c)
                                
                                isPresented = true
                            }
                        }
                        .alert(isPresented: $alertDisplay) {
                            Alert(title: Text("Alert"), message: Text("Invalid credentials"), dismissButton: .default(Text("Fine")))
                        }
                    })
                    .foregroundStyle(.white)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .background(.green)
                    .clipShape(.rect(cornerRadius: 7))
                    .padding()
                }
        }
    }
}

#Preview {
    AddCountryView()
}
