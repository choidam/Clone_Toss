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
        $0.separatorStyle = .none
        $0.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
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
        
        return tossCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}
