//
//  SearchViewController.swift
//  Netflix
//
//  Created by Bryan on 2022/1/6.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var searchTimer : Timer?
    
    private let searchController:UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search for movie"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        navigationController?.navigationBar.tintColor = .white
        

    }
    
}

extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3 else{return}
        
        guard let resultsController = searchController.searchResultsController as? SearchResultViewController else {return}
        searchTimer?.invalidate()
        
        query.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed)
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { timer in
            APICaller.shared.search(with: query) { result in
                switch result{
                case .success(let titles):
                    DispatchQueue.main.async {
                        resultsController.titles = titles
                        resultsController.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        })
        


        
    }
}
