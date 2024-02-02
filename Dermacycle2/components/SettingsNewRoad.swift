//
//  SettingsNewRoad.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//
import SwiftUI

struct SettingsNewRoad: View {
    let imageName : String
    let titulo : String
    let tintColor : Color
    
    var body: some View {
        HStack (spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(titulo)
                .font(.subheadline)
                .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    SettingsNewRoad(imageName: "Gear", titulo: "Version", tintColor: Color(.systemGray))
}
