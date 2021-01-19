//
//  Game.swift
//  Apple Pie
//
//  Created by Stas Borovtsov on 23.12.2020.
//
import Foundation

struct Game{
    var word: String
    var incorrectMovesRemaining: Int
    //private - никому не видно этот массив
    //fileprivate - доступ только внутри этого файла
    fileprivate var guessedLetters: [Character] = [] //или [Character]() или [Character].init() - это таже самая инициализация массива
    
    //пишем свой конструктор, потому что есть приватная переменная и конструктор по-умолчанию не может работать, так как две переменные нельзя инициализировать(их же три), но и приватноую переменную мы не можем инициализировать
    init(word: String, incorrectMovesRemaining: Int){
        self.word = word
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    var guessedWord: String{
        var wordToShow = ""
        
        for letter in word{
            if guessedLetters.contains(Character(letter.lowercased())) || letter == " " || letter == "-"{
                wordToShow += String(letter)
            }else{
                wordToShow += "_"
            }
        }
        return wordToShow
    }
    
    //mutating - значит функция меняет переменные структуры
    mutating func playerGuessed(letter: Character){
        let lowerCaseLetter = Character(letter.lowercased())
        guessedLetters.append(lowerCaseLetter)
        if !word.lowercased().contains(lowerCaseLetter){
            incorrectMovesRemaining -= 1
        }
    }
}
