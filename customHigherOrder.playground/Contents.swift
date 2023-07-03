import Foundation

extension Array{
    func customMap<Transform>(transform: (Element)-> Transform)-> [Transform]{

        var results = [Transform]()
        forEach{ element in
            results.append(transform(element))
        }
        return results
    }
}

let array = [1,2,3,4,5,6,7]
let newArray = array.customMap { $0*2 }
print(newArray)


// Ex-Partition of Array based on even or odd

extension Array{
    
    func expartition( isIncluded: (Element) -> Bool) -> [Element] {
        var results = [Element]()
        
        forEach{ element in
            if isIncluded(element) {
                results.append(element)
            }
        }
        return results
        
    }
}
let partitionArray = [1,2,3,4,5,6,7,8,9,10]

let results = partitionArray.expartition { $0 % 2 == 0}
print(results)
