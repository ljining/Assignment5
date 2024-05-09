//
//  BookmarkPageViewController.swift
//  BookSearching
//
//  Created by 이유진 on 5/3/24.
//

import UIKit
import SnapKit

class BookmarkPageViewController: UIViewController {
    
    var bookListCollectionView: UICollectionView!
    var bookData: BookData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupButtons()
        setupbookList()
        
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
            button.addTarget(self, action: #selector(handleAllDelete), for: .touchUpInside)
            return button
        }()
        
        let addButton: UIButton = {
            let button = UIButton()
            button.setTitle("추가", for: .normal)
            button.setTitleColor(UIColor.myOrange, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            button.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
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
    
    // All Delete Button
    @objc private func handleAllDelete() {
        CoreDataManager.shared.deleteAllBookmarks()
        print("Deleted")
        
        bookListCollectionView.reloadData()
    }
    // Add Button
    @objc private func handleAdd() {
        tabBarController?.selectedIndex = 1
        print("Turned to MainPage")
    }
    
}

// MARK: - BookList UI
extension BookmarkPageViewController {
    
    private func setupbookList() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        bookListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        bookListCollectionView.indicatorStyle = .default
        bookListCollectionView.dataSource = self
        bookListCollectionView.delegate = self
        bookListCollectionView.register(BookmarkListCollectionViewCell.self, forCellWithReuseIdentifier: "BookmarkListCollectionViewCell")
        
        
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
        
        // BookmarkButton 탭, 저장 & 삭제
        cell.bookmarkButtonTappedHandler = { [weak self] in
            guard let self = self else { return }
            if cell.bookmarkButton.isSelected == false {
                self.showDeleteConfirmationAlert(at: indexPath)
            } else {
                print("Why")
            }
        }
        
        cell.configureBookmarkButton()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let bookInfoPage = tabBarController?.viewControllers?[2] as? BookInfoPageViewController {
            tabBarController?.selectedIndex = 2
            navigationController?.pushViewController(bookInfoPage, animated: true)
        }
    }
    
    private func showDeleteConfirmationAlert(at indexPath: IndexPath) {
        
        let existingBookmarks = CoreDataManager.shared.readBookmark()
        let bookmarkToDelete = existingBookmarks[indexPath.item]
        
        let alertController = UIAlertController(title: "", message: "이 책을 목록에서 삭제하시겠습니까?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "삭제", style: .default) { _ in
            
            CoreDataManager.shared.deleteBookmark(bookmark: bookmarkToDelete)
            print("Delete")
            self.bookListCollectionView.reloadData()
        }
        
        alertController.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
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
