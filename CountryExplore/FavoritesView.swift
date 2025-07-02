//
//  FavoritesView.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 1.7.25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct FavoritesView: View {
    @State var search = ""
    @State var name = ""
    @State var official = ""
    @State var continent = ""
    @State var tld = ""
    @State var capital = ""
    @State var flags = ""
    
    @State var selected = ""
    
    @State var allList = allF(all: [])
    
    var body: some View {
        //Text("Hello, World!")
        
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
                            let index = indexSet[indexSet.startIndex]
                            Database.database().reference().child("favorites").child(allList.all[index].id).removeValue()
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
                            let index = indexSet[indexSet.startIndex]
                            Database.database().reference().child("favorites").child(allList.all[index].id).removeValue()
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
                            let index = indexSet[indexSet.startIndex]
                            Database.database().reference().child("favorites").child(allList.all[index].id).removeValue()
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
                            let index = indexSet[indexSet.startIndex]
                            Database.database().reference().child("favorites").child(allList.all[index].id).removeValue()
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
                            let index = indexSet[indexSet.startIndex]
                            Database.database().reference().child("favorites").child(allList.all[index].id).removeValue()
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
                            let index = indexSet[indexSet.startIndex]
                            Database.database().reference().child("favorites").child(allList.all[index].id).removeValue()
                        }
                        .listRowBackground(Color.purple.opacity(0.5))
                }

            }
            .navigationTitle("Favorites")
        }
        .onAppear {
            Database.database().reference().child("favorites").queryOrderedByKey().observe(DataEventType.childAdded) {
                (snapshot)  in
                let FK = snapshot.key as String
                let key = String (FK)
                if let Drzava = snapshot.value as? [String : String],
                   let name = Drzava["name"],
                   let language = Drzava["language"],
                   let capital = Drzava["capital"],
                   let continent = Drzava["continent"],
                   let tld = Drzava["tld"],
                   let flag = Drzava["flag"],
                   let lt = Drzava["lt"],
                   let ln = Drzava["ln"],
                   let poi = Drzava["poi"],
                   let email = Drzava["email"]
                {
                    var email1 = (Auth.auth().currentUser?.email)!
                    var newEmail = String(email1.replacingOccurrences(of: "@", with: ""))
                    var newEmail1 = String(newEmail.replacingOccurrences(of: ".", with: ""))
                    if email == newEmail1 {
                        self.allList.all.append(Favorite(id: key, name: name, language: language, capital: capital, continent: continent, tld: tld, flag: flag, lt: lt, ln: ln, poi: poi, email: email))
                    }
                }
            }
        }
        .onDisappear {
            self.allList.all.removeAll()
        }
    }
}

#Preview {
    FavoritesView()
}
