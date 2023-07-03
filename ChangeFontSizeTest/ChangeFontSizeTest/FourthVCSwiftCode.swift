//
//  FourthVCSwiftCode.swift
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/7/3.
//

import Foundation
import UIKit
import RxSwift

class FourthVCSwiftCode:UITableViewController {
    let bag = DisposeBag()
    
    let dataArrObs = Observable.just(["周一","周二","周三","周四","周五","周六","周日",])
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.rowHeight = 60
        
        tableView.register(UINib.init(nibName: "FourthTVCCell", bundle: nil), forCellReuseIdentifier: FourthTVCCell.kReuseID)
        
        dataArrObs
            .bind(to: tableView.rx.items(cellIdentifier: FourthTVCCell.kReuseID, cellType: FourthTVCCell.self)) { (row, element, cell) in
               cell.gLbl4Text.text = "\(element) @ row \(row)"
            }
            .disposed(by: bag)
        
    }
    
}

