//
//  PostCollectionReusableView.swift
//  10-2-home
//
//  Created by JongHoon on 2022/10/15.
//

import Then
import SnapKit
import UIKit

final class PostCollectionReusableView: UICollectionReusableView {
    
    private lazy var headerLabel = UILabel().then {
        $0.font = .systemFont(
            ofSize: 14.0,
            weight: .bold
        )
        $0.textColor = .label
        $0.numberOfLines = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerLabel)
        headerLabel.text = "지금 가장 뜨거울 빡코빡코 추천🔥"
        headerLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
