//
//  ViewController.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import UIKit
import SwiftUI

class AmiiboListViewController: UIViewController {

  private lazy var tableView: UITableView = {
    let table = UITableView()
    return table
  }()
  
  private let amiiboList = Amiibo.all()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    title = "Amiibo List"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  private func configureTableView() {
    view.addSubview(tableView)
    tableView.fillSuperview()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(AmiiboCell.self, forCellReuseIdentifier: AmiiboCell.reusableIdentifier)
    tableView.rowHeight = 100
  }

  private func sendToDetail(amiibo: Amiibo) {
    let detailView = AmiiboDetailView(amiibo: amiibo)
    let hosting = UIHostingController(rootView: detailView)
    
    navigationController?.pushViewController(hosting, animated: true)
  }

}

extension AmiiboListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return amiiboList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AmiiboCell.reusableIdentifier, for: indexPath) as? AmiiboCell else {
      fatalError("Invalid Cell")
    }
    
    cell.configure(with: amiiboList[indexPath.row])
    return cell
  }
}


extension AmiiboListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    sendToDetail(amiibo: amiiboList[indexPath.row])
  }
}


