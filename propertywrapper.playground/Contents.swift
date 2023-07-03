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
