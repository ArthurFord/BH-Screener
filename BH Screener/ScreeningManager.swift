//
//  ScreeningManager.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/12/23.
//

import Foundation
import CoreData

class ScreeningManager: ObservableObject {
    private(set) var screening: [Result] = []
    
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var selectedAnswer: Answer = Answer(text: "", score: 0)
    @Published private(set) var answerSelected = false
    @Published private(set) var question: String = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var score = 0
    
    //Core Data properties
    private let container: NSPersistentContainer
    private let containerName: String = "screeningContainer"
    private let entityName: String = "CESDCScreeningEntity"
    @Published var savedEntities: [CESDCScreeningEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading core data \(error.localizedDescription)")
            }
        }
        
        fetchScreening()
    }
    
    func fetchScreening() {
        index = 0
        score = 0
        progress = 0.0
        reachedEnd = false
        screening = CESDCScreening().results
        length = screening.count
        getScreenings()
        setQuestion()
    }
    
    func goToNextQuestion() {
        index += 1
        score = score + selectedAnswer.score
        if index + 1 < length {
            setQuestion()
        } else {
            reachedEnd = true
            let screening = CESDCScreening(score: Int64(score), dateTaken: .now)
            addScreening(screening: screening)
            applyChanges()
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentQuestion = screening[index]
            question = currentQuestion.question
            answerChoices = currentQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        for number in answerChoices.indices {
            answerChoices[number].isSelected = false
        }
        selectedAnswer = answer
        answerSelected = true
        selectedAnswer.isSelected = true
    }
    
    //Core Data Management
    
    private func getScreenings() {
        let request = NSFetchRequest<CESDCScreeningEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching entities \(error)")
        }
    }
    
    private func addScreening(screening: CESDCScreening) {
        let entity = CESDCScreeningEntity(context: container.viewContext)
        entity.date = screening.dateTaken
        entity.score = screening.score
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to core data \(error.localizedDescription)")
        }
    }
    
    private func applyChanges() {
        save()
        getScreenings()
    }
    
    public func delete(entity: CESDCScreeningEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
}
