//
//  Category.swift
//  CoreData_Starter
//

enum Category: Int {
    case catchphrase
    case dadJoke
    
    var cellIdentifier: String {
        switch self {
        case .catchphrase: return "CatchphraseCell"
        case .dadJoke: return "DadJokeCell"
        }
    }
}
