//
//  MainPageViewController.swift
//  BookSearching
//
//  Created by 이유진 on 5/1/24.
//

import UIKit
import SnapKit

class MainPageViewController: UIViewController {
    
    let searchBar = UISearchBar()
    
    let topCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let bottomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let topCollectionViewCell = TopCollectionViewCell()
    let bottomColletctionViewCell = BottomCollectionViewCell()
    
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let priceLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        [searchBar, topCollectionView, bottomCollectionView].forEach {
            view.addSubview($0)
        }
        
        setupCollectionView()
        setupSearchBarUI()
    }
    
}

//MARK: - SearchBar UI
extension MainPageViewController: UISearchBarDelegate {
    
    func setupSearchBarUI() {
        
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.layer.cornerRadius = 20
        searchBar.layer.masksToBounds = true
        searchBar.layer.shadowColor = UIColor.black.cgColor
        searchBar.layer.shadowOffset = CGSize(width: 2, height: 2)
        searchBar.layer.shadowOpacity = 0.1
        searchBar.layer.shadowRadius = 2
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            if let iconView = textField.leftView as? UIImageView {
                
                textField.layer.cornerRadius = 20
                textField.clipsToBounds = true
                
                iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
                iconView.tintColor = UIColor.myOrange
            }
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(95)
            make.leading.equalToSuperview().offset(27.5)
            make.trailing.equalToSuperview().inset(27.5)
            make.height.equalTo(43)
        }
    }
    
}

//MARK: - CollectionView UI
extension MainPageViewController {
    private func setupCollectionView() {
        configureTopCollectionView()
        configureBottomCollectionView()
    }
    
    private func configureTopCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 124, height: 182)
        layout.minimumLineSpacing = 25
        layout.scrollDirection = .horizontal
        
        topCollectionView.setCollectionViewLayout(layout, animated: false)
        
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: TopCollectionViewCell.identifier)
        topCollectionView.isScrollEnabled = true
        topCollectionView.showsHorizontalScrollIndicator = false
        
        topCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(67)
            make.leading.equalToSuperview().offset(27.5)
            make.size.equalTo(CGSize(width: 393, height: 182))
        }
        
    }
    
    private func configureBottomCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 124, height: 182)
        layout.minimumLineSpacing = 25
        layout.scrollDirection = .horizontal
        
        bottomCollectionView.setCollectionViewLayout(layout, animated: false)
        
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        bottomCollectionView.register(BottomCollectionViewCell.self, forCellWithReuseIdentifier: BottomCollectionViewCell.identifier)
        bottomCollectionView.isScrollEnabled = true
        bottomCollectionView.showsHorizontalScrollIndicator = false
        
        bottomCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topCollectionView.snp.bottom).offset(67)
            make.leading.equalToSuperview().offset(27.5)
            make.size.equalTo(CGSize(width: 393, height: 212))
        }
    }
    
}

// MARK: - CollectionView Event
extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topCollectionView {
            return 5
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCollectionViewCell.identifier, for: indexPath) as! TopCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BottomCollectionViewCell.identifier, for: indexPath) as! BottomCollectionViewCell
            return cell
        }
    }
    
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    
}
