//
//  TeamResultsViewController.swift
//  Alias
//
//  Created by  Vladyslav on 2/4/20.
//  Copyright © 2020  Vladyslav. All rights reserved.
//

import UIKit

var totalScore = [0, 0, 0, 0, 0]


class TeamResultsViewController: UIViewController {
    
    var pointsFromRound:Int!
    var teamToPlayerRoundFromWordGuessController:Int = 0
    var teamNames:[String] = []
    var teamPoints = 0
    var pointsToEndTheGame = 0
    var teamToCountPoints = 0
    var timeSettings: Int!
    var pointSettings: Int = 0
    var skipWordSettings: Bool!
    
    var timer = Timer()
    
    
    @IBAction func nextRound (_ sender: Any){
        performSegue(withIdentifier: "nextRound", sender: sender)
    }
    
    @IBAction func newGame () {
        totalScore = [0,0,0,0,0]
    }
    
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var newGameButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (teamToPlayerRoundFromWordGuessController == 0){
            teamToCountPoints = teamNames.count
        }
        else {
            teamToCountPoints = teamToPlayerRoundFromWordGuessController
        }
        totalScore[teamToCountPoints-1] += teamPoints
        relocateTeamsRows(teamToCountPoints-1)
        
        print("totalScore \(totalScore)")
        print("teamToCount \(teamNames.count)")
        print("teamToCountPoints \(teamToCountPoints)")
        print("pointSettings \(pointSettings)")
        //        print("winners \(teamNames.count)")
        //        if (teamToCountPoints == teamNames.count) {
        //            var winners:Int = 99
        //            for (index , element) in totalScore.enumerated() {
        //                print("element \(element)")
        //                if element >= pointSettings && winners == 99 {
        //                    winners = index
        //                }
        //                else if element >= pointSettings && winners != 99 {
        //                print("element \(element)")
        //                    if (element > totalScore[winners]){
        //                       winners = index
        //                    }
        //                }
        //            }
        //            if (winners != 99){
        //                nextRoundButton.isHidden = true
        //                        let alert = UIAlertController(title: "WINNER", message: "Победили \(teamNames[winners])", preferredStyle: .alert)
        //                                  alert.addAction(UIAlertAction(title: "Ура !", style: .default, handler: { action in
        //                                        switch action.style{
        //                                        case .default:
        //                                              print("default")
        //
        //                                        case .cancel:
        //                                              print("cancel")
        //
        //                                        case .destructive:
        //                                              print("destructive")
        //
        //
        //                                  }}))
        //                                  self.present(alert, animated: true, completion: nil)
        //            }
        //        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: false)
    }
    
    @objc func updateCounting(){
        var messageWin = ""
        if (teamToCountPoints == teamNames.count) {
            var winners:[Int] = []
            for (index , element) in totalScore.enumerated() {
                print("element \(element)")
                if element >= pointSettings && winners.count == 0 {
                    winners.append(index)
                }
                else if element >= pointSettings && winners.count != 0 {
                    print("element \(element)")
                    if (element > totalScore[winners[0]]){
                        winners.removeAll()
                        winners.append(index)
                    }
                    else if(element == totalScore[winners[0]]) {
                        winners.append(index)
                    }
                }
                //            var winners:Int = 99
                //            for (index , element) in totalScore.enumerated() {
                //                print("element \(element)")
                //                if element >= pointSettings && winners == 99 {
                //                    winners = index
                //                    countOfWinners += 1
                //                }
                //                else if element >= pointSettings && winners != 99 {
                //                    print("element \(element)")
                //                    if (element > totalScore[winners]){
                //                        winners = index
                //                        countOfWinners = 1
                //                    }
                //                    else if(element == totalScore[winners]) {
                //                        countOfWinners += 1
                //                    }
                //                }
                
                
            }
            
            if (winners.count != 0){
                if winners.count == 1 {
                    messageWin = "Победитель \(teamNames[winners[0]])"
                }
                else{
                    var mergedArray:[String] = []
                    for i in winners {
                        mergedArray.append(teamNames[i])
                        }
                    messageWin = "Ничья. Победители: \(mergedArray.joined(separator: ", "))"
                }
        
                nextRoundButton.isHidden = true
                let alert = UIAlertController(title: "WINNER", message: messageWin, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ура !", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                        
                    case .cancel:
                        print("cancel")
                        
                    case .destructive:
                        print("destructive")
                        
                        
                    }}))
                self.present(alert, animated: true, completion: nil)
                newGameButton.isHidden = false
            }
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
    
    func relocateTeamsRows ( _ indexOfTeam :  Int) {
        var indexTeam = indexOfTeam
        var allLabels = getAllLabels()
        
        for (index, element) in teamNames.enumerated() {
            for i in allLabels{
                if (i.tag == 2 * index + 1){
                    i.text = element
                }
                else if (i.tag == 2 * index + 2 && i.tag <= teamNames.count * 2){
                    i.text = String(totalScore[index])
                }
                //                print("===========")
                //                print(i.tag)
                //                print(index)
                //                print(teamNames.count)
                //                print("===========")
                //                else if (i.tag > 1 && (i.tag % 2) == 0 && i.tag != 2 * indexTeam + 2) {
                //                    i.text = String(totalScore[index])
                //                 print("Out of scope")
                //                }
            }
        }
        
        //        print("Deletednames \(teamNames)")
        //        print("Deletedpoints \(teamPoints)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) // пересылаем данные из данного ViewController-а в следующий
    {
        if segue.destination is WordGuessViewController
        { // передаем данные
            let vc = segue.destination as? WordGuessViewController
            vc?.teamToPlayRound = teamToPlayerRoundFromWordGuessController
            vc?.teamInfo = teamNames //массив String команд
            vc?.timeSettings = timeSettings // Int времени
            vc?.pointSettings = pointSettings
            vc?.skipWordSettings = skipWordSettings // Bool пропуск слова
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
