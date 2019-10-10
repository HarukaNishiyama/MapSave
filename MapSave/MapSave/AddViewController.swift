//
//  AddViewController.swift
//  MapSave
//
//  Created by haruka on 2019/10/10.
//  Copyright © 2019 haruka. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    // 名前と住所
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    // 名前と住所入力欄
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    // 登録ボタン
    @IBOutlet weak var inputButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // デリゲート
        nameField.delegate = self
        addressField.delegate = self
        
    }
    
    // 登録ボタンが押されたときの処理
    @IBAction func inputAction(_ sender: UIButton) {
    }
    
    // リターンキーでキーボードを下ろす
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // 画面外タッチでキーボードを下ろす
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
