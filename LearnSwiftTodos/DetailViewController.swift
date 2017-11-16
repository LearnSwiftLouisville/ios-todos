//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var titleTextField: UITextField!
  var updateTitle: (String) -> Void = { _ in }
  var todoTitle: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleTextField.text = todoTitle
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveButtonClicked))
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @objc func saveButtonClicked() {
    if let title = titleTextField.text {
      updateTitle(title)
    }
    navigationController?.popViewController(animated: true)
  }
}
