//
//  HomeRouter.swift
//  MoviesApp
//
//  Created by marco rodriguez on 30/06/22.
//

//Esta clase creará mi ob home y servira de router para ir a otras vistas/pantallas

import Foundation
import UIKit

class HomeRouter {
    var viewController : UIViewController {
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    private func createViewController() -> UIViewController {
        let view = HomeView(nibName: "HomeView", bundle: Bundle.main)
        return view
    }
    
    //
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else { fatalError("Error desconocido")}
        self.sourceView = view
    }
}
