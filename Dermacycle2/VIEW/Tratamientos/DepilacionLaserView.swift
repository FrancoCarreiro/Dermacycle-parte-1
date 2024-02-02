//
//  DepilacionLaserView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import SwiftUI

struct DepilacionLaserView: View {
    @StateObject var depilacionLaser = TratamientosDepilacionLaserViewModel() //creo una instancia del VM
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       
            NavigationView {
                VStack {
                    List(depilacionLaser.tratamientosDLModel, id:\.Id) { item in
                     NavigationLink{    //LINK HACIA LA DESCRIPCION DEL TRATAMIENTO
                            VStack{
                                Image(systemName: "person.fill")
                                    .loadImage(url: URL(string: item.Imagen!)!)
                                    .frame(width: 400, height: 200)
                                Text(item.Descripcion ?? "")
                            }
                        }
                    label: {      //UTILIZO ETIQUETA DE IMAGEN+TITULO+COPETE
                        ZStack{
                            
                            Image(systemName: "person.fill")
                                .loadImage(url: URL(string: item.Imagen!)!)
                                .frame(width: 400, height: 200)
                            VStack{
                                Text(item.Titulo ?? "")
                                    .font(.title)
                                Text(item.Copete ?? "")
                                    .font(.caption)
                            }
                        }
                    }
                    
                    } .task {
                        await depilacionLaser.fetchTratamientosDC()    //FUNCION PARA TRAER LOS TRATAMIENTOS
                    }
                    
                }
            } .navigationTitle("Depilacion Laser")
            // BACK BUTTON
                .navigationBarBackButtonHidden(true)
                .toolbar { content:  do {
                    ToolbarItem(placement:
                            .navigationBarLeading) {
                                Button(action: {
                                    presentationMode.wrappedValue
                                        .dismiss()
                                }, label: {
                                    Image("close_btn")
                                    
                                    Text("Back")
                                })
                            }
                }
                }
            
            
        }
    }



#Preview {
    DepilacionLaserView()
    
}

