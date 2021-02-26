import NIO
import GRPC

public class MusaProvider: MusaServiceProvider {
    
    public init() {}
    
    public var interceptors: MusaServiceServerInterceptorFactoryProtocol?
    
    public func createBloomInstance(request: CreateBloomInstanceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<CreateBloomInstanceResponse> {
        return context.eventLoop.makeSucceededFuture({
            var response = CreateBloomInstanceResponse()
            response.instanceID = "id works"
            return response
        }())
    }
}
