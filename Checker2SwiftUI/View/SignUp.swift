//
//  SignUp.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 24.04.2023.
//

import SwiftUI

struct SignUp: View {
    
    @State var message = ""
    @State var alert = false
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    
    @State var show = false
    
    var body: some View {
        VStack {
            VStack {
                VStack{
                    VStack{
                        VStack(alignment: .leading) {
                            Text("SignUp")
                                .font(.custom("Gilroy-Bold", size: 28))
                                .padding()
                            
                            VStack(alignment: .trailing, spacing: 2) {
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("Email")
                                        HStack(spacing: 15) {
                                            Image(systemName: "envelope.fill")
                                            TextField("Your name", text: $email)
                                                .font(.custom("Gilroy-Regular", size: 14))
                                        } .border(.black)
                                            .opacity(0.6)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Password")
                                        HStack(spacing: 15) {
                                            Image(systemName: "eye.slash.fill")
                                            TextField("Your Password", text: $pass)
                                        } .border(.black)
                                            .opacity(0.6)
                                    }
                                    
//                                        VStack(alignment: .leading) {
//                                            Text("Confirm password")
//                                            HStack(spacing: 15) {
//                                                Image(systemName: "eye.slash.fill")
//                                                TextField("Confirm Password", text: $pass)
//                                            } .border(.black)
//                                                .opacity(0.6)
//                                        }
                                    
                                } .padding()
                                    .textFieldStyle(.roundedBorder)
                                
                                
//                                    Button {
//                                        print("Forgot password?")
//                                    } label: {
//                                        Text("Forgot password?")
//                                    } .padding(.horizontal)
                                
                            }
                        }
                        
                        Button {
                                print("Auth")
                            signUpWithEmail(email: email, password: pass) { verified, status in
                                if !verified {
                                    self.message = status
                                    self.alert.toggle()
                                } else {
                                    UserDefaults.standard.set(true, forKey: "status")
                                    self.show.toggle()
                                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                }
                            }
                            
                        } label: {
                            Spacer()
                            Text( "Registration")
                                .font(.custom("Gilroy-Regular", size: 14))
                                .padding(4)
                            Spacer()
                        }

                        .tint(Color.green)
                        .padding()
                        .buttonStyle(.borderedProminent).cornerRadius(4)
                    }

                    HStack(spacing: 15) {
                        Rectangle()
                            .frame(height: 1)
                        Text("or continue with")
                            .font(.custom("Gilroy-Regular", size: 14))
                        Rectangle()
                            .frame(height: 1)
                    } .padding(.horizontal, 30)
                }
                Spacer()
                HStack(spacing: 30) {
                    Image("fb")
                    Image("google")
                }
                Spacer()
            }
            
//            HStack(spacing: 15) {
//                Text("Don't have an account?")
//                Button {
//                    //
//                } label: {
//                    Text("SignUp")
//                }
//
//            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
