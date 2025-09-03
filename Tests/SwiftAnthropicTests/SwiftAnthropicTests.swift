import XCTest
@testable import SwiftAnthropic

final class SwiftAnthropicTests: XCTestCase {
//    func testEndpointConstruction() throws {
//       let endpoint = AnthropicAPI(
//         base: "https://api.example.org/my/path",
//         apiPath: .messages
//       )
//       let comp = endpoint.urlComponents(
//         queryItems: [URLQueryItem(name: "query", value: "value")]
//       )
//       XCTAssertEqual(
//         "https://api.example.org/my/path/v1/messages?query=value",
//         comp.url!.absoluteString
//       )
//    }

//  func testDecodeToolResult() throws {
//      let json = """
//    {
//      "tool_use_id":"toolu_01Er3b5UGnW7zAnReXT6iRSY",
//      "type":"tool_result",
//      "content":"Building for debugging...\\nBuild complete!",
//      "is_error":false
//    }
//    """.data(using: .utf8)!
//
//      let decoder = JSONDecoder()
//      let block = try decoder.decode(MessageResponse.Content.self, from: json)
//      guard case .toolResult(let tr) = block else { return XCTFail("Expected toolResult") }
//      XCTAssertEqual(tr.toolUseId, "toolu_01Er3b5UGnW7zAnReXT6iRSY")
//      XCTAssertEqual(tr.isError, false)
//      guard case .string(let s) = tr.content else { return XCTFail("Expected string content") }
//      XCTAssertTrue(s.hasPrefix("Building for debugging"))
//    }

  public struct UserMessage: Decodable {
    public let type: String
    public let sessionId: String
    public let message: UserMessageContent

    public struct UserMessageContent: Decodable {
      public let role: String
      public let content: [MessageResponse.Content]
    }
  }

  func testDecodeMessageResponse() throws {
    let json = """
    {"type":"user","message":{"role":"user","content":[{"tool_use_id":"toolu_01Er3b5UGnW7zAnReXT6iRSY","type":"tool_result","content":"Building for debugging... [0/3] Write swift-version--58304C5D6DBC2206.txt Build complete! (0.18s)","is_error":false}]},"parent_tool_use_id":null,"session_id":"305b5dab-a267-4071-931d-2641bd8d1c52","uuid":"b754deba-ffcb-491f-a701-8f12efc10d9f"}
    """.data(using: .utf8)!

    let decoder = JSONDecoder()
    let block = try decoder.decode(UserMessage.self, from: json)
//    guard case .toolResult(let tr) = block else { return XCTFail("Expected toolResult") }
//    XCTAssertEqual(tr.toolUseId, "toolu_014wahiMrVa8cPSy8qjzhq9N")
//    XCTAssertEqual(tr.isError, false)
    print("[!] block: \(block)")
  }
}
