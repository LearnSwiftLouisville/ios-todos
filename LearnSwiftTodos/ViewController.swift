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
    //    tableData.append("Hello!")
    //    tableView.reloadData()
    performSegue(withIdentifier: "todoCreation", sender: addButton)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! DetailViewController
    
    if segue.identifier == "todoCreation" {
      destination.todoTitle = ""
      destination.updateTitle = { [weak self] newTitle in
        self?.tableData.append(newTitle)
        self?.tableView.reloadData()
      }
    } else if segue.identifier == "showDetails" {
      let path = tableView.indexPathForSelectedRow!
      destination.todoTitle = tableData[path.row]
      destination.updateTitle = { [weak self] newTitle in
        self?.tableData[path.row] = newTitle
        self?.tableView.reloadRows(at: [path], with: .automatic)
      }
    }
  }
}

extension ViewController: UITableViewDelegate {
  
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
