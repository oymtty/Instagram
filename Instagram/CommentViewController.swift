
import UIKit
import Firebase

class CommentViewController: UIViewController {
    
    var postData:PostData!
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var commentTextField: UITextField!
    @IBAction func PostComment(_ sender: Any) {
        // FireStoreに投稿データを保存
        let name = Auth.auth().currentUser?.displayName
        let comment = commentTextField.text
        
        var updateValue: FieldValue
        updateValue = FieldValue.arrayUnion(["\(name!):\(comment!)"])
        // commentに更新データを書き込む
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comment": updateValue])

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶ
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)// キーボードを閉じる
    }
}
