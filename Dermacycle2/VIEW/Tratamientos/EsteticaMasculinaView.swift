//
//  EsteticaMasculinaView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import SwiftUI

struct EsteticaMasculinaView: View {
    @StateObject var esteticaMasculina =  TratamientosEsteticaMasculinaViewModel() //creo una instancia del VM
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
      //  ScrollView{
            NavigationView {
                VStack {
                    List(esteticaMasculina.tratamientosEmModel, id:\.Id) { item in
                        NavigationLink{     //LINK HACIA LA DESCRIPCION DEL TRATAMIENTO
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
                        await  esteticaMasculina.fetchTratamientosEM()    //FUNCION PARA TRAER LOS TRATAMIENTOS
                    }
                    
                }
            } .navigationTitle("Estetica Masculina")
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
  //  }
}


#Preview {
    EsteticaMasculinaView()
}

