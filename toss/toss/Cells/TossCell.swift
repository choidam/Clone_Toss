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
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let indexLabel = UILabel()
    
    private let sendButton = UIButton().then {
        $0.setTitle("송금", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        $0.isHidden = true
    }
    
    // MARK: Property
    
    var index: Int = 0 {
        didSet {
            indexLabel.text = "\(index)"
        }
    }
    
    var isHiddenSendButton: Bool = true {
        didSet {
            sendButton.isHidden = isHiddenSendButton
        }
    }
    
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
        contentView.addSubview(bgView)
        bgView.addSubview(indexLabel)
        bgView.addSubview(sendButton)
    }
    
    private func initLayout(){
        addViews()
        
        contentView.backgroundColor = .lightGray
        
        bgView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(10)
            $0.bottom.equalTo(-10)
            $0.trailing.equalTo(-10)
            $0.height.equalTo(100)
        }
        
        indexLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(20)
        }
        
        sendButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(-20)
            $0.width.equalTo(80)
        }
    }
}
