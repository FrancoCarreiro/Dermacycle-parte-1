//
//  UsuarioModelo.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import Foundation
import Firebase


struct Usuario: Identifiable, Codable {
    var id: String
    var nombreCompleto: String
    var numeroDeTelefono: String
    var email: String
    
    
    
}
