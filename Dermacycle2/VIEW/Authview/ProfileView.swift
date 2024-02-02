//
//  ProfileView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    @EnvironmentObject var viewModelAuth: AuthViewModel
    @State var email = ""
    @State var nombreCompleto = ""
    @State var numeroDeTelefono = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            if let user = viewModelAuth.currentUser {
                List {
                    Section{
                        
                        VStack {
                            TextField(user.email, text: $email)
                            textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField(user.nombreCompleto, text: $nombreCompleto)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField(user.numeroDeTelefono, text: $numeroDeTelefono)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            // MARK: BOTON DE EDITAR DATOS
                        }
                        
                        Button(action: {
                            Task {
                                try   await viewModelAuth.edit(email: email, nombreCompleto: nombreCompleto, numeroDeTelefono: numeroDeTelefono)
                                
                            }
                        }){
                            Text("EDITAR")
                        }
                        
                        
                        
                    }
                    // MARK: BOTON DE IR A HOME VIEW
                    Section {
                        NavigationLink {
                            HomeView()
                        } label: {
                            Text("VOLVER A PAGINA PRINCIPAL")
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                        }
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    // MARK: BOTON DE SIGN OUT
                    
                    Section {
                        Button{
                            viewModelAuth.signOut()
                            
                            
                        } label:
                        {
                            SettingsNewRoad(imageName: "arrow.left.circle.fill", titulo: "SIGN OUT", tintColor: Color(.systemBlue))
                        }
                        
                        
                        
                        // MARK: BOTON DE ELIMINAR CUENTA
                        
                        Button{
                            viewModelAuth.deleteUser()
                            
                            
                        } label:
                        {
                            SettingsNewRoad(imageName: "xmark.circle.fill", titulo: "ELIMINAR CUENTA", tintColor: Color(.red))
                            
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    ProfileView()
}

