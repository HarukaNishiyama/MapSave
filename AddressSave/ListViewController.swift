//
//  ListViewController.swift
//  AddressSave
//
//  Created by haruka on 2019/10/07.
//  Copyright © 2019 haruka. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    // 名前と住所
    var placeName = ""
    var address = ""
    
    var resultArray = [String]()
    
    // テーブルビュー
    @IBOutlet weak var savedTableView: UITableView!
    
    // 名前と住所を表示するラベル
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 都度呼ばれる画面
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // セクションの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // セクションの中のセルの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // セルの中身
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルの設定
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        placeNameLabel = cell.contentView.viewWithTag(1) as! UILabel?
        addressLabel = cell.contentView.viewWithTag(2) as! UILabel?

        // セルに表示する内容を設定
        placeNameLabel.text = placeName
        addressLabel.text = address

        return cell
    }

    // セルの高さ
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//    }
    
    // セルがタップされた時に呼ばれる箇所
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

}
