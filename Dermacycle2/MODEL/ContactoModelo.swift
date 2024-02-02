//
//  ContactoModelo.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import Foundation
struct responseServicioPromocion : Codable, Identifiable {
    
    
    let Promociones : [Promociones?]
    let Contacto : Contacto
  
    let Mensaje : String?
    var id: UUID?
    
}

struct Promociones : Codable, Identifiable {
    
    let Promociones : [String?]
    var id: UUID?
}
    
    
struct Contacto : Codable, Identifiable {
   
        let Direccion : String?
        let Telefono_1 : String?
        let Telefono_2 : String?
        let Telefono_3 : String?
        let Whatsapp : String?
        let Facbook : String?
        let Twitter : String?
        let Instagram : String?
        let Email : String?
        let Costo : String?
    var id: UUID?
        
    }


