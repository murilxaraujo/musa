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
  ) -> UnaryCall<CreateBloomInstanceRequest, BloomInstanceID>

  func getBloomInstanceIP(
    _ request: BloomInstanceID,
    callOptions: CallOptions?
  ) -> UnaryCall<BloomInstanceID, GetBloomInstanceIPResponse>

  func disableBloomInstance(
    _ request: BloomInstanceID,
    callOptions: CallOptions?
  ) -> UnaryCall<BloomInstanceID, Void>

  func enableBloomInstance(
    _ request: BloomInstanceID,
    callOptions: CallOptions?
  ) -> UnaryCall<BloomInstanceID, Void>

  func getBloomInstanceStatus(
    _ request: BloomInstanceID,
    callOptions: CallOptions?
  ) -> UnaryCall<BloomInstanceID, GetBloomInstanceStatusResponse>
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
  ) -> UnaryCall<CreateBloomInstanceRequest, BloomInstanceID> {
    return self.makeUnaryCall(
      path: "/MusaService/createBloomInstance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makecreateBloomInstanceInterceptors() ?? []
    )
  }

  /// Unary call to getBloomInstanceIP
  ///
  /// - Parameters:
  ///   - request: Request to send to getBloomInstanceIP.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getBloomInstanceIP(
    _ request: BloomInstanceID,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<BloomInstanceID, GetBloomInstanceIPResponse> {
    return self.makeUnaryCall(
      path: "/MusaService/getBloomInstanceIP",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makegetBloomInstanceIPInterceptors() ?? []
    )
  }

  /// Unary call to disableBloomInstance
  ///
  /// - Parameters:
  ///   - request: Request to send to disableBloomInstance.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func disableBloomInstance(
    _ request: BloomInstanceID,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<BloomInstanceID, Void> {
    return self.makeUnaryCall(
      path: "/MusaService/disableBloomInstance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makedisableBloomInstanceInterceptors() ?? []
    )
  }

  /// Unary call to enableBloomInstance
  ///
  /// - Parameters:
  ///   - request: Request to send to enableBloomInstance.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func enableBloomInstance(
    _ request: BloomInstanceID,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<BloomInstanceID, Void> {
    return self.makeUnaryCall(
      path: "/MusaService/enableBloomInstance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeenableBloomInstanceInterceptors() ?? []
    )
  }

  /// Unary call to getBloomInstanceStatus
  ///
  /// - Parameters:
  ///   - request: Request to send to getBloomInstanceStatus.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getBloomInstanceStatus(
    _ request: BloomInstanceID,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<BloomInstanceID, GetBloomInstanceStatusResponse> {
    return self.makeUnaryCall(
      path: "/MusaService/getBloomInstanceStatus",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makegetBloomInstanceStatusInterceptors() ?? []
    )
  }
}

public protocol MusaServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'createBloomInstance'.
  func makecreateBloomInstanceInterceptors() -> [ClientInterceptor<CreateBloomInstanceRequest, BloomInstanceID>]

  /// - Returns: Interceptors to use when invoking 'getBloomInstanceIP'.
  func makegetBloomInstanceIPInterceptors() -> [ClientInterceptor<BloomInstanceID, GetBloomInstanceIPResponse>]

  /// - Returns: Interceptors to use when invoking 'disableBloomInstance'.
  func makedisableBloomInstanceInterceptors() -> [ClientInterceptor<BloomInstanceID, Void>]

  /// - Returns: Interceptors to use when invoking 'enableBloomInstance'.
  func makeenableBloomInstanceInterceptors() -> [ClientInterceptor<BloomInstanceID, Void>]

  /// - Returns: Interceptors to use when invoking 'getBloomInstanceStatus'.
  func makegetBloomInstanceStatusInterceptors() -> [ClientInterceptor<BloomInstanceID, GetBloomInstanceStatusResponse>]
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

  func createBloomInstance(request: CreateBloomInstanceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<BloomInstanceID>

  func getBloomInstanceIP(request: BloomInstanceID, context: StatusOnlyCallContext) -> EventLoopFuture<GetBloomInstanceIPResponse>

  func disableBloomInstance(request: BloomInstanceID, context: StatusOnlyCallContext) -> EventLoopFuture<Void>

  func enableBloomInstance(request: BloomInstanceID, context: StatusOnlyCallContext) -> EventLoopFuture<Void>

  func getBloomInstanceStatus(request: BloomInstanceID, context: StatusOnlyCallContext) -> EventLoopFuture<GetBloomInstanceStatusResponse>
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
        responseSerializer: ProtobufSerializer<BloomInstanceID>(),
        interceptors: self.interceptors?.makecreateBloomInstanceInterceptors() ?? [],
        userFunction: self.createBloomInstance(request:context:)
      )

    case "getBloomInstanceIP":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<BloomInstanceID>(),
        responseSerializer: ProtobufSerializer<GetBloomInstanceIPResponse>(),
        interceptors: self.interceptors?.makegetBloomInstanceIPInterceptors() ?? [],
        userFunction: self.getBloomInstanceIP(request:context:)
      )

    case "disableBloomInstance":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<BloomInstanceID>(),
        responseSerializer: ProtobufSerializer<Void>(),
        interceptors: self.interceptors?.makedisableBloomInstanceInterceptors() ?? [],
        userFunction: self.disableBloomInstance(request:context:)
      )

    case "enableBloomInstance":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<BloomInstanceID>(),
        responseSerializer: ProtobufSerializer<Void>(),
        interceptors: self.interceptors?.makeenableBloomInstanceInterceptors() ?? [],
        userFunction: self.enableBloomInstance(request:context:)
      )

    case "getBloomInstanceStatus":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<BloomInstanceID>(),
        responseSerializer: ProtobufSerializer<GetBloomInstanceStatusResponse>(),
        interceptors: self.interceptors?.makegetBloomInstanceStatusInterceptors() ?? [],
        userFunction: self.getBloomInstanceStatus(request:context:)
      )

    default:
      return nil
    }
  }
}

public protocol MusaServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'createBloomInstance'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makecreateBloomInstanceInterceptors() -> [ServerInterceptor<CreateBloomInstanceRequest, BloomInstanceID>]

  /// - Returns: Interceptors to use when handling 'getBloomInstanceIP'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makegetBloomInstanceIPInterceptors() -> [ServerInterceptor<BloomInstanceID, GetBloomInstanceIPResponse>]

  /// - Returns: Interceptors to use when handling 'disableBloomInstance'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makedisableBloomInstanceInterceptors() -> [ServerInterceptor<BloomInstanceID, Void>]

  /// - Returns: Interceptors to use when handling 'enableBloomInstance'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeenableBloomInstanceInterceptors() -> [ServerInterceptor<BloomInstanceID, Void>]

  /// - Returns: Interceptors to use when handling 'getBloomInstanceStatus'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makegetBloomInstanceStatusInterceptors() -> [ServerInterceptor<BloomInstanceID, GetBloomInstanceStatusResponse>]
}
