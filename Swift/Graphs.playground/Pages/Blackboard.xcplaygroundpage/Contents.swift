import UIKit
protocol AccessTokenResponse {
	var access_token: String {get}
	var token_type: String {get}
	var scope: String {get}
	var created_at: Double {get}
}

struct UnsplashAccessTokenResponse:AccessTokenResponse {
	var access_token: String
	var token_type: String
	var scope: String
	var created_at: Double
}

protocol UserSession {
	associatedtype AccessResponse
	var accessTokenResponse: AccessResponse {get}
	var accessToken: String {get}
}


final class UnsplashUserSession<AccessResponse:AccessTokenResponse>: UserSession {
	var accessToken: String
	var accessTokenResponse: AccessResponse
	
	init(accessTokenResponse: AccessResponse){
		self.accessToken = accessTokenResponse.access_token
		self.accessTokenResponse = accessTokenResponse
	}
}
extension UnsplashUserSession: Codable where AccessResponse: Codable {}


print("test")
