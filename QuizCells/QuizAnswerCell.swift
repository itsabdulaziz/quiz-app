//
//  QuizAnswerCell.swift
//  QuizApp
//
//  Created by Abdulaziz Boyqoziyev on 23/07/23.
//

import UIKit

class QuizAnswerCell: BaseTableViewCell {
   
//    private var sport: Sport
    
    
    let checkImageView = UIImageView()
    let titleLabel = UILabel()
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        titleLabel.numberOfLines = 0
        contentView.addSubview(checkImageView)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 15, left: 45, bottom: 15, right: 15))
        }
        
        checkImageView.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.top.equalTo(15)
        }
        
     
    }
    
    func reloadDemo(isSelected: Bool = false) {
      
//        titleLabel.text = sport.q1.answer
        if isSelected {
            checkImageView.image = UIImage(named: "checkmarkSelected")
            checkImageView.tintColor = .green
        } else {
            checkImageView.image = UIImage(named: "chekmarkNotSelected")
            checkImageView.tintColor = .blue
        }
        
    }
    
    func reload(answer: String, isSelected: Bool) {
        titleLabel.text = answer
        if isSelected {
            checkImageView.image = UIImage(named: "checkmarkSelected")
            checkImageView.tintColor = .green
        } else {
            checkImageView.image = UIImage(named: "chekmarkNotSelected")
            checkImageView.tintColor = .blue
        }
        
    }
//    init(sport: Sport) {
//        self.sport = sport
//        super.init(style: .default, reuseIdentifier: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
