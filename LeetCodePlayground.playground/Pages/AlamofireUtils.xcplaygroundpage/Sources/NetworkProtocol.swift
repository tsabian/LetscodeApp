import Alamofire

public enum NetworkError: Error {
    case invalidURL
}

public protocol NetworkProtocol: URLRequestConvertible {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var queryValues: [URLQueryItem]? { get }
    var endpoint: String { get }
}

// MARK: - NetworkProtocol

public extension NetworkProtocol {
    var queryValues: [URLQueryItem]? {
        nil
    }

    func asURLRequest() throws -> URLRequest {
        guard var component = URLComponents(string: baseURL) else {
            if let urlConvertible = self as? URLConvertible {
                throw AFError.invalidURL(url: urlConvertible)
            }
            throw NetworkError.invalidURL
        }
        if let items = queryValues {
            component.queryItems = items
        }
        var request = try URLRequest(url: component.asURL().appendingPathComponent(endpoint))
        request.method = method
        return request
    }
}
