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
