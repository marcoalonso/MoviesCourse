//
//  HomeView.swift
//  MoviesApp
//
//  Created by marco rodriguez on 30/06/22.
//

import UIKit
import RxSwift


class HomeView: UIViewController {
    
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    //Es una propiedad de nuestro viewModel
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
        getData()
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
        
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "CustomMovieCell", bundle: nil), forCellReuseIdentifier: "CustomMovieCell")
    }
    
    private func getData() {
        viewModel.getListMoviesData()
        
        //manejar la concurrencia o hilos de RxSwift
            .subscribe(on: MainScheduler.instance) //quiero ejecutarlo dentro del hilo principal
            .observe(on: MainScheduler.instance) //quiero ejecutarlo dentro del hilo principal
        
        //subcribirme a el observable
            .subscribe(
                onNext: { movies in
                    self.movies = movies
                    self.reloadTableView()
                }, onError: { error in
                    print("DEBUG: error", error.localizedDescription)
                }, onCompleted: {
                }).disposed(by: disposeBag)

        //Dar por terminado la secuencia de RxSwift
        //
    }

    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }

}
extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomMovieCell.self)) as! CustomMovieCell
        cell.titleMovie.text = movies[indexPath.row].originalTitle
        cell.descriptionMovie.text = movies[indexPath.row].overview
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
