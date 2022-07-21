import ProjectDescription

let spm = SwiftPackageManagerDependencies([
    .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMinor(from: "15.0.0")),
    .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMinor(from: "5.0.0")),
    .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMinor(from: "6.5.0")),
    .remote(url: "https://github.com/ReactorKit/ReactorKit.git", requirement: .upToNextMinor(from: "3.2.0")),
    .remote(url: "https://github.com/devxoul/Then.git", requirement: .upToNextMinor(from: "3.0.0")),
    .remote(url: "https://github.com/kakao/kakao-ios-sdk", requirement: .upToNextMinor(from: "2.11.0"))
])

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: spm,
    platforms: [.iOS]
)
