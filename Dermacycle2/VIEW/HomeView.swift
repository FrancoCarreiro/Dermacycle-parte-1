//
//  HomeView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 23/01/2024.
//

import SwiftUI

struct HomeView: View {
    let urlShare = URL(string: "https://dermacycle.com.ar/es/")
    
    
    var body: some View {
        NavigationStack{
            VStack{            //ENCABEZADO DE TODA LA APP + SHARE BUTTON
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                    
                    
                    
                    Image("Logo")
                    
                        .frame(width: 400, height: 80)
                        .background(.black)
                    
                    
                    
                    
                    ShareLink(item: urlShare!)
                        .foregroundColor(.white)
                }
            }
            
            TabView {         //TABVIEW CON LAS 5 CATEGORIAS DE LA APP
                TratamientosView()
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                PromocionesView()
                    .tabItem {
                        Label("", systemImage: "megaphone")
                        
                    }
                NotificacionesView()
                    .tabItem {
                        Label("", systemImage: "bell") }
                
                UserView()
                    .tabItem {
                        Label("", systemImage: "person")
                        
                    }
                CalendarioView()
                    .tabItem {
                        Label("", systemImage: "calendar")
                    }
                
            }
            
            
        }
    }
}
#Preview {
    HomeView()
}
