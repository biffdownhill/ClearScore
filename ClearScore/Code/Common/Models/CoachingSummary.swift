//
//  CoachingSummary.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation

struct CoachingSummary: Codable {
    var activeTodo: Bool
    var activeChat: Bool
    var numberOfTodoItems: Int
    var numberOfCompletedTodoItems: Int
    var selected: Bool
}
