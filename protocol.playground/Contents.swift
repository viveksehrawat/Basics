import Foundation

protocol FullyNamed {
 var fullName: String { get }
}
struct Detective: FullyNamed {
 var fullName: String
}
let hercule = Detective(fullName: "Hercule Poirot")
print(hercule.fullName)
