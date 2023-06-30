//
//  ThirdVcSwiftXib.swift
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/28.
//

import Foundation
import UIKit
import RxSwift
import RxRelay
import RxCocoa

@objcMembers
public class ThirdVcSwiftXib:UIViewController {
    
    @IBOutlet weak var tableV: UITableView!
    
    private let bag = DisposeBag()
    private var dataArr = BehaviorRelay.init(value: [
        (name:"lilei", age:1),
        (name:"hanMM", age:2),
        (name:"张三", age:3),
        (name:"李四", age:4),
        (name:"王二", age:5),
    ])
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "3vc-swift-xib"
        view.backgroundColor = .lightGray
        
        setUpTableView()
    }
    
    private let cellReuseID = "cellReuseID"
    private func setUpTableView() {
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
        
        dataArr.bind(to: tableV.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseID)!
            cell.textLabel?.text = "\(element.name)-\(element.age)岁-row \(row)"
            return cell
        }
        .disposed(by: bag)
    }
}
