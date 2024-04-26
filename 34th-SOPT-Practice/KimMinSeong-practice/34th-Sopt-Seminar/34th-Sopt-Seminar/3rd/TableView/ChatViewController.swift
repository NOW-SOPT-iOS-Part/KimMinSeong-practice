//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 4/20/24.
//

import Foundation
import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    // -- 1번
    static let identifier = "ChatTableViewCell"
    private let tableView = UITableView(frame: .zero, style: .plain) // -- 2번
    private let chatList = ChatModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setDelegate()
        register()
    }
    
    private func setLayout() { // -- 3번
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func register() {
        tableView.register(
            ChatTableViewCell.self,
            forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    
}

// Mark: Extensions

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 0 // dummy data 이미지 넣으면 10으로 바꿔주기
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
              cell.dataBind(chatList[indexPath.row])
              return cell
  }
}





