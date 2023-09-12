//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Abdulaziz Boyqoziyev on 23/07/23.
//

import UIKit

enum QuizTableSection: Int {
case question = 0, answers
}

class QuizViewController: UIViewController {
    var correctAnswersCount = 0
    var unCorrectAnswerCount = 3
    var questions: [Question]
    var currentIndex = 0
    var currentQuestion: Question {
        return questions[currentIndex]
        
    }
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        QuizQuestionCell.register(to: tableView)
        QuizAnswerCell.register(to: tableView)
        return tableView
    }()
    private var selectedIndex: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        let tableFooterView = QuizFooterView { [weak self] in
            guard let self else {return}
            self.check(current: self.currentQuestion)
        }
        
        tableFooterView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        view.addSubview(tableFooterView)
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(tableFooterView.snp.top)
        }
        tableFooterView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
    }
    
    init(questions: [Question]) {
        self.questions = questions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func showAlert(title: String, message: String, handlerOk:((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive, handler: nil)
       // let actionCancel = UIAlertAction(title: "Restart", style: .cancel, handler: handlerCancel)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    func check(current quiz: Question) {
        guard let selectedIndex = selectedIndex else { return }
        if quiz.options[selectedIndex].id == quiz.answer {
            self.correctAnswersCount = correctAnswersCount+1
            self.currentIndex = currentIndex+1
            self.selectedIndex = nil
            if questions.count == currentIndex {
                showAlert(title: "RESULT", message: "You have answered " + "\(correctAnswersCount)" + " questions correctly!") {_ in
                    
                }
                
            } else if currentIndex < questions.count {
                tableView.reloadData()
            }
            
        } else  {
            self.currentIndex = currentIndex+1
            self.selectedIndex = nil
            if questions.count == currentIndex {
                showAlert(title: "RESULT", message: "You have answered " + "\(correctAnswersCount)" + " questions correctly!") {_ in
                    
                }
                
            } else if currentIndex < questions.count {
                tableView.reloadData()
            }
            
        }
        
    }
}


extension QuizViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch QuizTableSection(rawValue: section) {
        case .question:
            return 1
        case .answers:
            return currentQuestion.options.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch QuizTableSection(rawValue: indexPath.section) {
        case .question:
            let cell = QuizQuestionCell.dequeue(tableView: tableView)!
            cell.reload(title: currentQuestion.question)
            //            cell.reloadDemo()
            return cell
        case .answers:
            let cell = QuizAnswerCell.dequeue(tableView: tableView)!
            cell.reload(answer: currentQuestion.options[indexPath.row].title, isSelected: selectedIndex == indexPath.row)
            return cell
        default:
            assertionFailure("B xt bufbaubfua sf")
            return UITableViewCell()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch QuizTableSection(rawValue: indexPath.section) {
        case .answers:
            
            //            tableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
            selectedIndex = indexPath.row
            tableView.reloadSections(.init(integer: indexPath.section), with: .automatic)
        default:
            
            break
        }
        
    }
    @IBAction func onClickOk(_ sender: Any) {
        showAlert(title: "Alert", message: "you did the task too well", handlerOk:  { action in
            print("Action called")
        })
    
    }

}




