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
    
    var value: Int16 {
        switch self {
        case .catchphrase:
            return 0
        case .dadJoke:
            return 1
        }
    }
}
