//
//  HomeView.swift
//  MoviesApp
//
//  Created by marco rodriguez on 30/06/22.
//

import UIKit

class HomeView: UIViewController {
    
    //Es una propiedad de nuestro viewModel
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
    }


}
