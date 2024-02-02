//
//  NotificacionesView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import SwiftUI

struct NotificacionesView: View {
    
    @StateObject var datosContacto = promocionesViewModel()
    var body: some View {
        VStack{
            Spacer()
            Text("Nuestra forma de comunicarnos con vos")
            
            
            // DATOS DE CONTACTO
            
            List(datosContacto.dataContacto){ item in
                
                HStack {
                    Menu {
                        Button(item.Telefono_1!) {}
                        Button(item.Telefono_2!) {}
                        Button(item.Telefono_3!) {}
                    } label: {
                        Label("", systemImage: "phone.circle.fill")
                    }
                    Menu {
                        Button(item.Facbook!) {}
                        Button(item.Twitter!) {}
                        Button(item.Instagram!) {}
                    } label: {
                        Label("", systemImage: "person.circle.fill")
                    }
                    Menu {
                        Button(item.Email!) {}
                    } label: {
                        Label("", systemImage: "envelope.circle.fill")
                    }
                    Menu {
                        Button(item.Whatsapp!) {}
                    } label: {
                        Label("", systemImage: "phone.circle.fill")
                    }
                    Menu {
                        Button(item.Direccion!) {}
                    } label: {
                        Label("", systemImage: "paperplane.circle.fill")
                    }
                }
                .padding()
                
            }
            .task {
                await datosContacto.fetchContacto()
            }
        }
    }
}
#Preview {
    NotificacionesView()
}
