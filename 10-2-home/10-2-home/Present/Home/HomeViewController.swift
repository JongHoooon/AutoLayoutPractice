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
    
    private lazy var boardView = BoardView()
    

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
            notificationBarButton,
            searchBarButton
        ]
    }
    
    func configureLayout() {
        [
            boardView
        ].forEach { view.addSubview($0) }
        
        boardView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

