//
//  ViewController.swift
//  Apple Pie Code
//
//  Created by Stas Borovtsov on 18.01.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    let buttonStackView = UIStackView()
    let correctWordLabel = UILabel()
    var letterButtons = [UIButton]()
    let scoreLabel = UILabel()
    let stackView = UIStackView()
    let topStackView = UIStackView()
    let treeImageView = UIImageView()

    
    // MARK: Methods
    @objc func buttonPressed(_ sender: UIButton){
        print(sender.title(for: .normal) ?? "nil")
    }

    
    func initLetterButton(){
        let buttonTitles = "ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЁ__ЯЧСМИТЬБЮ_"
        for buttontitle in buttonTitles{
            let title: String = buttontitle == "_" ? "" : String(buttontitle)
            let button = UIButton()
            
            if buttontitle != "_"{
                button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
            }
            
            button.setTitle(title, for: [])
            button.setTitleColor(.systemBlue, for: .normal) //normal - кнопка не нажата
            button.setTitleColor(.systemTeal, for: .highlighted) //highlighted - нажали на кнопку
            button.titleLabel?.textAlignment = .center
            letterButtons.append(button)
        }
        
        let buttonRows = [UIStackView(), UIStackView(), UIStackView()]
        let rowCount = letterButtons.count / 3
        
        for row in 0 ..< buttonRows.count{
            for index in 0 ..< rowCount {
                buttonRows[row].addArrangedSubview(letterButtons[row * rowCount + index])
            }
            buttonRows[row].distribution = .fillEqually
            //buttonRows[row].alignment = .center
            buttonStackView.addArrangedSubview(buttonRows[row])
        }
    }
    
    func updateUI(to size: CGSize){
        topStackView.axis = size.height > size.width ? .vertical : .horizontal
        topStackView.frame = CGRect(x: 10, y: 10, width: size.width-20, height: size.height-20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size  = view.bounds.size
        let factor = min(size.height, size.width)
        view.backgroundColor = .white
        view.addSubview(topStackView)
        
        //stackView.backgroundColor = .clear
        buttonStackView.axis = .vertical
        //buttonStackView.backgroundColor = .red
        buttonStackView.distribution = .fillEqually
        
        
        stackView.addArrangedSubview(buttonStackView)
        stackView.addArrangedSubview(correctWordLabel)
        stackView.addArrangedSubview(scoreLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        correctWordLabel.font = UIFont.systemFont(ofSize: factor / 10) //деление даст изменение шрифта при разных размерах экрана
        correctWordLabel.text = "correctWord"
        correctWordLabel.textAlignment = .center
        
        scoreLabel.font = UIFont.systemFont(ofSize: factor / 16)
        scoreLabel.text = "score"
        scoreLabel.textAlignment = .center
                

        //topStackView.frame = view.bounds
        // в отличии от addSubview этот метод будет располагаться внутри topStackView и нам не понадобятся  constrains и т.п.
        topStackView.addArrangedSubview(treeImageView)
        topStackView.addArrangedSubview(stackView)
        topStackView.distribution = .fillEqually // верхняя и нижняя половинки займут одинаковое место
        topStackView.spacing = 16
        
        //treeImageView.backgroundColor = .green
        treeImageView.contentMode = .scaleAspectFit
        treeImageView.image = UIImage(named: "Tree7")
        
        updateUI(to: view.bounds.size)
        initLetterButton()
    }

    // функция срабатывает при повороте экрана
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        topStackView.axis = size.height > size.width ? .vertical : .horizontal
        topStackView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
}

