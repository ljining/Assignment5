//
//  BookInfoPageViewController.swift
//  BookSearching
//
//  Created by 이유진 on 5/3/24.
//

import UIKit
import SnapKit

class BookInfoPageViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let bookCoverImageView = UIImageView()
    let authorLabel = UILabel()
    let authorNameLabel = UILabel()
    let summaryLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        backgroundView()
        setupStack()
        setupTopLabel()
        setupBookCover()
        setupAuthorLabel()
        setupSummaryLabel()
        
    }
    
}

extension BookInfoPageViewController {
    
    // MARK: - Background UI
    
    private func backgroundView() {
        

        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true

        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        [backgroundImageView, blurView].forEach {
            view.addSubview($0)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    // MARK: - TopStackView UI
    
    private func setupBookMarkButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: "bookMark"), for: .normal)
        button.setImage(UIImage(named: "tap1_selected"), for: .selected)
        button.addTarget(self, action: #selector(bookMarkButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    // 버튼 탭 이벤트 핸들러
    @objc func bookMarkButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    private func setupInfoLabel() -> UILabel {
        let label = UILabel()
        label.text = "Info"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.white
        label.shadowColor = UIColor.black
        label.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 4
        return label
    }
    
    private func setupStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 286
        return stackView
    }
    
    private func setupStack() {
        
        let bookMarkButton = setupBookMarkButton()
        let infoLabel = setupInfoLabel()
        let stackView = setupStackView()
        
        view.addSubview(stackView)
        [infoLabel, bookMarkButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(88)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().inset(34)
            make.height.equalTo(19)
        }
        
    }
    
    
    // MARK: - Title/Price Label UI
    
    private func setupTopLabel() {
        
        titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        priceLabel.textColor = UIColor.white
        priceLabel.textAlignment = .center
        
        
        [titleLabel, priceLabel].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(682)
            make.centerX.equalToSuperview()
            make.width.equalTo(219)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
    }
    
    // MARK: - BookCover Iamge UI
    
    private func setupBookCover() {
        
        bookCoverImageView.contentMode = .scaleAspectFill
        bookCoverImageView.clipsToBounds = true
        bookCoverImageView.layer.cornerRadius = 10
        
        view.addSubview(bookCoverImageView)
        
        bookCoverImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.centerX.equalToSuperview()
            make.width.equalTo(219)
            make.height.equalTo(324)
        }
        
    }
    
    
    // MARK: - Author Label
    
    private func setupAuthorLabel() {
        
        //
        authorNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        authorNameLabel.textColor = UIColor.white
        authorNameLabel.shadowColor = UIColor.black
        authorNameLabel.shadowOffset = CGSize(width: 0, height: 0)
        authorNameLabel.layer.shadowOpacity = 0.1
        authorNameLabel.layer.shadowRadius = 4
        
        view.addSubview(authorNameLabel)
        
        authorNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(575)
            make.leading.equalToSuperview().offset(56.5)
            make.trailing.equalToSuperview().inset(56.5)
        }
        
    }
    
    // MARK: - SummaryLabel()
    private func setupSummaryLabel() {
        
        let summaryScroll: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.indicatorStyle = .white
            return scrollView
        }()
        
        summaryLabel.numberOfLines = 0
        summaryLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        summaryLabel.textColor = UIColor.white
        summaryLabel.shadowColor = UIColor.black
        summaryLabel.shadowOffset = CGSize(width: 0, height: 0)
        summaryLabel.layer.shadowOpacity = 0.1
        summaryLabel.layer.shadowRadius = 4
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4 // 원하는 줄 간격으로 설정
        
        // Attributed Text 설정
        let attributedString = NSAttributedString(string: summaryLabel.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        summaryLabel.attributedText = attributedString
        
        
        view.addSubview(summaryScroll)
        summaryScroll.addSubview(summaryLabel)
        
        summaryScroll.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(600)
            make.leading.equalToSuperview().offset(56.5)
            make.trailing.equalToSuperview().inset(56.5)
            make.height.equalTo(80)
            make.width.equalTo(280)
        }
        
        summaryLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(summaryScroll)
        }
        
    }
    
}
