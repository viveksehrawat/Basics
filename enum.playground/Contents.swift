import UIKit


enum Result<T>{
    case success(T)
    case failure(Error)
}

func fetchData(completion: (Result<String>) -> Void){
    
    let successResult = Result.success("Success")
    completion(successResult)
    
}

fetchData(completion: {
    result in
    switch(result){
    case .success(let name):
        print("success \(name)")
    case .failure(let error):
        print("success \(error)")
    }
})




