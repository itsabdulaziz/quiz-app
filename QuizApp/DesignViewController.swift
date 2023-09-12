//
//  DesignViewController.swift
//  QuizApp
//
//  Created by Abdulaziz Boyqoziyev on 20/07/23.
//

import UIKit
import SnapKit



//let baseUrl = "http://0.0.0.0:3002/"
class APIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       getData(from: "http://localhost:3002/mathquiz")
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
                print("field do convert \(error.localizedDescription)")
            }
            guard let json = result else {
                return
            }
            print(json.quiz)
        
        }
        task.resume()
    }
}


struct QuizData: Codable {
    let quiz: Quiz
    
}

struct Quiz: Codable {
    let sport: [Question]
    let maths: [Question]
}

//struct Sport: Codable {
//    let questions: [Question]
//}
//
struct Question: Codable {
    let question: String
    let options: [OptionAnswer]
    let answer: Int
}

struct OptionAnswer: Codable {
    let id: Int
    let title: String
}

//struct Maths: Codable {
//
//}
//struct Q: Codable {
//    let question: String
//    let options: [String]
//    let answer: String
//}
//struct Q2: Codable {
//    let question: String
//    let options: [String]
//    let answer: String
//}

//class DesignViewController: UIViewController {
//    private let label = UILabel()
//    private let sportButton = UIButton()
//    private let mathsButton = UIButton()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        label.text = "Quiz"
//        label.textColor = .black
//        label.font = UIFont.systemFont(ofSize: 40)
//
//        sportButton.snp.makeConstraints { make in
//            make.leading.equalTo(100)
//            make.trailing.equalTo(-300)
//            make.height.equalTo(55)
//            make.width.equalTo(55)
//            make.top.equalTo(250)
//        }
//        view.addSubview(label)
//        view.addSubview(sportButton)
//        view.addSubview(mathsButton)
//
//        label.snp.makeConstraints { make in
//            make.leading.equalTo(-100)
//            make.trailing.equalTo(-100)
//            make.top.equalTo(100)
//        }
//    }
//}
