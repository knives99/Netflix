//
//  SearchResultViewController.swift
//  Netflix
//
//  Created by Bryan on 2022/1/18.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    public var titles = [Title]()
    
    public let collectionView:UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1)))
            item.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
            let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item])
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120)), subitem: group1, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    


}

extension SearchResultViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return titles.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as! TitleCollectionViewCell
        let model = titles.map { title in
            TitleTableViewCellViewModel(title: title.title ?? "unknown", imagePath: title.poster_path ?? "")
        }
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        cell.configure(model: model[indexPath.row].imagePath)
        return cell

    }
    
    
}
