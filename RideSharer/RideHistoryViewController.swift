//
//  RideHistoryViewController.swift
//  RideSharer
//
//

import UIKit

class RideHistoryViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
                       ("Driver: Sandra, 01/03/2022", "$13.10"),
                       ("Driver: Hank, 01/11/2022", "$16.20"),
                       ("Driver: Michelle, 01/19/2022", "$8.50")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        Register a cell
//        register a default table view cell. This will allow us to reuse the cell later on.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
//     To conform to UITableViewDataSource we need to implement two methods:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return the number of rows that we require for each section, we only have one section so we only need to return one value
        return self.rideHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return the cell that we want to use in the table view.
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",for: indexPath)
        
//        use indexPath.row to get the row index which we can use to retrieve the corresponding value from our tableViewData
//        assign the value that we get from tableViewData to the default textLabel.text that comes with the default UITableViewCell
        cell.textLabel?.text = rideHistory[indexPath.row].0
        cell.detailTextLabel?.text = rideHistory[indexPath.row].1
        return cell
    }
    
//    tableView(_:didSelectRowAt:)  Tells the delegate that the specified row is now selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // create the alert
        let alert = UIAlertController(title: "Price", message: rideHistory[indexPath.row].1, preferredStyle: .alert)
        
        // add an action (button)
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alert.addAction(okAction)
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}
