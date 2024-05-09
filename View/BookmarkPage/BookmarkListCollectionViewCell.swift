//
//  BookmarkListCollectionViewCell.swift
//  BookSearching
//
//  Created by 이유진 on 5/4/24.
//

import UIKit
import SnapKit

class BookmarkListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: BookmarkListCollectionViewCell.self)
    
    let bookcoverImageView = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let priceLabel = UILabel()
    let bookmarkButton = UIButton()
    
    var bookData: Document?
    var bookmarkButtonTappedHandler: (() -> Void)?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupSubviews()
        configureBookmarkButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - BottomCollectionView Cell UI
extension BookmarkListCollectionViewCell {
    func setupCell() {
        self.backgroundColor = .clear
    }
}


extension BookmarkListCollectionViewCell {
    
    func setupSubviews() {
        
        let shadowView: UIImageView = {
            let view = UIImageView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 10
            view.layer.masksToBounds = false
            
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 3, height: 3)
            view.layer.shadowOpacity = 0.1
            view.layer.shadowRadius = 4
            return view
        }()
        
        bookcoverImageView.contentMode = .scaleAspectFill
        bookcoverImageView.layer.cornerRadius = 10
        bookcoverImageView.clipsToBounds = true
        
        titleLabel.text = "세이노의 가르침"
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.textColor = UIColor.myBlack
        
        authorLabel.text = "저자: 세이노"
        authorLabel.font = UIFont.systemFont(ofSize: 9, weight: .bold)
        authorLabel.textColor = UIColor.myBlack
        
        priceLabel.text = "14,000원"
        priceLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        priceLabel.textColor = UIColor.myBlack
        
        
        bookmarkButton.setImage(UIImage(named: "tap1_selected"), for: .normal)
        bookmarkButton.setImage(UIImage(named: "bookMark"), for: .selected)
        
        [shadowView, bookcoverImageView, titleLabel, authorLabel, priceLabel, bookmarkButton].forEach {
            contentView.addSubview($0)
        }
        
        shadowView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView).offset(35)
            make.height.equalTo(182)
            make.width.equalTo(123)
        }
        
        bookcoverImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView).offset(35)
            make.height.equalTo(182)
            make.width.equalTo(123)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(bookcoverImageView.snp.top).offset(8)
            make.leading.equalTo(bookcoverImageView.snp.trailing).offset(25)
            make.width.equalTo(151)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.trailing.equalTo(titleLabel)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.top.equalTo(bookcoverImageView.snp.top).offset(5)
            make.leading.equalTo(titleLabel.snp.trailing).offset(8)
            make.width.equalTo(15)
        }
        
    }
    
    @objc private func bookmarkButtonTapped(_ sender: UIButton) {
        bookmarkButtonTappedHandler?()
        }
    
    func configureBookmarkButton() {
            bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped(_:)), for: .touchUpInside)
        }
}

