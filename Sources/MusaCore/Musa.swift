import NIO
import GRPC
import MongoSwift

public class MusaProvider: MusaServiceProvider {
    
    let bloomDBService: BloomDBService
    
    public init(mongoClient: MongoClient) {
        self.bloomDBService = BloomDBServiceMongo(mongoClient)
    }
    
    public var interceptors: MusaServiceServerInterceptorFactoryProtocol?
    
    public func createBloomInstance(request: CreateBloomInstanceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<CreateBloomInstanceResponse> {
        return context.eventLoop.makeSucceededFuture({
            var response = CreateBloomInstanceResponse()
            response.instanceID = "id works"
            return response
        }())
    }
}
