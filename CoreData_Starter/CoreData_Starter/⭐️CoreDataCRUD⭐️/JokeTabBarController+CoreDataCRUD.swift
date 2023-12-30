//
//  JokeTabBarController+CoreDataCRUD.swift
//  CoreData_Starter
//

//MARK: - ⭐️ CoreData CURD 구현하기 ⭐️
extension JokeTabBarController: CoreDataManagable {
    func saveCoreData(currentUser: User, _ data: Joke) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData에 Joke data를 저장하세요.
        // 1. 우선 currentUser 파라미터를 사용하지 말고, Joke data를 저장해보세요.
        // 2. 나중에 User에 관한 CoreData CRUD가 완성이 되면, 그때 currentUser 파라미터를 사용하여 Relationship을 설정하도록 해봅니다.
        // ---------------------------------------------------------------------------------------------------------//
        
        let context = CoreDataManger.shared.context
        let jokeEntity = JokeEntity(context: context)
        jokeEntity.id = data.id
        jokeEntity.content = data.content
        jokeEntity.category = data.category.value
        
        let request = UserEntity.fetchRequest()
        request.predicate = FilterPredicate.id(currentUser.id).nsPredicate
        let result = CoreDataManger.shared.fetchData(request)
        
        if let userToRelationship = result.first {
            userToRelationship.addToJokeRelationship(jokeEntity)
        }
        
        CoreDataManger.shared.saveContext()
    }
    
    func fetchWithPredicate(currentUser: User, currentCategory: Category) -> [Joke] {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 Joke data들을 가져오세요.
        // 1. 우선 currentUser, CurrentCategory 파라미터를 사용하지 말고, 모든 Joke 데이터를 return 해보세요.
        // 2. 나중에 User와 Relationship을 설정하여 Joke를 저장한 경우, 그때 NSPredicate를 활용하여 원하는 Joke들을 가져옵니다.
        // ---------------------------------------------------------------------------------------------------------//

        // ---------------------------------------------------------------------------------------------------------//
        // 설정해야 하는 NSPredicate 조건은 두 가지 입니다.
        // 1. 현재 선택된 User - currentUser 파라미터 활용
        // 2. 현재 선택된 Category - currentCategory 파라미터 활용
        // 위 두 가지를 만족하는 데이터들만 가져올 수 있도록 NSPredicate를 만들어보세요.
        // ---------------------------------------------------------------------------------------------------------//
        
        let request = JokeEntity.fetchRequest()
        request.predicate = FilterPredicate.filteredJoke(id: currentUser.id, category: currentCategory.value).nsPredicate
        
        let result = CoreDataManger.shared.fetchData(request)
        let jokes: [Joke] = result.compactMap { jokeEntity in
            guard let id = jokeEntity.id,
                  let content = jokeEntity.content,
                  let category = Category(rawValue: Int(jokeEntity.category))
            else { return nil }
            
            return Joke(id: id, content: content, category: category)
        }
        
        return jokes
    }
    
    func updateCoreData(_ data: Joke) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 특정 Joke data를 업데이트하세요.
        // ---------------------------------------------------------------------------------------------------------//
        
        let context = CoreDataManger.shared.context
        let request = JokeEntity.fetchRequest()
        request.predicate = FilterPredicate.id(data.id).nsPredicate
        
        let result = CoreDataManger.shared.fetchData(request)
        if let jokeToUpdate = result.first {
            jokeToUpdate.category = data.category.value
            jokeToUpdate.content = data.content
        }
        
        CoreDataManger.shared.saveContext()
    }
    
    func deleteCoreData(_ data: Joke) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 특정 Joke data를 삭제하세요.
        // ---------------------------------------------------------------------------------------------------------//
        
        let context = CoreDataManger.shared.context
        let request = JokeEntity.fetchRequest()
        request.predicate = FilterPredicate.id(data.id).nsPredicate
        
        let result = CoreDataManger.shared.fetchData(request)
        if let jokeToDelete = result.first {
            context.delete(jokeToDelete)
        }
        
        CoreDataManger.shared.saveContext()
    }
}
