import Alamofire

public enum IBGENetwork: NetworkProtocol {
    case calendario

    public var baseURL: String {
        "https://servicodados.ibge.gov.br/api/v3"
    }

    public var queryValues: [URLQueryItem]? {
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "qtd", value: "10"))
        return items
    }

    public var method: HTTPMethod {
        switch self {
        case .calendario: return .get
        }
    }

    public var endpoint: String {
        switch self {
        case .calendario:
            return "/calendario/9173"
        }
    }
}
