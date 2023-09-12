//
//  QuizPageViewController.swift
//  QuizApp
//
//  Created by Abdulaziz Boyqoziyev on 20/07/23.
//

import UIKit

class QuizPageViewControllerrr: UIViewController {
    
    private let questionLabel = UILabel()
    private let optionsLabel = UILabel()
    private let answerLabel = UILabel()
    
//    private let quiz: Sport
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(questionLabel)
        view.addSubview(optionsLabel)
        view.addSubview(answerLabel)
//        questionLabel.text = quiz.q1.question
        
        questionLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(100)

        }
    }
    
//    init(with quiz: Sport) {
//        self.quiz = quiz
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
