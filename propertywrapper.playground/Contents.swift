import UIKit

@propertyWrapper
struct SavedData<Value>{
    
    var key: String
    var defaultValue: Value
    
    let container: UserDefaults = .standard
    
    var wrappedValue: Value {
        get {
            container.object(forKey: key) as? Value ?? defaultValue
        }
        set{
            container.set(newValue, forKey: key)
        }
    }
    
}

extension UserDefaults {
    public enum Keys {
        static let hasOnBoarded = "hasOnBoarded"
    }
    
    @SavedData(key: UserDefaults.Keys.hasOnBoarded, defaultValue: false)
    static var hasOnBoarded: Bool
    
    
}

func shouldShowOnBoardingUI(){
    
    if UserDefaults.hasOnBoarded {
        
    }else{
        
    }
}




@propertyWrapper
struct Injected <T>{
    private weak var value: AnyObject?
    
    var wrappedValue: T{
        mutating get {
            if let value = value as? T {
                return value
            } else {
                let resolvedValue = DependencyContainer.resolve(T.self)
                value = resolvedValue as AnyObject
                return resolvedValue
            }
        }
        set {
            value = newValue as AnyObject
        }
    }
}




final class DependencyContainer {
    private static var dependencies = [String: Any]()
    
    static func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        dependencies[key] = factory
    }
    
    static func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: type)
        guard let factory = dependencies[key] as? () -> T else {
            fatalError("Dependency not registered: \(type)")
        }
        return factory()
    }
}










// Usage example
struct MyViewController {
    @Injected
    var userService: UserService
    
    mutating func viewDidLoad() {
        // The `userService` property is automatically injected
        userService.doSomething()
    }
}

// Push
// Register the dependencies
DependencyContainer.register(UserService.self) {
    // Provide the implementation for the UserService
    return UserService()
}
var viewController = MyViewController()
viewController.viewDidLoad() // Output: "User service: doSomething"
