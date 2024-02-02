//
//  UserView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import SwiftUI


struct UserView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModelAuth : AuthViewModel
    
    
    var body: some View{
        NavigationStack {
            VStack {
                Text("INGRESA A TU CUENTA")
                    .fontWeight(.bold)
                    .font(.title)
                
                Divider()
                
                Text("Con tu acceso vas a poder acceder a tus turnos confirmados o reprogramarlos. Y acceder a las mejores ofertas y novedades")
                
                
                // MARK: FORM FIELDS
                
                VStack (spacing: 24) {
                    InputView(text: $email, title: "Correo Electronico", placeholder: "nombre@ejemplo.com")
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    
                    
                    InputView(text: $password, title: "Contraseña", placeholder: "Ingrese su contraseña", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                // MARK:    SIGN IN BUTTON
                
                Button(action: {
                    Task {
                    try await    viewModelAuth.signIn(email: email, password: password) }
                    }){
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .opacity(formIsValid ? 1.0 : 0.5)
                .clipShape(.capsule)
                .padding(.top, 24)
                }
                
               
                   
                
                
                
                
                Spacer()
                
            // MARK: sign up  link
                
                NavigationLink {
                    RegistracionView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("No tienes una cuenta?")
                        Text("SIGN UP")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                    }
                }
                
                
            }
        }
        
    }
    

        extension UserView: AuthenticationFormProtocol { //PROTOCOLO DE REQUISITOS DE SEGURIDAD PARA CREAR USER
            var formIsValid: Bool {
                return !email.isEmpty
                && email.contains("@")
                && !password.isEmpty
                && password.count > 5
                
            }
            
            
        }
        
        
        struct tratamientosView_Previews: PreviewProvider {
            static var previews: some View {
                UserView()
            }
        }
    
