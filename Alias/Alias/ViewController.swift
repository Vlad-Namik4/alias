//
//  ViewController.swift
//  Alias
//
//  Created by  Vladyslav on 1/24/20.
//  Copyright © 2020  Vladyslav. All rights reserved.
//

import UIKit
import Pods_Alias

var pointsArray : [String]! = []
var timeArray : [String]! = []
var settingsTimeAreChosen : Bool = false
var settingsPointsAreChosen : Bool = false
var settingsOfGame = [0, 0, true] as [Any]
var skipWord = true
var time = 0
var points = 0
var result: String?
var pointsResult : String!
var timeResult : String!
var test = 0
var indexOfChosenPickerSettings = [0, 0]
var settingsAreChosen = false
var teamNames : [String] = []
var teamPoints : [Int] = []


class ViewController: UIViewController {
    
    @IBOutlet weak var buttonResults: UIButton!
    @IBOutlet weak var wordSkipSwitch: UISwitch!
    @IBOutlet weak var pointsPicker: UIPickerView!
    @IBOutlet weak var timePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVariables()
        print("1st ViewController did load \(settingsOfGame)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("1st ViewController did appear \(settingsOfGame)")
        if(settingsAreChosen){
        pointsPicker.selectRow(indexOfChosenPickerSettings[0], inComponent: 0, animated: true)
        timePicker.selectRow(indexOfChosenPickerSettings[1], inComponent: 0, animated: true)
        wordSkipSwitch.setOn(skipWord, animated: true)
        }
    }
    
    func initializeVariables(){
        pointsArray = [ "40", "60", "80", "100", "120" ]
        timeArray = [ "40", "60", "80"]
        
    }
    
    @IBAction func buttonDidTap() { // функция которая отрабатывает при совершенном выборе UIPicker
        checkSettingsAreChosen()
        convertResultsToFinal() //при переходе на второе окно, проверить, выбраны ли настройки !!!
        initializePickersWithChosenSettings()
    }
    
    func convertResultsToFinal(){
        if let finalResult = pointsResult {
            settingsOfGame[0] = Int(finalResult) ?? 0
        }
        else { print("No result") }
        
        if let finalTimeResult = timeResult {
            settingsOfGame[1] = Int(finalTimeResult) ?? 0
        }
        else { print("No result") }
        
        if (wordSkipSwitch.isOn == true){
            settingsOfGame[2] = true
            skipWord = true
        }
        else {
            settingsOfGame[2] = false
            skipWord = false
        }
        
        points = settingsOfGame[0] as! Int
        time = settingsOfGame[1] as! Int
        
//        print(settingsOfGame)
    }
    
    func checkSettingsAreChosen () {
        switch settingsPointsAreChosen {
        case true:
            switch settingsTimeAreChosen {
            case true:
                break
            default:
                settingsOfGame[1] = Int(timeArray[0]) ?? 0
            }
        default:
            switch settingsTimeAreChosen {
            case true:
                settingsOfGame[0] = Int(pointsArray[0]) ?? 0
            default:
                settingsOfGame[0] = Int(pointsArray[0]) ?? 0
                settingsOfGame[1] = Int(timeArray[0]) ?? 0
            }
        }
    }
    
    func initializePickersWithChosenSettings (){
        indexOfChosenPickerSettings[0] = pointsArray.firstIndex(of: String(points))!
        indexOfChosenPickerSettings[1] = pointsArray.firstIndex(of: String(time))!
        print("indexes \(indexOfChosenPickerSettings)")
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource { //дополнение UIPicker
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var returnIndex: Int = 0

        if pickerView.tag == 0 { returnIndex = pointsArray.count}
        else if pickerView.tag == 1 {returnIndex = timeArray.count}

        return returnIndex
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var returnRow: String = ""

        if pickerView.tag == 0 { returnRow = pointsArray[row] }
        else if pickerView.tag == 1 {returnRow = timeArray[row]}

        return returnRow
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
//            self.pointsResult = pointsArray[row]
            pointsResult = pointsArray[row]
            settingsPointsAreChosen = true
            settingsAreChosen = true
        }
        else if pickerView.tag == 1 {
//            self.timeResult = timeArray[row]
            timeResult = timeArray[row]
            settingsTimeAreChosen = true
            settingsAreChosen = true
        }
    }
}

class ViewController2 : UIViewController {
    
    @IBOutlet weak var addTeamButton : UIButton!
    @IBOutlet weak var teamName1: UILabel!
    @IBOutlet weak var teamName2: UILabel!
    @IBOutlet weak var teamName3: UILabel!
    @IBOutlet weak var teamName4: UILabel!
    @IBOutlet weak var teamName5: UILabel!
    @IBOutlet weak var teamPoints1: UILabel!
    @IBOutlet weak var teamPoints2: UILabel!
    @IBOutlet weak var teamPoints3: UILabel!
    @IBOutlet weak var teamPoints4: UILabel!
    @IBOutlet weak var teamPoints5: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var cross1: UIButton!
    @IBOutlet weak var cross2: UIButton!
    @IBOutlet weak var cross3: UIButton!
    @IBOutlet weak var cross4: UIButton!
    @IBOutlet weak var cross5: UIButton!
    
    var teamToPlayRound = 0 // инициализация переменной, которая будет хранить в себе номер команды, которая играет раунд. Она визначально 0, а потом данные будут приходить из WordGuessController
    var teamToPlayerRoundFromWordGuessController:Int?
    
    @IBAction func startGame(_ sender: Any) {
//        if (teamNames.count > 2) {
//            performSegue(withIdentifier: "startGame", sender: sender)
//            //идем дальше, иначе нет
//        }
        print("teamNames.count \(teamNames.count)")
        if(teamNames.count >= 2){
            performSegue(withIdentifier: "startGame", sender: sender)
        }
        else {
            let alert = UIAlertController(title: "СТОП", message: "Нужно более 2 команд", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                             switch action.style{
                             case .default:
                                   print("default")

                             case .cancel:
                                   print("cancel")

                             case .destructive:
                                   print("destructive")


                       }}))
                       self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func deleteTeam(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            relocateTeamsRows(sender.tag)
        case 2:
            relocateTeamsRows(sender.tag)
        case 3:
            relocateTeamsRows(sender.tag)
        case 4:
            relocateTeamsRows(sender.tag)
        case 5:
            relocateTeamsRows(sender.tag)
        default:
            print("Hello")
        }
    }

    func getAllLabels() -> [UILabel]{
        let labels = self.view.subviews.compactMap { $0 as? UILabel }
        
        let modifiedArray = labels.filter { $0.tag != 0 }

        for label in modifiedArray {
            print(label.text ?? "")
        }
        return modifiedArray
    }
    
    func getAllButtons() -> [UIButton]{
        let buttons = self.view.subviews.compactMap { $0 as? UIButton }
        
        let modifiedArray = buttons.filter { $0.tag != 0 }
        
        for button in modifiedArray {
            print(button.tag)
        }
        return modifiedArray
    }

  
    func relocateTeamsRows (_ indexOfDeletedItem : Int) {
        if (indexOfDeletedItem != 99) {
            teamNames.remove(at: indexOfDeletedItem-1)
            teamPoints.remove(at: indexOfDeletedItem-1)
        }
        
        var allLabels = getAllLabels()
        var allButtons = getAllButtons()
        //        print(allLabels)
        //        print(allButtons)

        for i in allLabels {
            i.text = ""
        }
        
        for i in allButtons{
            i.isHidden = true
        }
        
        for (index, element) in teamNames.enumerated() {
            for i in allButtons {
                if (i.tag == index + 1) {
                    i.isHidden = false
                }
            }
            for i in allLabels{
                if (i.tag == 2 * index + 1){
                    i.text = element
                }
                else if (i.tag == 2 * index + 2){
                    i.text = "0"
                }
                else {
                 print("Out of scope")
                }
            }
        }
        
        print("Deletednames \(teamNames)")
        print("Deletedpoints \(teamPoints)")
        
    }
    
    
    @IBAction func showAlertAction(sender: AnyObject) {
        let alert = UIAlertController(title: "Название команды", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Введите название команды..."
        })

        alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: { action in
            var letAddMore = true
            if let name = alert.textFields?.first?.text {
                print("Название команды: \(name)")
                let numberOfTeams = teamNames.count
                switch numberOfTeams {
                case 0:
                    self.teamName1.text = name
                    self.teamPoints1.text = String(0)
                    self.cross1.isHidden = false
                case 1:
                    self.teamName2.text = name
                    self.teamPoints2.text = String(0)
                    self.cross2.isHidden = false
                case 2:
                    self.teamName3.text = name
                    self.teamPoints3.text = String(0)
                    self.cross3.isHidden = false
                case 3:
                    self.teamName4.text = name
                    self.teamPoints4.text = String(0)
                    self.cross4.isHidden = false
                case 4:
                    self.teamName5.text = name
                    self.teamPoints5.text = String(0)
                    self.cross5.isHidden = false
                default:
                    let alert = UIAlertController(title: "Команд более 5", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in }))
                    self.present(alert, animated: true)
                    letAddMore = false
                }
                if letAddMore {
                    teamNames.append(name)
                    teamPoints.append(0)
                }
            }
            print(teamNames)
            print(teamPoints)
        }))

        self.present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2nd ViewController did load \(settingsOfGame)")
//        usernameLabel?.text = teamToPlay // заготовка для принятия данных из контроллера WordGuess, а именно команды (int) которая играет следующая.
        test = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (teamNames.count > 0){
            relocateTeamsRows(99) // 99 - если ничего не удалялось, а просто нужно заново отрендерить
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) // пересылаем данные из данного ViewController-а в следующий
    {
        teamToPlayRound = teamToPlayerRoundFromWordGuessController ?? 0
        print("Team \(teamToPlayRound)")
        if segue.destination is WordGuessViewController
        { // передаем данные
            let vc = segue.destination as? WordGuessViewController
            vc?.teamToPlayRound = teamToPlayRound //передаем индекс команды, которая будет играть
            vc?.age = "Hello"
            vc?.teamInfo = teamNames //массив String команд
            vc?.timeSettings = time // Int времени
            vc?.pointSettings = points // Int очков
            vc?.skipWordSettings = skipWord // Bool пропуск слова
//            vc?.teamPoints = teamPoints
        }
    }
}

