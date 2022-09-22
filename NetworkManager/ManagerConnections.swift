//
//  ManagerConnections.swift
//  MoviesApp
//
//  Created by marco rodriguez on 22/09/22.
//

import Foundation
import RxSwift

//llamadas a una APIRest con urlsession pero con RxSwift, para cuando mi instancia llame estos metodos, para cuando el server de la respuesta y se pinte de manera reactiva.

class ManagerConnections {
    
    //cuando este objeto cambie o mute Observable siempre se va estar observando
    func getPopularMovies() -> Observable<[Movie]>{
        
        //empaquetar en un closure para los observadores
        return Observable.create { observer in
            
            
            
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constants.URL.main+Constants.Endpoints.urlListPopularMovies+Constants.apiKey)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        print("DEBUG: movie: \(movies.listOfMovies[0])")
                        observer.onNext(movies.listOfMovies)
                    } catch  {
                        observer.onError(error)
                        print("DEBUG: Eror al parsear : "+error.localizedDescription)
                    }
                    
                } else if response.statusCode == 401 {
                    print("DEBUG: Error en el server")
                }
                
                //cuando la funcion que devuelve un observable, terminar
                observer.onCompleted()
            }.resume()
            
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }  //observable
        
    }
    
    func getDetailMovies() {
        
    }
}
