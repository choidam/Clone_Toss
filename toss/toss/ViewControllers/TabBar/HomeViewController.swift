//
//  HomeViewController.swift
//  toss
//
//  Created by choidam on 2022/07/11.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {

    // MARK: UI
    
    private let tableView = UITableView().then {
        $0.register(TossCell.self, forCellReuseIdentifier: TossCell.cellId)
        $0.allowsSelection = false
        $0.separatorStyle = .none
        $0.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        $0.backgroundColor = .lightGray
    }
    
    // MARK: Property
    
    private let animateRowIndex = 9
    
    private var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
        setTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeViewController {
    private func addViews(){
        view.addSubview(tableView)
        
    }
    
    private func initLayout(){
        addViews()
        
        view.backgroundColor = .lightGray
                
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tossCell = tableView.dequeueReusableCell(withIdentifier: TossCell.cellId, for: indexPath) as! TossCell
        
        tossCell.index = indexPath.row+1
        tossCell.isHiddenSendButton = (indexPath.row != 8)
        
        return tossCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let visibleRows = tableView.indexPathsForVisibleRows else { return }
        
        let count = visibleRows.count
        let bottomIndex = visibleRows[count-1].row
        
        print("bottomIndex: \(bottomIndex)")
        
        if bottomIndex == animateRowIndex {
            if (self.lastContentOffset > scrollView.contentOffset.y) {
                print("animate up")
            }
            else if (self.lastContentOffset < scrollView.contentOffset.y) {
                print("animate down")
            }
        }
        
        self.lastContentOffset = scrollView.contentOffset.y
    }
}
