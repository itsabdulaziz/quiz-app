//
//  QuizQuestionCell.swift
//  QuizApp
//
//  Created by Abdulaziz Boyqoziyev on 23/07/23.
//

import UIKit


class QuizQuestionCell: BaseTableViewCell {
    
//    private let quiz: Sport
    
    private let titleLabel = UILabel()
    
//    init(with quiz: Sport) {
//        self.quiz = quiz
//        init(style: nil, reuseIdentifier: nil)
//    }
//
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
    }
    
    func reloadDemo() {
        titleLabel.text =  "\(1)) a sfuasjf hoiasisf asof hashof hoiashif oaishf oiasif oaishf oaishf oiashf oiasfio asfoiasoif a sf aosif aios foias foiahs"
    }
    
    func reload(title: String) {
        titleLabel.text = title
    }
//    init(with quiz: Sport) {
//        self.quiz = quiz
//        super.init(style: nil, reuseIdentifier: nil)
//    }
    
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}


class BaseTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureAndLayoutSubviews()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAndLayoutSubviews()
    }
    
    func configureAndLayoutSubviews() -> Void {
        
    }
    
    func hideSeparator() {
        separatorInset = .init(top: 0, left: 2000, bottom: 0, right: 0)
    }
}


extension UITableViewCell {
    
    static func makeReuseIdentifier()-> String {
        return String(describing: self)
    }
    
    static func register(to tableView: UITableView, reuseIdentifier:String? = nil) {
        tableView.register(self, forCellReuseIdentifier: reuseIdentifier ?? makeReuseIdentifier())
    }
    
    static func dequeue(on tableView: UITableView, at indexPath: IndexPath) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: makeReuseIdentifier(), for: indexPath) as? Self
    }
    
    static func dequeue(tableView: UITableView) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: makeReuseIdentifier()) as? Self
    }
}


extension UITableViewHeaderFooterView {
    
    static func makeReuseIdentifier()->String {
        return String(describing: self)
    }
    
    static func register(to tableView: UITableView) {
        tableView.register(self, forHeaderFooterViewReuseIdentifier: makeReuseIdentifier())
    }
    
    static func dequeue(on tableView: UITableView) -> Self? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: makeReuseIdentifier()) as? Self
    }
}
