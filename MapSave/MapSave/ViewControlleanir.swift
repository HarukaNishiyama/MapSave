//
//  ViewController.swift
//  MapSave
//
//  Created by haruka on 2019/10/09.
//  Copyright © 2019 haruka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addressTable: UITableView!
    
    var addressArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲート
        addressTable.delegate = self
        addressTable.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 保存した配列がnilでなければ呼び出し
        if UserDefaults.standard.object(forKey: "place") != nil {
            addressArray = UserDefaults.standard.object(forKey: "place") as! [String]
        }
        // リロード
        addressTable.reloadData()
        
    }
    
    // セクションの中のセルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArray.count
    }
    // セルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // どのセルか認識させる
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // 複数行に対応させる
        cell.textLabel?.numberOfLines = 0
        // セルのテキスト
        cell.textLabel?.text = addressArray[indexPath.row]
        
        return cell
    }
    
    // セルをタップした時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 初期化
        let board = UIPasteboard.general
        // テキストをコピーする
        board.string = addressArray[indexPath.row]
    }

    // セルをスライドした時の処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 配列から情報を消す
            addressArray.remove(at: indexPath.row)
            // 消した後の配列を改めて保存
            UserDefaults.standard.set(addressArray, forKey: "place")
            // リロード
            addressTable.reloadData()
        }
    }


}

