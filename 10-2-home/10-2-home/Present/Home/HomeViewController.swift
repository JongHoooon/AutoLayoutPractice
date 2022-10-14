//
//  ViewController.swift
//  10-2-home
//
//  Created by JongHoon on 2022/10/14.
//

import Then
import SnapKit
import UIKit

class HomeViewController: UIViewController {
    
    private lazy var autoSlideView = AutoSlideView()
    private lazy var categoryView = CategoryView()
    private lazy var postView = PostView()

// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        configureLayout()
    }
}

// MARK: - Private

private extension HomeViewController {
    
    func configureTabBar() {
        
        let titleLabel = UILabel().then {
            $0.text = "빡코딩🔥👨‍💻"
            $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        }
        let leftItem = UIBarButtonItem(customView: titleLabel)
        
        let searchBarButton = UIBarButtonItem(
            image: UIImage(named: "search"),
            style: .plain,
            target: self,
            action: nil
        ).then {
            $0.tintColor = .label
        }
        
        let notificationBarButton = UIBarButtonItem(
            image: UIImage(named: "notification"),
            style: .plain,
            target: self,
            action: nil
        ).then {
            $0.tintColor = .label
        }
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItems = [
            searchBarButton,
            notificationBarButton
        ]
    }
    
    func configureLayout() {
        [
            autoSlideView,
            categoryView,
            postView
        ].forEach { view.addSubview($0) }
    
        autoSlideView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(28.0)
        }
        
        categoryView.snp.makeConstraints {
            $0.top.equalTo(autoSlideView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(96.0)
        }
        
        postView.snp.makeConstraints {
            $0.top.equalTo(categoryView.snp.bottom).offset(28.0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

