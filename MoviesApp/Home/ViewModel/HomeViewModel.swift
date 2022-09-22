//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by marco rodriguez on 30/06/22.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    //Estamos creando una propiedad de la vista para evitar ciclos de retencion se usa weak
    private  weak var view: HomeView?
    private var router: HomeRouter?
    private var managerConnections = ManagerConnections()
    
    //Que vamos a enlazar la vista con el router
    func bind(view: HomeView, router: HomeRouter) {
        //Es como un inicializador
        self.view = view
        self.router = router
        
        //Bindear el router con la vista
        self.router?.setSourceView(view)
    }
    
    //devolver un obj de rxswift
    func getListMoviesData() -> Observable<[Movie]> {
        //instancia a la capa de conexion
        return managerConnections.getPopularMovies()
    }
    
    deinit {
        print("DEBUG: Se libero memoria")
    }
}
