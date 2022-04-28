//
//  ViewController.swift
//  OptimizedTableView
//
//  Created by Gurjinder Singh on 28/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var yearTV: UITableView!
    
    var yearTableViewModel: TableViewViewModel<HistoryCell,String>!
    var arrYears = ["1990", "1991", "1992", "1993", "1994", "1995", "1996"]
    var tbvIdenifier = "HistoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    private func initTableView() {

//        yearTableViewModel = TableViewViewModel.init(cellIdentifier: tbvIdenifier, items: arrYears, cellHeight: 100, configureCell: { cell, year, rowIndex in
//            cell.lblYear.text = year
//        })
        yearTableViewModel = TableViewViewModel.init(cellIdentifier: tbvIdenifier, items: arrYears, cellHeight: 100)
        
        yearTableViewModel.configureCell = { cell, year, rowIndex in
            cell.lblYear.text = year
        }
        yearTableViewModel.selectedCell = { year in
            print(year)
        }
        
        yearTV.delegate = yearTableViewModel
        yearTV.dataSource = yearTableViewModel
        yearTV.register(UINib(nibName: tbvIdenifier, bundle: nil), forCellReuseIdentifier: tbvIdenifier)
    }
}

