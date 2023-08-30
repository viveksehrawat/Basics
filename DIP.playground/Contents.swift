import UIKit

protocol ProductProtocol{
    var name: String { get }
    var cost: Int { get }
    var image: UIImage { get }
}

protocol NetworkProtocol{
    func getProducts(for userID: String, completion: @escaping ([ProductProtocol])-> Void)
}

struct Product :ProductProtocol{
    let name: String
    let cost: Int
    let image: UIImage
}

final class Network : NetworkProtocol{
   
    
    private let urlSession = URLSession(configuration: .default)
    
    func getProducts(for userID: String, completion: @escaping ([ProductProtocol]) -> Void) {
        guard let url = URL(string: "") else {
            completion([])
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        urlSession.dataTask(with: request) { (data, response, error) in
                    completion([Product(name: "Just an example", cost: 1000, image: UIImage())])
                }
    }
}

final class ExampleScreenViewController: UIViewController{
    private let network: NetworkProtocol // Abstraction dependency
    private var products: [ProductProtocol] // Abstraction dependency
    private let userId: String = "user-id"
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(network: Network, product: [Product]){
        self.network = network
        self.products = product
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
        
    }
    private func getProducts(){
        
    }
}
