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
    
    // 名前と住所の変数
    var nameBox:String?
    var addressBox:String?
    var resultText:String?
    
    // 名前と住所の配列
    var addressArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // デリゲート
        nameField.delegate = self
        addressField.delegate = self
        
        // ボタン制御
        inputButton.isEnabled = false
        inputButton.backgroundColor = UIColor.gray
        
    }
    
    // 登録ボタンが押されたときの処理
    @IBAction func inputAction(_ sender: UIButton) {
        // 名前と住所を変数に格納
        nameBox = nameField.text ?? ""
        addressBox = addressField.text ?? ""
        // 1つの変数にまとめる
        resultText = nameBox! + "\n" + addressBox!
        
        // 配列を呼び出す
        if UserDefaults.standard.object(forKey: "place") != nil {
            addressArray = UserDefaults.standard.object(forKey: "place") as! [String]
        }
        // 配列にセット
        addressArray.append(resultText!)
        // 保存
        UserDefaults.standard.set(addressArray, forKey: "place")
        
        // 初期化
        nameField.text = ""
        addressField.text = ""
        
        // 確認ダイアログ
        let alert = UIAlertController(title: "確認", message: "登録完了！", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
        
        print(addressArray)
        
    }
    
    // リターンキーでキーボードを下ろす
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        // ボタンを活性化する
        if nameField.text != "" && addressField.text != "" {
            inputButton.isEnabled = true
            inputButton.backgroundColor = UIColor.blue
        } else {
            // ボタン制御
            inputButton.isEnabled = false
            inputButton.backgroundColor = UIColor.gray
        }
        return true
    }
    // 画面外タッチでキーボードを下ろす
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // ボタンを活性化する
        if nameField.text != "" && addressField.text != "" {
            inputButton.isEnabled = true
            inputButton.backgroundColor = UIColor.blue
        } else {
            // ボタン制御
            inputButton.isEnabled = false
            inputButton.backgroundColor = UIColor.gray
        }
        self.view.endEditing(true)
    }
}
