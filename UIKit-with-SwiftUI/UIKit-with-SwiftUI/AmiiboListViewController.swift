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
  
  private let amiiboListViewModel = AmiiboListViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    title = "Amiibo List"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    amiiboListViewModel.getSmashAmiibos { [weak self] in
      self?.tableView.reloadData()
    }
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
    return amiiboListViewModel.numberOfAmiibos
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AmiiboCell.reusableIdentifier, for: indexPath) as? AmiiboCell else {
      fatalError("Invalid Cell")
    }
    
    let amiibo = amiiboListViewModel.amiibos[indexPath.row].amiibo
    cell.configure(with: amiibo)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let amiiboCell = cell as? AmiiboCell else {
      return
    }
    let amiibo = amiiboListViewModel.amiibos[indexPath.row].amiibo
    amiiboCell.imageView?.cancelLoadingImage(stringUrl: amiibo.imageUrl)
  }
}


extension AmiiboListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let amiibo = amiiboListViewModel.amiibos[indexPath.row].amiibo
    
    sendToDetail(amiibo: amiibo)
  }
}


