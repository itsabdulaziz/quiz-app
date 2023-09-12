//
//  ViewController.swift
//  QuizApp
//
//  Created by Abdulaziz Boyqoziyev on 20/07/23.
//

import UIKit
import Alamofire

let baseUrl = "http://0.0.0.0:3002/"

class ViewController: UIViewController {
    private let label = UILabel()
    private let sportButton = UIButton()
    private let mathsButton = UIButton()
    
    private var quizObj: Quiz?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(sportButton)
        view.addSubview(mathsButton)
        sportButton.setTitle("Sport", for: .normal)
        sportButton.backgroundColor = .blue
        sportButton.setTitleColor(UIColor.white, for: .normal)
        sportButton.layer.cornerRadius = 12
        sportButton.layer.masksToBounds = true
        sportButton.addTarget(self, action: #selector(sportButtonTapped), for: .touchUpInside)
        
        mathsButton.setTitle("Math", for: .normal)
        mathsButton.backgroundColor = .red
        mathsButton.setTitleColor(UIColor.white, for: .normal)
        mathsButton.layer.cornerRadius = 12
        mathsButton.layer.masksToBounds = true
        
        label.text = "Quiz"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 40)
        
        sportButton.snp.makeConstraints { make in
            make.leading.equalTo(100)
            make.trailing.equalTo(-200)
            make.height.equalTo(55)
            make.width.equalTo(100)
            make.top.equalTo(250)
        }
        mathsButton.snp.makeConstraints { make in
            make.leading.equalTo(200)
            make.trailing.equalTo(-100)
            make.top.equalTo(250)
            make.height.equalTo(55)
            make.width.equalTo(100)
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(150)
            make.trailing.equalTo(-100)
            make.top.equalTo(100)
        }
        
        getData(from: "http://localhost:3002/mathquiz")
    }
    
    @objc func sportButtonTapped() {
        guard let sportQuestions = quizObj?.sport else { return }
        let vc = QuizViewController(questions: sportQuestions)
        let navCtrl = UINavigationController(rootViewController: vc)
        navCtrl.modalPresentationStyle = .fullScreen
        present(navCtrl, animated: true)
    }
    
    
    private func getData(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("something want wrong")
                return
            }
            var result: QuizData?
            do {
                result = try JSONDecoder().decode(QuizData.self, from: data)
            }
            catch {
                print("field do convert \(error)")
            }
            guard let json = result else {
                return
            }
            print(json.quiz)
        
            self.quizObj = result?.quiz
        }
        task.resume()
    }

}

