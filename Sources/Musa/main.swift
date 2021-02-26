import GRPC
import NIO
import MusaCore
import MongoSwift

let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
let mongoClient = try MongoClient("", using: group)

defer {
    try? mongoClient.syncClose()
    cleanupMongoSwift()
    try! group.syncShutdownGracefully()
}

let provider = MusaProvider(mongoClient: mongoClient)

let server = Server.insecure(group: group)
    .withServiceProviders([provider])
    .bind(host: "localhost", port: 50000)

server.map {
    $0.channel.localAddress
}.whenSuccess { address in
    print("server started on port \(address!.port!)")
}

_ = try server.flatMap {
  $0.onClose
}.wait()

