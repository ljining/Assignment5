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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupSubviews()
        
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
        
        let bookcoverImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "bookCover"))
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            return imageView
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "세이노의 가르침"
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = UIColor.myBlack
            return label
        }()
        
        let authorLabel: UILabel = {
            let label = UILabel()
            label.text = "저자: 세이노"
            label.font = UIFont.systemFont(ofSize: 9, weight: .bold)
            label.textColor = UIColor.myBlack
            return label
        }()
        
        let priceabel: UILabel = {
            let label = UILabel()
            label.text = "14,000원"
            label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
            label.textColor = UIColor.myBlack
            return label
        }()
        
        let bookmarkButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "tap1_selected"), for: .normal)
            button.setImage(UIImage(named: "bookMark"), for: .selected)
            button.addTarget(self, action: #selector(bookMarkButtonTapped(_:)), for: .touchUpInside)
            return button
        }()
        
        [shadowView, bookcoverImageView, titleLabel, authorLabel, priceabel, bookmarkButton].forEach {
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
        
        priceabel.snp.makeConstraints { make in
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
    
    // 버튼 탭 이벤트 핸들러
    @objc func bookMarkButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
