//
//  BookmarkPageViewController.swift
//  BookSearching
//
//  Created by 이유진 on 5/3/24.
//

import UIKit
import SnapKit

class BookmarkPageViewController: UIViewController {
    
    var bookData: BookData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupButtons()
        bookList()
        
    }
    
}

// MARK: - AllDeleteButton/AddButton UI
extension BookmarkPageViewController {
    
    private func setupButtons() {
        
        let buttonStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.spacing = CGFloat(254)
            return stackView
        }()
        
        let allDeleteButton: UIButton = {
            let button = UIButton()
            button.setTitle("전체 삭제", for: .normal)
            button.setTitleColor(UIColor.myGray2, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            return button
        }()
        
        let addButton: UIButton = {
            let button = UIButton()
            button.setTitle("추가", for: .normal)
            button.setTitleColor(UIColor.myOrange, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            return button
        }()
        
        view.addSubview(buttonStackView)
        
        [allDeleteButton, addButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(88)
            make.leading.equalToSuperview().offset(34)
        }
    }
    
}

// MARK: - BookList UI
extension BookmarkPageViewController {
    
    private func bookList() {
        
        let bookListCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.indicatorStyle = .default
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(BookmarkListCollectionViewCell.self, forCellWithReuseIdentifier: "BookmarkListCollectionViewCell")

            return collectionView
        }()
      
        view.addSubview(bookListCollectionView)
        
        bookListCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(145)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(700)
            make.width.equalTo(323)
        }
        
    }
    
}

// MARK: - CollectionView DataSource/Delegate
extension BookmarkPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CoreDataManager.shared.readBookmark().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookmarkListCollectionViewCell.identifier, for: indexPath) as! BookmarkListCollectionViewCell
        
        let bookData = CoreDataManager.shared.readBookmark()[indexPath.item]
        
        cell.titleLabel.text = bookData.title
        cell.authorLabel.text = bookData.authors
        cell.priceLabel.text = "\(bookData.price)\("원")"
        
        if let url = URL(string: bookData.thumbnail ?? "") {
            cell.bookcoverImageView.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let bookInfoPage = tabBarController?.viewControllers?[2] as? BookInfoPageViewController {
            
            let selectedBookData = CoreDataManager.shared.readBookmark()[indexPath.item]
            if let bookInfoPage = tabBarController?.viewControllers?[2] as? BookInfoPageViewController {
                
            }
            
            tabBarController?.selectedIndex = 2
            navigationController?.pushViewController(bookInfoPage, animated: true)
        }
    }
}

// MARK: - CollectionView FlowLayout
extension BookmarkPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width: CGFloat = 393
            let height: CGFloat = 182
            return CGSize(width: width, height: height)
    }
}
