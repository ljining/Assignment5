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
        
        bottomImageView.backgroundColor = .myOrange
        bottomImageView.layer.cornerRadius = 10
        bottomImageView.layer.masksToBounds = false
        
        bottomImageView.layer.shadowColor = UIColor.black.cgColor
        bottomImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        bottomImageView.layer.shadowOpacity = 0.1
        bottomImageView.layer.shadowRadius = 4
        
        bottomImageView.snp.makeConstraints { make in
            make.width.equalTo(123)
            make.height.equalTo(182)
            
            
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
            stackView.axis = .horizontal
            stackView.spacing = 2
            return stackView
        }()
        
        let innerStackView2: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 1
            return stackView
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "세이노의 가르침"
            label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
            label.textColor = UIColor.myBlack
            return label
        }()
        
        let priceLabel: UILabel = {
            let label = UILabel()
            label.text = "14,000"
            label.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
            label.textColor = UIColor.myBlack
            return label
        }()
        
        let authorLabel: UILabel = {
            let label = UILabel()
            label.text = "세이노"
            label.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
            label.textColor = UIColor.myGray
            return label
        }()
        
        contentView.addSubview(outerStackView)
        outerStackView.addArrangedSubview(bottomImageView)
        outerStackView.addArrangedSubview(innerStackView2)
        
        innerStackView1.addArrangedSubview(titleLabel)
        innerStackView1.addArrangedSubview(priceLabel)
        innerStackView2.addArrangedSubview(innerStackView1)
        innerStackView2.addArrangedSubview(authorLabel)
        
        outerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        innerStackView1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(2) // 원하는 왼쪽 간격 설정
            make.trailing.equalToSuperview().inset(3) // 원하는 오른쪽 간격 설정
        }
        
        innerStackView2.snp.makeConstraints { make in
            make.top.equalTo(bottomImageView.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(2) // 원하는 왼쪽 간격 설정
            make.trailing.equalToSuperview().inset(3) // 원하는 오른쪽 간격 설정
        }
        
    }
}
