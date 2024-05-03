//
//  BookInfoPageViewController.swift
//  BookSearching
//
//  Created by 이유진 on 5/3/24.
//

import UIKit

class BookInfoPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        backgroundView()
        setupStackView()
        setupTopLabel()
        setupBookCover()
        setupAuthorLabel()
        setupSummaryLabel()
        
    }
    
}

extension BookInfoPageViewController {
    
    // MARK: - Background UI
    
    func backgroundView() {
        
        let backgroundImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "bookCover"))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }()
        
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
    
    func setupBookMarkButton() -> UIButton {
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
    
    func setupInfoLabel() -> UILabel {
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
    
    func setupStackView() {
        
        let bookMarkButton = setupBookMarkButton()
        let infoLabel = setupInfoLabel()
        
        let topStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 286
            return stackView
        }()
        
        view.addSubview(topStackView)
        [infoLabel, bookMarkButton].forEach {
            topStackView.addArrangedSubview($0)
        }
        
        topStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(88)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().inset(34)
            make.height.equalTo(19)
        }
    }
    
    
    // MARK: - Title/Price Label UI
    
    func setupTopLabel() {
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "세이노의 가르침"
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            label.textColor = UIColor.white
            return label
        }()
        
        let priceLabel: UILabel = {
            let label = UILabel()
            label.text = "14,000원"
            label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            label.textColor = UIColor.white
            return label
        }()
        
        [titleLabel, priceLabel].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(144)
            make.centerX.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
    }
    
    // MARK: - BookCover Iamge UI
    
    func setupBookCover() {
        
        let bookCoverImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "bookCover"))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10
            imageView.layer.shadowColor = UIColor.black.cgColor
            imageView.layer.shadowOffset = CGSize(width: 3, height: 3)
            imageView.layer.shadowOpacity = 0.1
            imageView.layer.shadowRadius = 4
            return imageView
        }()
        
        view.addSubview(bookCoverImageView)
        
        bookCoverImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.centerX.equalToSuperview()
            make.width.equalTo(219)
            make.height.equalTo(324)
        }
        
    }
    
    
    // MARK: - Author Label
    
    func setupAuthorLabel() {
        
        let authorLabel: UILabel = {
            let label = UILabel()
            label.text = "저자: "
            label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label.textColor = UIColor.white
            label.shadowColor = UIColor.black
            label.shadowOffset = CGSize(width: 0, height: 0)
            label.layer.shadowOpacity = 0.1
            label.layer.shadowRadius = 4
            
            label.setContentHuggingPriority(.required, for: .horizontal)
            label.setContentCompressionResistancePriority(.required, for: .horizontal)
            return label
        }()
        
        let authorNameLabel: UILabel = {
            let label = UILabel()
            label.text = "세이노"
            label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label.textColor = UIColor.white
            label.shadowColor = UIColor.black
            label.shadowOffset = CGSize(width: 0, height: 0)
            label.layer.shadowOpacity = 0.1
            label.layer.shadowRadius = 4
            return label
        }()
        
        let authorStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 0
            return stackView
        }()
        
        view.addSubview(authorStackView)
        
        [authorLabel, authorNameLabel].forEach {
            authorStackView.addArrangedSubview($0)
        }
        
        authorStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(592)
            make.leading.equalToSuperview().offset(56.5)
            make.trailing.equalToSuperview().inset(56.5)
        }
        
    }
    
    
    func setupSummaryLabel() {
        
        let summaryScroll: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.indicatorStyle = .white
            return scrollView
        }()
        
        let summaryLabel: UILabel = {
            let label = UILabel()
            label.text = "*필명 ‘세이노(Say No)’는 당신이 믿고 있는 것들에 ‘No!’를 외치고 제대로 살아가라는 뜻이다. 세이노는 지난 20여 년간 여러 칼럼을 통해 인생 선배로서 부와 성공에 대한 지혜와 함께 삶에 대한 체험적 지식을 나누어 주었다. 그래서 그의 글을 좋아하는 사람들은 그를 ‘세이노 스승님’이라 부른다. *필명 ‘세이노(Say No)’는 당신이 믿고 있는 것들에 ‘No!’를 외치고 제대로 살아가라는 뜻이다. 세이노는 지난 20여 년간 여러 칼럼을 통해 인생 선배로서 부와 성공에 대한 지혜와 함께 삶에 대한 체험적 지식을 나누어 주었다. 그래서 그의 글을 좋아하는 사람들은 그를 ‘세이노 스승님’이라 부른다."
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            label.textColor = UIColor.white
            label.shadowColor = UIColor.black
            label.shadowOffset = CGSize(width: 0, height: 0)
            label.layer.shadowOpacity = 0.1
            label.layer.shadowRadius = 4
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4 // 원하는 줄 간격으로 설정
            
            // Attributed Text 설정
            let attributedString = NSAttributedString(string: label.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            label.attributedText = attributedString
            
            return label
        }()
        
        view.addSubview(summaryScroll)
        summaryScroll.addSubview(summaryLabel)
        
        summaryScroll.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(615)
            make.leading.equalToSuperview().offset(56.5)
            make.trailing.equalToSuperview().inset(56.5)
            make.height.equalTo(79)
            make.width.equalTo(280)
        }
        
        summaryLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(summaryScroll)
        }
        
        
    }
    
}
