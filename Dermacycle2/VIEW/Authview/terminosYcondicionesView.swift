//
//  terminosYcondicionesView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 25/01/2024.
//

import SwiftUI

struct terminosYcondicionesView: View {
    @EnvironmentObject var viewModelAuth: AuthViewModel
    var body: some View {
        Text("TERMINOS Y CONDICIONES")
        
        
        Section {
        Button(action: {
            viewModelAuth.signOut()
            
            
        }){
            Text("Sign out")
        }
    }


    }
}

#Preview {
    terminosYcondicionesView()
}
