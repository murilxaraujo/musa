protoc Musa.proto \
    --proto_path=./ \
    --swift_opt=Visibility=Public \
    --swift_out=Sources/MusaCore/Model \
    --grpc-swift_opt=Visibility=Public \
    --grpc-swift_out=Sources/MusaCore/Model