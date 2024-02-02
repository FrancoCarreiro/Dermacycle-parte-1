//
//  TratamientosCorporalesViewModel.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import Foundation

class TratamientosCorporalesViewModel: ObservableObject {
   
 
   @Published var tratamientosCModel : [Tratamientos] = []
 
   
   
   func fetchTratamientosC() async {   //METODO PARA DECODIFICAR LOS TRATAMIENTOS CORPORALES
       
       var request = URLRequest(url: URL(string: "https://api-dermacycle.clearsky.com.ar/Tratamiento.ashx?Tipo=TC")!, timeoutInterval: Double.infinity)
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       request.addValue("Dermacycle2018", forHTTPHeaderField: "User")
       request.addValue("7c4e22f4-6a6c-48de-b1c9-075979233ce5", forHTTPHeaderField: "Password")
       request.addValue("iPhone 7", forHTTPHeaderField: "Dispositivo")
       request.addValue("iOS 11.2.2", forHTTPHeaderField: "VersionSO")
       request.addValue("1.0.1", forHTTPHeaderField: "VersionAPP")

       request.httpMethod = "GET"
       
       do {
         
           let (data, _) = try await URLSession.shared.data(for: request)
           let json = try JSONDecoder().decode(responseTratamientos.self, from: data)
         
           self.tratamientosCModel = json.Tratamientos
       } catch let error as NSError {
           print("error en la API", error.localizedDescription)
       }
   }
}
