//
//  BottomCollectionViewCell.swift
//  BookSearching
//
//  Created by 이유진 on 5/2/24.
//

import UIKit
import SnapKit

class BottomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: BottomCollectionViewCell.self)
    
    let bottomImageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let authorLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupImageView()
        setupStackView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - BottomCollectionView Cell UI
extension BottomCollectionViewCell {
    func setupCell() {
        self.backgroundColor = .clear
    }
}


// MARK: - BottomCollectionView Image UI
extension BottomCollectionViewCell {
    
    func setupImageView() {
        
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
        
        shadowView.snp.makeConstraints { make in
//            make.width.equalTo(123)
//            make.height.equalTo(182)
        }
        
        bottomImageView.backgroundColor = .myOrange
        bottomImageView.layer.cornerRadius = 10
        bottomImageView.layer.masksToBounds = true
        
        bottomImageView.layer.shadowColor = UIColor.black.cgColor
        bottomImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        bottomImageView.layer.shadowOpacity = 0.1
        bottomImageView.layer.shadowRadius = 4
        
        bottomImageView.snp.makeConstraints { make in
//            make.width.equalTo(123)
//            make.height.equalTo(182)
//        
        contentView.addSubview(shadowView)
            
        }
    }
}

// MARK: - BottomCollectionView Label UI
extension BottomCollectionViewCell {
    func setupStackView() {
        let outerStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 7
            return stackView
        }()
        
        let innerStackView1: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 1
            return stackView
        }()
        
        let innerStackView2: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 5
            return stackView
        }()
        
        // titleLabel 설정
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        titleLabel.textColor = UIColor.myBlack

        // priceLabel 설정
        priceLabel.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        priceLabel.textColor = UIColor.myBlack

        // authorLabel 설정
        authorLabel.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        authorLabel.textColor = UIColor.myGray


        contentView.addSubview(outerStackView)
        outerStackView.addArrangedSubview(bottomImageView)
        outerStackView.addArrangedSubview(innerStackView2)
        
        innerStackView1.addArrangedSubview(titleLabel)
        innerStackView1.addArrangedSubview(authorLabel)
        innerStackView2.addArrangedSubview(innerStackView1)
        innerStackView2.addArrangedSubview(priceLabel)
        
        outerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
    }
}
