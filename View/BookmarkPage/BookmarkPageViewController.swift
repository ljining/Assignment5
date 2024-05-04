//
//  BookmarkPageViewController.swift
//  BookSearching
//
//  Created by 이유진 on 5/3/24.
//

import UIKit

class BookmarkPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        
        setupButtons()
        bookList()
        
    }
    
}

// MARK: - AllDeleteButton/AddButton UI
extension BookmarkPageViewController {
    
    func setupButtons() {
        
        let labelStackView: UIStackView = {
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
        
        view.addSubview(labelStackView)
        
        [allDeleteButton, addButton].forEach {
            labelStackView.addArrangedSubview($0)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(88)
            make.leading.equalToSuperview().offset(34)
        }
    }
    
}

// MARK: - BookList UI
extension BookmarkPageViewController {
    
    func bookList() {
        
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
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookmarkListCollectionViewCell.identifier, for: indexPath) as! BookmarkListCollectionViewCell
        return cell
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


