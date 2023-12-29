//
//  UserListViewController+CoreDataCRUD.swift
//  CoreData_Starter
//

//import CoreData

//MARK: - ⭐️ CoreData CURD 구현하기 ⭐️
extension UserListViewController: CoreDataManagable {
    func saveCoreData(_ data: User) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData에 User data를 저장하세요.
        // ---------------------------------------------------------------------------------------------------------//
        let context = CoreDataManger.shared.context
        let userEntity = UserEntity(context: context)
        userEntity.id = data.id
        userEntity.name = data.name
        
        CoreDataManger.shared.saveContext()
    }
    
    func fetchCoreData() -> [User] {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 모든 User data를 가져오세요.
        // ---------------------------------------------------------------------------------------------------------//
        
        let request = UserEntity.fetchRequest()
        let result = CoreDataManger.shared.fetchData(request)
        let users: [User] = result.compactMap { userEntity in
            guard let id = userEntity.id,
                  let name = userEntity.name
            else { return nil }
            return User(id: id, name: name, jokes: [])
        }
        return users // 샘플 데이터입니다. CoreData에서 받아올 수 있도록 변경해보세요.
    }
    
    func updateCoreData(_ data: User) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 특정 User data를 업데이트하세요.
        // ---------------------------------------------------------------------------------------------------------//
        
    }
    
    func deleteCoreData(_ data: User) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 특정 User data를 삭제하세요.
        // ---------------------------------------------------------------------------------------------------------//
        
    }
}
