import Dispatch
import Foundation
import PlaygroundSupport
import UIKit

class TestTableViewController: UITableViewController {
    private let cellIdentifier = "cellIdentifier"
    private let defaultFont = UIFont.systemFont(ofSize: 12)
    private let defaultTextColor = UIColor.black

    var data = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            var emptyCell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
            emptyCell.accessoryType = .disclosureIndicator
            return emptyCell
        }

        var content = cell.defaultContentConfiguration()
        content.text = "\(indexPath.row)"
        content.secondaryText = data[indexPath.row]

        content.textProperties.font = defaultFont
        content.textProperties.color = defaultTextColor
        content.secondaryTextProperties.font = defaultFont
        content.secondaryTextProperties.color = defaultTextColor

        cell.contentConfiguration = content

        return cell
    }

    func update(tableView: UITableView, _ focusIndexPath: IndexPath? = nil) {
        UIView.transition(with: tableView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            tableView.reloadData()
            if let indexPath = focusIndexPath {
                print(indexPath)
                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: true)
            }
        })
    }
}

let tableViewController = TestTableViewController(style: UITableView.Style.plain)
tableViewController.title = "Test"

let navigationController = UINavigationController(rootViewController: tableViewController)

PlaygroundPage.current.liveView = navigationController

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    tableViewController.data.append("Item 6")
    tableViewController.update(tableView: tableViewController.tableView, IndexPath(row: 5, section: 0))
}
