//
//  QuizFooterView.swift
//  QuizApp
//
//  Created by Abdulaziz Boyqoziyev on 23/07/23.
//

import UIKit

class QuizFooterView: UIView {
    
    private let onTap: () -> Void
    
    private let stackView = UIStackView()
    private let containerView = UIView()
    private let backButton = UIButton()
    private let nextButton = UIButton()
//private let homeBUtton = UIButton()
    
    init(onTapButton: @escaping ()-> Void) {
        self.onTap = onTapButton
        super.init(frame: .zero)
        backgroundColor = .lightGray
      addSubview(containerView)
      
//        homeButton.backgroundColor = .white
        containerView.addSubview(backButton)
        containerView.addSubview(nextButton)
//        containerView.addSubview(homeBUtton)
     
        
        
//        homeBUtton.setTitle("Home", for: .normal)
//        homeBUtton.setTitleColor(UIColor.white, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.black, for: .normal)
        
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.setTitle("next", for: .normal)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(50)
            make.bottom.equalTo(-50)
        }
//        homeBUtton.snp.makeConstraints { make in
//            make.leading.equalTo(20)
//            make.trailing.equalTo(-200)
//            make.top.equalTo(50)
//            make.bottom.equalTo(-50)
//        }
        nextButton.snp.makeConstraints { make in
            make.leading.equalTo(200)
            make.trailing.equalTo(-20)
            make.top.equalTo(50)
            make.bottom.equalTo(-50)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func nextButtonTapped() {
        onTap()

    }
    
}

