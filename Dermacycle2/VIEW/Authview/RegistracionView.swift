//
//  RegistracionView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//


import SwiftUI

struct RegistracionView: View {
    @State private var agreedToTerms = false
    @State private var nombreCompleto = ""
    @State private var telefono = ""
    @State private var email = ""
    @State private var numeroDeTelefono = ""
    @State private var password = ""
    @State private var confirmePassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModelAuth: AuthViewModel
    
    
    var body: some View {
        
        Form {
            Section{
                VStack {
                    
                    
                    // MARK: FORMULARIO PARA CREAR NUEVO USUARIO
                    
                    VStack (spacing: 24) {
                        
                        InputView(text: $nombreCompleto, title: "Nombre Completo", placeholder: "")
                        
                        
                        InputView(text: $numeroDeTelefono, title: "Numero de Telefono", placeholder:  "")
                        
                        
                        InputView(text: $email, title: "Correo Electronico", placeholder: "nombre@ejemplo.com")
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                        
                        InputView(text: $password, title: "Contraseña", placeholder: "Ingrese su contraseña", isSecureField: true)
                        
                        ZStack(alignment: .trailing) {
                            
                            
                            InputView(text: $confirmePassword, title: "Confirmar contraseña", placeholder: "Repita su contraseña", isSecureField: true)
                            if !password.isEmpty && !confirmePassword.isEmpty {
                                if password == confirmePassword {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    
                }
                // MARK: TERMINOS Y CONDICIONES
                Section {
                    NavigationLink(destination: terminosYcondicionesView()) {
                        
                        Toggle(isOn: $agreedToTerms, label: {
                            Text("Acepto los terminos y condiciones")
                        })
                    }
                }
                
                // MARK: BOTON DE SIGN UP + CREAR USUARIO
                Section {
                    Button(action: {
                        Task {
                            try await viewModelAuth.createUser(email: email, password:password, nombreCompleto: nombreCompleto, numeroDeTelefono:numeroDeTelefono)
                        }
                    }
                    ){
                        
                        HStack {
                            Text("SIGN UP")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    
                    
                    .clipShape(.capsule)
                    .padding(.top, 24)
                    
                    
                    
                    
                } .disabled(agreedToTerms == false && formIsValid) //si no acepta term y cond no se habilita el boton de crear usuario
                    
            }
        }
                // MARK: BOTON DE VOLVER A LOGIN VIEW
                
        Spacer()
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Ya tienes una cuenta?")
                        Text("SIGN IN")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                    }
                }
                
            
        
    }
}
// MARK: PROTOCOLO DE SEGURIDAD PARA AUTENTICAR USUARIO

extension RegistracionView: AuthenticationFormProtocol { //PROTOCOLO DE REQUISITOS DE SEGURIDAD PARA CREAR USER
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmePassword == password
        && !nombreCompleto.isEmpty
        && !numeroDeTelefono.isEmpty
    }
    
    
} 

#Preview {
    RegistracionView()
}
