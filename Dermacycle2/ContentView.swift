//
//  ContentView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    let urlShare = URL(string: "https://dermacycle.com.ar/es/")
    @EnvironmentObject var viewModelAuth : AuthViewModel
    
    var body: some View {
      
             Group {      //Si entra un usuario logeado lo mandamos al perfil
                if viewModelAuth.userSession != nil {
                    
                          ProfileView()
                } else {     //Sino lo mandamos a la pagina de inicio
                  HomeView()
                }
        }

    }
    
}

#Preview {
    ContentView()
}
