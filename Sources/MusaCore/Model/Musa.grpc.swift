//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: Musa.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate `MusaServiceClient`, then call methods of this protocol to make API calls.
public protocol MusaServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: MusaServiceClientInterceptorFactoryProtocol? { get }

  func createBloomInstance(
    _ request: CreateBloomInstanceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<CreateBloomInstanceRequest, CreateBloomInstanceResponse>
}

extension MusaServiceClientProtocol {
  public var serviceName: String {
    return "MusaService"
  }

  /// Unary call to createBloomInstance
  ///
  /// - Parameters:
  ///   - request: Request to send to createBloomInstance.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func createBloomInstance(
    _ request: CreateBloomInstanceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<CreateBloomInstanceRequest, CreateBloomInstanceResponse> {
    return self.makeUnaryCall(
      path: "/MusaService/createBloomInstance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makecreateBloomInstanceInterceptors() ?? []
    )
  }
}

public protocol MusaServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'createBloomInstance'.
  func makecreateBloomInstanceInterceptors() -> [ClientInterceptor<CreateBloomInstanceRequest, CreateBloomInstanceResponse>]
}

public final class MusaServiceClient: MusaServiceClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: MusaServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the MusaService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: MusaServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
public protocol MusaServiceProvider: CallHandlerProvider {
  var interceptors: MusaServiceServerInterceptorFactoryProtocol? { get }

  func createBloomInstance(request: CreateBloomInstanceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<CreateBloomInstanceResponse>
}

extension MusaServiceProvider {
  public var serviceName: Substring { return "MusaService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "createBloomInstance":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<CreateBloomInstanceRequest>(),
        responseSerializer: ProtobufSerializer<CreateBloomInstanceResponse>(),
        interceptors: self.interceptors?.makecreateBloomInstanceInterceptors() ?? [],
        userFunction: self.createBloomInstance(request:context:)
      )

    default:
      return nil
    }
  }
}

public protocol MusaServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'createBloomInstance'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makecreateBloomInstanceInterceptors() -> [ServerInterceptor<CreateBloomInstanceRequest, CreateBloomInstanceResponse>]
}
