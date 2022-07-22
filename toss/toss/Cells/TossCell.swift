//
//  TossCell.swift
//  toss
//
//  Created by 최모지 on 2022/07/22.
//

import UIKit

class TossCell: UITableViewCell {
    
    // MARK: UI
    
    private let bgView = UIView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
    }
    
    // MARK: Property
    
    static let cellId = "tossCellIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TossCell {
    private func addViews(){
        addSubview(bgView)
    }
    
    private func initLayout(){
        addViews()
        
        bgView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(10)
            $0.bottom.equalTo(-10)
            $0.trailing.equalTo(-10)
            $0.height.equalTo(100)
        }
    }
}
