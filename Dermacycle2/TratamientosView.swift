//
//  HomeView.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import SwiftUI

struct TratamientosView: View {
    var body: some View {
        NavigationStack {
            
            
            
            VStack{
                
                
                
                
                HStack {
                    ZStack(alignment: .leading){
                        
                        Image("PromotionHeader")      // FOTO DE ENCABEZADO
                            .resizable()
                            .frame(width: 400, height: 80)
                            .scaledToFill()
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("TRATAMIENTOS")
                                .font(.headline)
                                .bold()
                            Text("Conoce mas de nuestros Tratamientos")
                                .font(.system(size: 12))
                        }
                    }
                }
            }
            Spacer()
            
            VStack(spacing: 40){        // SE PRESENTAN LOS BOTONES CON LOS TRATAMIENTOS
                
                HStack {
                    ZStack{
                        VStack{
                            
                            NavigationLink("Tratamientos Faciales", destination: TratamientosFacialesView());
                        label: do {
                            
                            Image("FacialTreatment")
                            
                        }
                            
                        }
                        
                        
                    }
                    ZStack{
                        VStack{
                            NavigationLink("Depilacion Laser", destination: DepilacionLaserView());
                        label: do {
                            Image("HairRemoval")
                            
                        }
                            
                        }
                    }
                    
                }
                HStack {
                    ZStack{
                        VStack{
                            NavigationLink("Tratamientos Corporales", destination: TratamientosCorporalesView());
                        label: do {
                            
                            Image("CorporalTreatment")
                        }
                            
                        }
                        
                    }
                    
                    ZStack{
                        VStack{
                            NavigationLink("Estetica Masculina", destination: EsteticaMasculinaView());
                        label: do {
                            Image("MenTreatment")
                            
                        }
                            
                        }
                        
                    }
                    
                }
            }
            .buttonStyle(.bordered)
            
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    TratamientosView()
}
