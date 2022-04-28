//
//  TableVIewModel.swift
//  OptimizedTableView
//
//  Created by Gurjinder Singh on 28/04/22.
//

import Foundation
import UIKit

class TableViewViewModel<CELL: UITableViewCell, T>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var cellIdentifier: String!
    private var items: [T]!
    var configureCell: (CELL,T,Int)->() = {_,_,_ in}
    var selectedCell: (T)->() = { _ in}
    private var cellHeight: CGFloat = 150
    
    //init(cellIdentifier: String, items: [T], cellHeight: CGFloat, configureCell: @escaping(CELL,T,Int)->()) {
    init(cellIdentifier: String, items: [T], cellHeight: CGFloat) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.cellHeight = cellHeight
        //self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CELL
        self.configureCell(cell, items[indexPath.row], indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCell(items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }
}
