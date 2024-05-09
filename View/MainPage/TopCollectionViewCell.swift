//
//  TopCollectionViewCell.swift
//  BookSearching
//
//  Created by 이유진 on 5/2/24.
//

import UIKit
import SnapKit

class TopCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TopCollectionViewCell.self)
    
    let topImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TopCollectionViewCell {
    
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
            make.width.equalTo(123)
            make.height.equalTo(182)
        }
        
        topImageView.backgroundColor = .myOrange
        topImageView.layer.cornerRadius = 10
        topImageView.layer.masksToBounds = true
        
        topImageView.layer.shadowColor = UIColor.black.cgColor
        topImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        topImageView.layer.shadowOpacity = 0.1
        topImageView.layer.shadowRadius = 4
        
        topImageView.snp.makeConstraints { make in
            make.width.equalTo(123)
            make.height.equalTo(182)
        
        contentView.addSubview(shadowView)
            
        }
    }
}

