import Foundation

class User {
    let name: String
    let id: String
    init(name: String, id: String) {
        self.id = id
        self.name = name
    }
}

actor UserStorage{
    private var store = [String: User]()
    
    func get(_ id: String) -> User? {
        return store[id]
    }
    
    func save(_ user: User){
        store[user.id] = user
    }
    
    init() {}
    
}

let user = User(name: "vivek", id: "123")
let storage = UserStorage()

Task{
    await storage.save(user)
    let getUser = await storage.get("123")
    print(String(describing: getUser))
}


