//
//  InputViewController.swift
//  AddressSave
//
//  Created by haruka on 2019/10/07.
//  Copyright © 2019 haruka. All rights reserved.
//

import UIKit
// キーボードの出し入れ→UITextFieldDelegate
class InputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputAddress: UITextField!
    
    // 地名
    var placeName = ""
    // 住所
    var address = ""
    
    // 配列
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputName.delegate = self
        inputAddress.delegate = self
    }
    
    // 登録ボタンを押した時の動き
    @IBAction func inputButtonAction(_ sender: UIButton) {
        // 地名と住所を格納する
        placeName = inputName.text ?? ""
        address = inputAddress.text ?? ""
        
        // ユーザーデフォルトの中が空でなければarrayに保存
//        if UserDefaults.standard.object(forKey: "place") != nil {
//            array = UserDefaults.standard.set(array, forKey: "todo") as! [String]
//        }
//        
//        array.append(textField.text!)
        
        // テーブルビューに変数を渡す
        let ListViewController:ListViewController = self.storyboard?.instantiateViewController(withIdentifier: "next") as! ListViewController
        ListViewController.placeName = placeName
        ListViewController.address = address
    }
    
    // 画面外をタップしたらキーボードを下ろす
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// 画面の渡し方
//    let viewController2: ViewController2 =
//        self.storyboard?.instantiateViewController(withIdentifier: "next") as! ViewController2      viewController2.count = box
//    let 変数名：画面遷移先 = self.storyboard?.instantiateViewController(withIdentifier: "ID") as!      画面遷移先の名前 変数名が持つ.変数 = 渡したいものが入った変数

//    self.navigationController?.pushViewController(viewController2, animated: true)
//    self.navigationController?.pushViewController(画面遷移先の変数, animated: true)

//    ユーザーデフォルトの使い方
//    UserDefaults.standard.set(保存したいもの, forKey: キー値(鍵))

//    ユーザーデフォルトが空ではない場合中身をStringで取り出す
//    if UserDefaults.standard.object(forKey: キー値) != nil {
//        変数 = UserDefaults.standard.object(forKey: キー値) as! [String]
//    }

