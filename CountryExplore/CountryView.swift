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
    @State var search = ""
    @State var name = ""
    @State var official = ""
    @State var tld = ""
    @State var capital = ""
    @State var flags = ""
    
    @State var allList = allC(all: [])
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
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
            List {
                ForEach(allList.all) { drzava in
                    NavigationStack {
                        /*Text(drzava.name)
                        CountryDetailsView*/
                        NavigationLink{
                            CountryDetailsView(selectedN: drzava.name, selectedC: drzava.capital, selectedT: drzava.tld, selectedLt: drzava.lt, selectedLn: drzava.ln, selectedF: drzava.flag, selectedL: drzava.language)
                        } label: {
                            Text(drzava.name)
                        }
                    }
                }
            }
            .navigationTitle("Countries")
        }
        .onFirstAppear {
            Database.database().reference().child("country").queryOrderedByKey().observe(DataEventType.childAdded) {
                (snapshot) in
                let CK = snapshot.key as String
                let key = String (CK)
                if let Drzava = snapshot.value as? [String : String],
                   let name = Drzava["name"],
                   let language = Drzava["language"],
                   let capital = Drzava["capital"],
                   let tld = Drzava["tld"],
                   let flag = Drzava["flag"],
                   let lt = Drzava["lt"],
                   let ln = Drzava["ln"]
                {
                    self.allList.all.append(Country(id: key, name: name, language: language, capital: capital, tld: tld, flag: flag, lt: lt, ln: ln))
                }
            }
        }
    }
}

#Preview {
    CountryView()
}

extension View {
    func onFirstAppear(_ onFirstAppearAction: @escaping () -> () ) -> some View {
        return modifier(OnFirstAppearModifier(onFirstAppearAction))
    }
}

public struct OnFirstAppearModifier: ViewModifier {

    private let onFirstAppearAction: () -> ()
    @State private var hasAppeared = false
    
    public init(_ onFirstAppearAction: @escaping () -> ()) {
        self.onFirstAppearAction = onFirstAppearAction
    }
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                guard !hasAppeared else { return }
                hasAppeared = true
                onFirstAppearAction()
            }
    }
}
