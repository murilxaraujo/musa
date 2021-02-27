import NIO
import GRPC
import SwiftkubeClient
import SwiftkubeModel

fileprivate enum MusaServiceErrors: Error {
    case cantFindServiceIP
    case cantFindDeployment
}

public class MusaProvider: MusaServiceProvider {

    let client: KubernetesClient
    
    public init() {
        self.client = KubernetesClient()!
    }
    
    public var interceptors: MusaServiceServerInterceptorFactoryProtocol?
    
    public func createBloomInstance(request: CreateBloomInstanceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<BloomInstanceID> {
        let deployment = apps.v1.Deployment(
            metadata: meta.v1.ObjectMeta(
                annotations: [:],
                clusterName: nil,
                creationTimestamp: nil,
                deletionGracePeriodSeconds: nil,
                deletionTimestamp: nil,
                finalizers: nil,
                generateName: nil,
                generation: nil,
                labels: [:],
                managedFields: nil,
                name: "bloom-\(request.clientID)",
                namespace: nil,
                ownerReferences: nil,
                resourceVersion: nil,
                selfLink: nil,
                uid: nil),
            spec: apps.v1.DeploymentSpec(
                minReadySeconds: nil,
                paused: nil,
                progressDeadlineSeconds: nil,
                replicas: 0,
                revisionHistoryLimit: nil,
                selector: meta.v1.LabelSelector(matchExpressions: nil, matchLabels: nil),
                strategy: nil,
                template: core.v1.PodTemplateSpec(metadata: nil, spec: nil)),
            status: nil)
        return client.appsV1.deployments.create(deployment).flatMapThrowing { (readyDeployment) throws -> (BloomInstanceID) in
            if let deploymentName = readyDeployment.name {
                var response = BloomInstanceID()
                response.value = deploymentName
                return response
            } else {
                throw MusaServiceErrors.cantFindDeployment
            }
            
        }
    }
    
    public func getBloomInstanceIP(request: BloomInstanceID, context: StatusOnlyCallContext) -> EventLoopFuture<GetBloomInstanceIPResponse> {
        let instanceID = request.value
        return client.services.get(name: "bloom-\(instanceID)-service").flatMapThrowing { (service) -> (GetBloomInstanceIPResponse) in
            var response = GetBloomInstanceIPResponse()
            guard let clusterIP = service.spec?.clusterIP else {
                throw MusaServiceErrors.cantFindServiceIP
            }
            response.ip = clusterIP
            return response
        }
    }
    
    public func disableBloomInstance(request: BloomInstanceID, context: StatusOnlyCallContext) -> EventLoopFuture<Void> {
        return client.appsV1.deployments.get(name: "bloom-\(request.value)").flatMap { [unowned self] (deployment) -> EventLoopFuture<Void> in
            if deployment.spec?.replicas != 0 {
                var updatedDeployment = deployment
                updatedDeployment.spec?.replicas = 0
                return client.appsV1.deployments.update(updatedDeployment).map { (_) -> (Void) in
                    return Void()
                }
            }
            return context.eventLoop.makeSucceededFuture(Void())
        }
    }
    
    public func enableBloomInstance(request: BloomInstanceID, context: StatusOnlyCallContext) -> EventLoopFuture<Void> {
        return client.appsV1.deployments.get(name: "bloom-\(request.value)").flatMap { [unowned self] (deployment) -> EventLoopFuture<Void> in
            if deployment.spec?.replicas != 1 {
                var updatedDeployment = deployment
                updatedDeployment.spec?.replicas = 1
                return client.appsV1.deployments.update(updatedDeployment).map { (_) -> (Void) in
                    return Void()
                }
            }
            return context.eventLoop.makeSucceededFuture(Void())
        }
    }
    
    public func getBloomInstanceStatus(request: BloomInstanceID, context: StatusOnlyCallContext) -> EventLoopFuture<GetBloomInstanceStatusResponse> {
        return context.eventLoop.makeSucceededFuture(GetBloomInstanceStatusResponse())
    }
}
