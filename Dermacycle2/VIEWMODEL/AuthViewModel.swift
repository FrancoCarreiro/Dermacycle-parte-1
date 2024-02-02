//
//  AuthViewModel.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {   //PROTOCOLO DE SEGURIDAD PARA CREAR USUARIO EN REGISTRACION VIEW
    var formIsValid: Bool {get}
}



class AuthViewModel: ObservableObject {
    
    @Published var currentUser : Usuario?
    @Published var userSession : FirebaseAuth.User?
    
  
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    
    // MARK: Funcion para iniciar sesion en Firebase
    
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("error al Sign In \(error.localizedDescription)")
        }
        
    }
    
    
    // MARK: funcion para crear nuevo usuario
     
    func createUser(email: String, password: String, nombreCompleto: String, numeroDeTelefono: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = Usuario(id: result.user.uid, nombreCompleto: nombreCompleto, numeroDeTelefono: numeroDeTelefono, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("usuario").document(user.id).setData(encodedUser)
            await fetchUser()
            print("SignUp")
        } catch {
            print("fallo al crear usuario", error.localizedDescription)
        }
        
        // MARK: funcion para traer la data del usuario
        
        
    }
        func fetchUser() async {
            guard let uid = Auth.auth().currentUser?.uid else {return}
      guard  let snapshot = try? await  Firestore.firestore().collection("usuario").document(uid).getDocument()
            else {return}
            self.currentUser = try? snapshot.data(as: Usuario.self)
            
       
        }
    
    // MARK: funcion para cerrar sesion
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("fallo al signout \(error.localizedDescription)")
        }
        
    }
    
    // MARK: FUNCION PARA EDITAR DATOS DEL USUARIO
    
    
    
    func edit(email: String, nombreCompleto: String, numeroDeTelefono: String) async throws {
        do {
            let db = Firestore.firestore()
            guard   let id = userSession?.uid else {return}
            
            try await   db.collection("usuario").document(id).setData(["email": email, "nombreCompleto": nombreCompleto, "numeroDeTelefono": numeroDeTelefono])
            await fetchUser()
            print("Document successfully updated")
        }
        catch {
            print("Error updating document: \(error)")
        }
    }
    
    
    // MARK: funcion para eliminar cuenta
    
    func deleteUser() {
        let user = Auth.auth().currentUser

        user?.delete { error in
          if let error = error {
           print("error al eliminar cuenta", error)
          } else {
              self.userSession = nil
              self.currentUser = nil
            print("cuenta eliminada")
          }
        }
    }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
   
