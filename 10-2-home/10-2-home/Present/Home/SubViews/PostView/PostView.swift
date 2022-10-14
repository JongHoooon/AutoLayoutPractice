//
//  PostView.swift
//  10-2-home
//
//  Created by JongHoon on 2022/10/15.
//

import Then
import SnapKit
import UIKit

final class PostView: UIView {
    
    private lazy var PostCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: 16.0,
            left: 0,
            bottom: 16.0,
            right: 0
        )
        
        $0.collectionViewLayout = layout
        $0.showsVerticalScrollIndicator = true
        
        
        $0.dataSource = self
        $0.delegate = self
        
        $0.register(
            PostCollectionViewCell.self,
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier
        )
        $0.register(
            PostCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: PostCollectionReusableView.identifier
        )
    }
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CollectionView

extension PostView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        20
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PostCollectionViewCell.identifier,
            for: indexPath
        ) as? PostCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: PostCollectionReusableView.identifier,
            for: indexPath
        ) as? PostCollectionReusableView
        
        return header ?? UICollectionReusableView()
    }
}

extension PostView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: frame.width, height: 100.0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(width: frame.width, height: 16.0)
    }
}


// MARK: - Private

private extension PostView {
    
    func configureLayout() {
        [
            PostCollectionView
        ].forEach { addSubview($0) }
    
        PostCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
