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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(searchBar)
        
        setupSearchBarUI()
    }
    
}

//MARK: - SearchBar
extension MainPageViewController: UISearchBarDelegate {
    
    func setupSearchBarUI() {
        
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.layer.cornerRadius = 20
        searchBar.layer.masksToBounds = true
        searchBar.layer.shadowColor = UIColor.black.cgColor
        searchBar.layer.shadowOffset = CGSize(width: 1, height: 2)
        searchBar.layer.shadowOpacity = 0.1
        searchBar.layer.shadowRadius = 4
        
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

