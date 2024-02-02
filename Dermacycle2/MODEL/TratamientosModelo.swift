//
//  TratamientosModelo.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import Foundation
import SwiftUI

//MODELO DE LA LISTA DE TRATAMIENTOS

struct responseTratamientos : Codable {
    
    let Tratamientos : [Tratamientos]
    let Mensaje : String?
    
    
}


struct Tratamientos : Codable {
    
    var Id: Int?
    let Categoria : String?
    let TipoLetra : String?
    let Imagen : String?
    let Titulo : String?
    let Copete : String?
    let Descripcion : String?
    
    
}

extension Image {    //TRANSFORMAR EL STRING DE LA URL DE LA IMAGEN EN UNA UIIMAGE
    
    func loadImage(url: URL) -> Self {
        if let loadImage = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: loadImage)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
