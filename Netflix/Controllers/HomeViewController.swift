//
//  HomeViewController.swift
//  Netflix
//
//  Created by Bryan on 2022/1/6.
//

import UIKit

enum Sections:Int {
    case TrendingMovies = 0
    case TrendingTV = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
    
}

//MARK: - NavBar偏移  左上角LOGO的顏色與偏移

class HomeViewController: UIViewController {
    
    var sectionTitles = ["Trending Movies","Trending TV","Popular","Upcoming","Top rated","E","F"]
    
    private let homeFeedTable:UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        configureNavBar()
        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
        homeFeedTable.tableHeaderView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 450))
    }
    
    
    private func configureNavBar(){
        var image = UIImage(named: "N")
        //左上角LOGO的顏色(使用原始素材)與偏移
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem  = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: -82 , bottom: 0, right: 0)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    

}

extension HomeViewController :UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeFeedTable.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as! CollectionViewTableViewCell
        switch indexPath.section{
        case  Sections.TrendingMovies.rawValue:
            APICaller.shared.getTrendingMovies { result in
                switch result{
                case .success(let result ):
                    cell.configure(with: result.results)
                case.failure(let error):
                    print(error)
                }
            }
        case Sections.TrendingTV.rawValue:
            APICaller.shared.getTrendingTV { result in
                switch result{
                case .success(let result ):
                    DispatchQueue.main.async {
                        cell.configure(with: result)
                    }
                   
                case.failure(let error):
                    print(error)
                }
            }
        case Sections.Popular.rawValue:
            APICaller.shared.getPopularMovie { result in
                switch result{
                case .success(let result):
                    cell.configure(with: result)
                case.failure(let error):
                    print(error)
                }
            }
        case Sections.Upcoming.rawValue:
            APICaller.shared.getUpcomingMovie { result in
                switch result{
                case .success(let result):
                    cell.configure(with: result)
                case .failure(let error):
                    print(error)
                }
            }
            
        case Sections.TopRated.rawValue:
            APICaller.shared.getTopRatedMoview { result in
                switch result{
                case .success(let result):
                    cell.configure(with: result)
                case .failure(let error):
                    print(error)
                }
            }
        default :
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
//        header.textLabel?.text = sectionTitles[section]
        header.textLabel?.font  = .systemFont(ofSize: 18, weight: .regular)
//        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y , width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section].capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    //NavBar偏移
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform  = .init(translationX: 0, y: min(0, -offset))
    }
    
}
