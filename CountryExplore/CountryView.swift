//
//  CountryView.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 19.6.25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct CountryView: View {
    @State private var isPresented = false
    @State private var isPresenting = false
    @State private var isPresenting1 = false
    @State var search = ""
    @State var name = ""
    @State var official = ""
    @State var continent = ""
    @State var tld = ""
    @State var capital = ""
    @State var flags = ""
    
    @State var selected = ""
    
    @State var allList = allC(all: [])
    
    var body: some View {
        //Text("Hello, World!")
        
        VStack {
            HStack {
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
                
                NavigationLink(destination: FavoritesView(), isActive: self.$isPresenting1, label: {
                    Button ("See Favorites") {
                        isPresenting1 = true
                    }
                })
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.bordered)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 7))
                .padding()
            }
            
            Spacer()
            
            NavigationStack {
                List {
                        Section("Africa") {
                            ForEach(allList.all) { drzava in
                                if drzava.continent == "Africa" {
                                    NavigationStack {
                                        /*Text(drzava.name)
                                         CountryDetailsView*/
                                        NavigationLink{
                                            CountryDetailsView(selectedN: drzava.name, selectedC: drzava.capital, selectedT: drzava.tld, selectedLt: drzava.lt, selectedLn: drzava.ln, selectedF: drzava.flag, selectedL: drzava.language, selectedP: drzava.poi, pickedC: drzava.continent)
                                        } label: {
                                            Text(drzava.name)
                                        }
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                if Auth.auth().currentUser?.displayName == "Admin" {
                                    let index = indexSet[indexSet.startIndex]
                                    Database.database().reference().child("country").child(allList.all[index].name).removeValue()
                                }
                                else {
                                    self.allList.all.removeAll()
                                    
                                    Database.database().reference().child("country").queryOrderedByKey().observe(DataEventType.childAdded) {
                                        (snapshot) in
                                        let CK = snapshot.key as String
                                        let key = String (CK)
                                        if let Drzava = snapshot.value as? [String : String],
                                           let name = Drzava["name"],
                                           let language = Drzava["language"],
                                           let capital = Drzava["capital"],
                                           let continent = Drzava["continent"],
                                           let tld = Drzava["tld"],
                                           let flag = Drzava["flag"],
                                           let lt = Drzava["lt"],
                                           let ln = Drzava["ln"],
                                           let poi = Drzava["poi"]
                                        {
                                            self.allList.all.append(Country(id: key, name: name, language: language, capital: capital, continent: continent, tld: tld, flag: flag, lt: lt, ln: ln, poi: poi))
                                        }
                                    }
                                }
                            }
                            .listRowBackground(Color.red.opacity(0.5))
                        }
                        Section("Asia") {
                            ForEach(allList.all) { drzava in
                                if drzava.continent == "Asia" {
                                    NavigationStack {
                                        /*Text(drzava.name)
                                         CountryDetailsView*/
                                        NavigationLink{
                                            CountryDetailsView(selectedN: drzava.name, selectedC: drzava.capital, selectedT: drzava.tld, selectedLt: drzava.lt, selectedLn: drzava.ln, selectedF: drzava.flag, selectedL: drzava.language, selectedP: drzava.poi, pickedC: drzava.continent)
                                        } label: {
                                            Text(drzava.name)
                                        }
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                if Auth.auth().currentUser?.displayName == "Admin" {
                                    let index = indexSet[indexSet.startIndex]
                                    Database.database().reference().child("country").child(allList.all[index].name).removeValue()
                                }
                                else {
                                    self.allList.all.removeAll()
                                    
                                    Database.database().reference().child("country").queryOrderedByKey().observe(DataEventType.childAdded) {
                                        (snapshot) in
                                        let CK = snapshot.key as String
                                        let key = String (CK)
                                        if let Drzava = snapshot.value as? [String : String],
                                           let name = Drzava["name"],
                                           let language = Drzava["language"],
                                           let capital = Drzava["capital"],
                                           let continent = Drzava["continent"],
                                           let tld = Drzava["tld"],
                                           let flag = Drzava["flag"],
                                           let lt = Drzava["lt"],
                                           let ln = Drzava["ln"],
                                           let poi = Drzava["poi"]
                                        {
                                            self.allList.all.append(Country(id: key, name: name, language: language, capital: capital, continent: continent, tld: tld, flag: flag, lt: lt, ln: ln, poi: poi))
                                        }
                                    }
                                }
                            }
                            .listRowBackground(Color.yellow.opacity(0.5))
                        }
                        Section("Europe") {
                            ForEach(allList.all) { drzava in
                                if drzava.continent == "Europe" {
                                    NavigationStack {
                                        /*Text(drzava.name)
                                         CountryDetailsView*/
                                        NavigationLink{
                                            CountryDetailsView(selectedN: drzava.name, selectedC: drzava.capital, selectedT: drzava.tld, selectedLt: drzava.lt, selectedLn: drzava.ln, selectedF: drzava.flag, selectedL: drzava.language, selectedP: drzava.poi, pickedC: drzava.continent)
                                        } label: {
                                            Text(drzava.name)
                                        }
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                if Auth.auth().currentUser?.displayName == "Admin" {
                                    let index = indexSet[indexSet.startIndex]
                                    Database.database().reference().child("country").child(allList.all[index].name).removeValue()
                                }
                                else {
                                    self.allList.all.removeAll()
                                    
                                    Database.database().reference().child("country").queryOrderedByKey().observe(DataEventType.childAdded) {
                                        (snapshot) in
                                        let CK = snapshot.key as String
                                        let key = String (CK)
                                        if let Drzava = snapshot.value as? [String : String],
                                           let name = Drzava["name"],
                                           let language = Drzava["language"],
                                           let capital = Drzava["capital"],
                                           let continent = Drzava["continent"],
                                           let tld = Drzava["tld"],
                                           let flag = Drzava["flag"],
                                           let lt = Drzava["lt"],
                                           let ln = Drzava["ln"],
                                           let poi = Drzava["poi"]
                                        {
                                            self.allList.all.append(Country(id: key, name: name, language: language, capital: capital, continent: continent, tld: tld, flag: flag, lt: lt, ln: ln, poi: poi))
                                        }
                                    }
                                }
                            }
                            .listRowBackground(Color.green.opacity(0.5))
                        }
                        Section("North America") {
                            ForEach(allList.all) { drzava in
                                if drzava.continent == "North America" {
                                    NavigationStack {
                                        /*Text(drzava.name)
                                         CountryDetailsView*/
                                        NavigationLink{
                                            CountryDetailsView(selectedN: drzava.name, selectedC: drzava.capital, selectedT: drzava.tld, selectedLt: drzava.lt, selectedLn: drzava.ln, selectedF: drzava.flag, selectedL: drzava.language, selectedP: drzava.poi, pickedC: drzava.continent)
                                        } label: {
                                            Text(drzava.name)
                                        }
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                if Auth.auth().currentUser?.displayName == "Admin" {
                                    let index = indexSet[indexSet.startIndex]
                                    Database.database().reference().child("country").child(allList.all[index].name).removeValue()
                                }
                                else {
                                    self.allList.all.removeAll()
                                    
                                    Database.database().reference().child("country").queryOrderedByKey().observe(DataEventType.childAdded) {
                                        (snapshot) in
                                        let CK = snapshot.key as String
                                        let key = String (CK)
                                        if let Drzava = snapshot.value as? [String : String],
                                           let name = Drzava["name"],
                                           let language = Drzava["language"],
                                           let capital = Drzava["capital"],
                                           let continent = Drzava["continent"],
                                           let tld = Drzava["tld"],
                                           let flag = Drzava["flag"],
                                           let lt = Drzava["lt"],
                                           let ln = Drzava["ln"],
                                           let poi = Drzava["poi"]
                                        {
                                            self.allList.all.append(Country(id: key, name: name, language: language, capital: capital, continent: continent, tld: tld, flag: flag, lt: lt, ln: ln, poi: poi))
                                        }
                                    }
                                }
                            }
                            .listRowBackground(Color.orange.opacity(0.5))
                        }
                        Section("Oceania") {
                            ForEach(allList.all) { drzava in
                                if drzava.continent == "Oceania" {
                                    NavigationStack {
                                        /*Text(drzava.name)
                                         CountryDetailsView*/
                                        NavigationLink{
                                            CountryDetailsView(selectedN: drzava.name, selectedC: drzava.capital, selectedT: drzava.tld, selectedLt: drzava.lt, selectedLn: drzava.ln, selectedF: drzava.flag, selectedL: drzava.language, selectedP: drzava.poi, pickedC: drzava.continent)
                                        } label: {
                                            Text(drzava.name)
                                        }
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                if Auth.auth().currentUser?.displayName == "Admin" {
                                    let index = indexSet[indexSet.startIndex]
                                    Database.database().reference().child("country").child(allList.all[index].name).removeValue()
                                }
                                else {
                                    self.allList.all.removeAll()
                                    
                                    Database.database().reference().child("country").queryOrderedByKey().observe(DataEventType.childAdded) {
                                        (snapshot) in
                                        let CK = snapshot.key as String
                                        let key = String (CK)
                                        if let Drzava = snapshot.value as? [String : String],
                                           let name = Drzava["name"],
                                           let language = Drzava["language"],
                                           let capital = Drzava["capital"],
                                           let continent = Drzava["continent"],
                                           let tld = Drzava["tld"],
                                           let flag = Drzava["flag"],
                                           let lt = Drzava["lt"],
                                           let ln = Drzava["ln"],
                                           let poi = Drzava["poi"]
                                        {
                                            self.allList.all.append(Country(id: key, name: name, language: language, capital: capital, continent: continent, tld: tld, flag: flag, lt: lt, ln: ln, poi: poi))
                                        }
                                    }
                                }
                            }
                            .listRowBackground(Color.blue.opacity(0.5))
                        }
                        Section("South America") {
                            ForEach(allList.all) { drzava in
                                if drzava.continent == "South America" {
                                    NavigationStack {
                                        /*Text(drzava.name)
                                         CountryDetailsView*/
                                        NavigationLink{
                                            CountryDetailsView(selectedN: drzava.name, selectedC: drzava.capital, selectedT: drzava.tld, selectedLt: drzava.lt, selectedLn: drzava.ln, selectedF: drzava.flag, selectedL: drzava.language, selectedP: drzava.poi, pickedC: drzava.continent)
                                        } label: {
                                            Text(drzava.name)
                                        }
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                if Auth.auth().currentUser?.displayName == "Admin" {
                                    let index = indexSet[indexSet.startIndex]
                                    Database.database().reference().child("country").child(allList.all[index].name).removeValue()
                                }
                                else {
                                    self.allList.all.removeAll()
                                    
                                    Database.database().reference().child("country").queryOrderedByKey().observe(DataEventType.childAdded) {
                                        (snapshot) in
                                        let CK = snapshot.key as String
                                        let key = String (CK)
                                        if let Drzava = snapshot.value as? [String : String],
                                           let name = Drzava["name"],
                                           let language = Drzava["language"],
                                           let capital = Drzava["capital"],
                                           let continent = Drzava["continent"],
                                           let tld = Drzava["tld"],
                                           let flag = Drzava["flag"],
                                           let lt = Drzava["lt"],
                                           let ln = Drzava["ln"],
                                           let poi = Drzava["poi"]
                                        {
                                            self.allList.all.append(Country(id: key, name: name, language: language, capital: capital, continent: continent, tld: tld, flag: flag, lt: lt, ln: ln, poi: poi))
                                        }
                                    }
                                }
                        }
                        .listRowBackground(Color.purple.opacity(0.5))
                    }
                }
                .navigationTitle("Countries")
            }
            .onAppear {
                Database.database().reference().child("country").queryOrderedByKey().observe(DataEventType.childAdded) {
                    (snapshot) in
                    let CK = snapshot.key as String
                    let key = String (CK)
                    if let Drzava = snapshot.value as? [String : String],
                       let name = Drzava["name"],
                       let language = Drzava["language"],
                       let capital = Drzava["capital"],
                       let continent = Drzava["continent"],
                       let tld = Drzava["tld"],
                       let flag = Drzava["flag"],
                       let lt = Drzava["lt"],
                       let ln = Drzava["ln"],
                       let poi = Drzava["poi"]
                    {
                        self.allList.all.append(Country(id: key, name: name, language: language, capital: capital, continent: continent, tld: tld, flag: flag, lt: lt, ln: ln, poi: poi))
                    }
                }
            }
            .onDisappear {
                self.allList.all.removeAll()
            }
        }
    }
}

#Preview {
    CountryView()
}
