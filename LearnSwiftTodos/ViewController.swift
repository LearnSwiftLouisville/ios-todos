//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var addButton: UIBarButtonItem!
  
  var tableData: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: "todoCreation", sender: addButton)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // We need to configure properties on this controller before it is shown.
    let destination = segue.destination as! DetailViewController

    // Checking segue identifiers is okay, but sub-classing UIStoryboardSegue would be better.
    if segue.identifier == "todoCreation" {
      destination.todoTitle = ""
      destination.updateTitle = { [weak self] newTitle in
        self?.tableData.append(newTitle)
        self?.tableView.reloadData()
      }
    } else if segue.identifier == "showDetails" {
      destination.todoTitle = tableData[path.row]
      destination.updateTitle = { [weak self] newTitle in
        self?.tableData[path.row] = newTitle
        self?.tableView.reloadRows(at: [path], with: .automatic)
      }
    } else {
    }
  }
}

extension ViewController: UITableViewDelegate {
  // TODO: Add methods for handling deletion, etc.
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "todo-cell")!
    let title = tableData[indexPath.row]
    cell.textLabel?.text = title
    return cell
  }
}
