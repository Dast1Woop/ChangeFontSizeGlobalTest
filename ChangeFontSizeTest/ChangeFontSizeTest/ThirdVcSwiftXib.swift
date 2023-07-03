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
    
    @IBOutlet weak var gLbl4FirstLine: UILabel!
    
    @IBOutlet weak var gBtn4Jump: UIButton!
    
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
        gLbl4FirstLine.font = UIFont.systemFont(ofSize: 17)
        gBtn4Jump.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
    
    private let cellReuseID = "cellReuseID"
    private func setUpTableView() {
        
#warning("系统设置会使系统cell里面控件的文字放大到与手机设置的放大比例相同！！！因此，不能使用系统cell，必须自定义cell！！！")
        
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
        
        dataArr.bind(to: tableV.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseID)!
            cell.textLabel?.text = "\(element.name)-\(element.age)岁-row \(row)"
            return cell
        }
        .disposed(by: bag)
    }
    
    
    @IBAction func fourthVCDC(_ sender: Any) {
        let fourthVC = FourthVCSwiftCode.init()
        navigationController?.pushViewController(fourthVC, animated: true)
    }
}
