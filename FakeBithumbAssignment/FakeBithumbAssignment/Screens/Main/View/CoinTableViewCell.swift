//
//  CoinTableViewCell.swift
//  FakeBithumbAssignment
//
//  Created by chihoooon on 2022/02/26.
//

import UIKit

import SnapKit
import Then

class CoinTableViewCell: BaseTableViewCell {

    // MARK: - Instance Property

    private let coinName = UILabel().then {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 0
    }

    private let currentPrice = UILabel().then {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.textAlignment = .right
        $0.textColor = .black
        $0.numberOfLines = 0
    }

    private let fluctuationRate = UILabel().then {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.textAlignment = .center
        $0.textColor = .black
        $0.numberOfLines = 0
    }

    private let tradeValue = UILabel().then {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.textAlignment = .right
        $0.textColor = .black
        $0.numberOfLines = 0
    }

    // MARK: - custom func

    override func configUI() {
        self.backgroundColor = .white
    }
    
    override func render() {
        configureStackView()
    }

    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: [
            self.coinName,
            self.currentPrice,
            self.fluctuationRate,
            self.tradeValue
        ]).then {
            $0.spacing = 10
        }

        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
            make.width.equalTo(self.coinName).multipliedBy(4)
            make.width.equalTo(self.currentPrice).multipliedBy(4)
            make.width.equalTo(self.fluctuationRate).multipliedBy(5)
        }
    }
}