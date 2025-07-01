//
//  ContentView.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 19.6.25.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SwiftUINavigationTransitions

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State var isPresenting = false
    @State var userIsSignedIn = false
    @State var alertDisplay = false
    @State var adminAlert = false
    
    var body: some View {
        /*VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()*/
        
        NavigationStack {
            VStack {
                Text("🌍")
                    .font(.system(size: 100.0))
                
                HStack {
                    Text("Country")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                        .padding(.bottom, 50.0)
                        .padding(.top, 25.0)
                    Text("Explorer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                        .padding(.bottom, 50.0)
                        .padding(.top, 25.0)
                }
                
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.green)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.blue)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                NavigationLink(destination: CountryView(), isActive: self.$userIsSignedIn, label: {
                    Button("Sign In") {
                        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                            print("in sign in")
                            if error != nil {
                                print("Alert")
                                alertDisplay = true
                            }
                            else {
                                print("Log in")
                                userIsSignedIn = true
                            }
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
                .navigationBarBackButtonHidden()
                .navigationTransition(.fade(.cross))
                
                NavigationLink(destination: CountryView(), isActive: self.$userIsSignedIn, label: {
                    Button ("Sign Up") {
                        if (email.isEmpty || password.isEmpty) {
                            print("Empty")
                        }
                        else {
                            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                                if error != nil {
                                    print("Alert")
                                }
                                else {
                                    print("Sign up success!")
                                    let req = Auth.auth().currentUser?.createProfileChangeRequest()
                                    req?.displayName = "User"
                                    req?.commitChanges(completion: nil)
                                    userIsSignedIn = true
                                }
                            }
                        }
                    }
                })
                .foregroundStyle(.blue)
                .padding()
                .navigationBarBackButtonHidden()
                
                HStack {
                    NavigationLink(destination: AddCountryView(), isActive: self.$isPresenting, label: {
                        Button("Admin Sign In") {
                            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                                print("in sign in")
                                if error != nil {
                                    print("Alert")
                                    alertDisplay = true
                                }
                                else {
                                    if !email.hasPrefix("admin") {
                                        adminAlert = true
                                    }
                                    else {
                                        print("Log in")
                                        isPresenting = true
                                    }
                                }
                            }
                        }
                        .alert(isPresented: $alertDisplay) {
                            Alert(title: Text("Alert"), message: Text("Invalid credentials"), dismissButton: .default(Text("Fine")))
                        }
                        .alert(isPresented: $adminAlert) {
                            Alert(title: Text("Alert"), message: Text("Invalid admin"), dismissButton: .default(Text("Fine")))
                        }
                    })
                    .foregroundStyle(.green)
                    .padding()
                    .navigationBarBackButtonHidden()
                    
                    NavigationLink(destination: AddCountryView(), isActive: self.$isPresenting, label: {
                        Button ("Admin Sign Up") {
                            if (email.isEmpty || password.isEmpty) {
                                print("Empty")
                            }
                            else {
                                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                                    if error != nil {
                                        print("Alert")
                                    }
                                    else {
                                        print("Sign up success!")
                                        let req = Auth.auth().currentUser?.createProfileChangeRequest()
                                        req?.displayName = "Admin"
                                        req?.commitChanges(completion: nil)
                                        isPresenting = true
                                    }
                                }
                            }
                        }
                    })
                    .foregroundStyle(.blue)
                    .padding()
                    .navigationBarBackButtonHidden()
                }
            }
            .background(AngularGradient(colors: [.blue, .yellow, .white, .green, .red], center: .center))
            .ignoresSafeArea()
            
            //RadialGradient(colors: [.blue, .yellow, .black, .green, .red], center: .center)
        }
    }
}

#Preview {
    ContentView()
}
