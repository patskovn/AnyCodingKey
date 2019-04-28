import XCTest
@testable import AnyCodingKey

final class AnyCodingKeyTests: XCTestCase {
	
	func testDataBytesCount() {
		print(value.count)
	}
	
    func testSnakeCaseDecoderPerformance() {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		measure {
			do {
				let _ = try decoder.decode(Welcome.self, from: value)
			} catch {
				XCTFail(error.localizedDescription)
			}
		}
    }
	
	func testAnyCodingKeyDecoderPerformance() {
		let anyCodingKeysDecoder = JSONDecoder()
		anyCodingKeysDecoder.keyDecodingStrategy = anyCodingKeyStrategy
		
		measure {
			do {
				let _ = try anyCodingKeysDecoder.decode(Welcome.self, from: value)
			} catch {
				XCTFail(error.localizedDescription)
			}
		}
	}

	typealias Welcome = [WelcomeElement]
	
	struct WelcomeElement: Codable {
		let id: String
		let index: Int
		let guid: String
		let isActive: Bool
		let balance: String
		let picture: String
		let age: Int
		let eyeColor: String
		let name: Name
		let company, email, phone, address: String
		let about, registered, latitude, longitude: String
		let tags: [String]
		let range: [Int]
		let friends: [Friend]
		let greeting, favoriteFruit: String
	}
	
	struct Friend: Codable {
		let id: Int
		let name: String
	}
	
	struct Name: Codable {
		let first, last: String
	}

	
    static var allTests = [
		("testSnakeCaseDecoderPerformance", testSnakeCaseDecoderPerformance),
		("testAnyCodingKeyDecoderPerformance", testAnyCodingKeyDecoderPerformance),
    ]
	
	let value = """
		[{
		"id": "5cc59c2d08ef0f3c3624f049",
		"index": 0,
		"guid": "c4868e7a-4990-4d0e-b579-a6326175effd",
		"is_active": true,
		"balance": "$3,578.41",
		"picture": "http://placehold.it/32x32",
		"age": 37,
		"eye_color": "brown",
		"name": {
			"first": "Lidia",
			"last": "Barnes"
		},
		"company": "ULTRIMAX",
		"email": "lidia.barnes@ultrimax.biz",
		"phone": "+1 (917) 432-2369",
		"address": "739 Stewart Street, Tyhee, Puerto Rico, 6846",
		"about": "Exercitation amet pariatur fugiat sint exercitation Lorem. Occaecat esse velit tempor culpa laborum tempor id veniam sint ipsum. Anim cupidatat pariatur mollit laboris voluptate laborum veniam consectetur labore proident ex.",
		"registered": "Thursday, May 3, 2018 8:36 AM",
		"latitude": "-19.533993",
		"longitude": "-85.461766",
		"tags": [
			"occaecat",
			"deserunt",
			"aute",
			"amet",
			"reprehenderit"
		],
		"range": [
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		],
		"friends": [{
				"id": 0,
				"name": "Shelby Sweeney"
			},
			{
				"id": 1,
				"name": "Dominique Hartman"
			},
			{
				"id": 2,
				"name": "Janell Turner"
			}
		],
		"greeting": "Hello, Lidia! You have 5 unread messages.",
		"favorite_fruit": "banana"
		},
		{
		"id": "5cc59c2d937f0bf8b4e664c4",
		"index": 1,
		"guid": "753165b7-1d5f-4803-aace-930fc2b431f2",
		"is_active": false,
		"balance": "$3,543.68",
		"picture": "http://placehold.it/32x32",
		"age": 39,
		"eye_color": "green",
		"name": {
			"first": "Ebony",
			"last": "Hatfield"
		},
		"company": "BULLJUICE",
		"email": "ebony.hatfield@bulljuice.org",
		"phone": "+1 (851) 489-2262",
		"address": "803 King Street, Hondah, Rhode Island, 9798",
		"about": "Nisi do commodo voluptate occaecat excepteur mollit anim adipisicing culpa exercitation veniam. Ex incididunt id exercitation ad. Laboris ullamco amet eiusmod ut eu occaecat reprehenderit enim culpa.",
		"registered": "Wednesday, May 13, 2015 7:02 AM",
		"latitude": "-25.056441",
		"longitude": "-154.578238",
		"tags": [
			"ad",
			"velit",
			"laborum",
			"adipisicing",
			"officia"
		],
		"range": [
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		],
		"friends": [{
				"id": 0,
				"name": "Velma Mccray"
			},
			{
				"id": 1,
				"name": "Celeste Cooke"
			},
			{
				"id": 2,
				"name": "Shelton Barr"
			}
		],
		"greeting": "Hello, Ebony! You have 7 unread messages.",
		"favorite_fruit": "strawberry"
		},
		{
		"id": "5cc59c2d958ec097d22b7f62",
		"index": 2,
		"guid": "a2fdf1f4-7f9c-427f-8c89-9aef139d50b3",
		"is_active": false,
		"balance": "$3,693.86",
		"picture": "http://placehold.it/32x32",
		"age": 25,
		"eye_color": "brown",
		"name": {
			"first": "Barton",
			"last": "Jensen"
		},
		"company": "SULTRAX",
		"email": "barton.jensen@sultrax.info",
		"phone": "+1 (807) 477-3015",
		"address": "408 Gerritsen Avenue, Watrous, Vermont, 8354",
		"about": "Adipisicing fugiat aute ut non. Veniam incididunt labore anim aliqua aliquip. Laborum culpa eu quis magna voluptate ea reprehenderit enim consequat ad. Reprehenderit dolor occaecat ad labore nisi tempor sint occaecat voluptate.",
		"registered": "Saturday, May 13, 2017 8:47 PM",
		"latitude": "35.768431",
		"longitude": "84.440164",
		"tags": [
			"nulla",
			"voluptate",
			"id",
			"veniam",
			"do"
		],
		"range": [
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		],
		"friends": [{
				"id": 0,
				"name": "Ayala Rowland"
			},
			{
				"id": 1,
				"name": "Stacie Emerson"
			},
			{
				"id": 2,
				"name": "Maude Rush"
			}
		],
		"greeting": "Hello, Barton! You have 6 unread messages.",
		"favorite_fruit": "apple"
		},
		{
		"id": "5cc59c2db23bbd9e09c0f3ef",
		"index": 3,
		"guid": "fc45b50b-ee98-4542-b107-42cabc677276",
		"is_active": true,
		"balance": "$3,332.07",
		"picture": "http://placehold.it/32x32",
		"age": 39,
		"eye_color": "brown",
		"name": {
			"first": "Bailey",
			"last": "Small"
		},
		"company": "BLUPLANET",
		"email": "bailey.small@bluplanet.name",
		"phone": "+1 (904) 585-3341",
		"address": "779 Matthews Court, Dexter, New Mexico, 2129",
		"about": "Elit mollit aliquip adipisicing ea sit. Adipisicing mollit non fugiat laborum sunt eiusmod reprehenderit et. Cupidatat amet cillum est excepteur laborum eiusmod eiusmod. Enim aute sunt occaecat nostrud anim. Irure cillum dolore dolore culpa sint eiusmod sit et duis deserunt tempor.",
		"registered": "Thursday, April 7, 2016 4:48 AM",
		"latitude": "1.042822",
		"longitude": "159.177781",
		"tags": [
			"ex",
			"laborum",
			"eiusmod",
			"do",
			"et"
		],
		"range": [
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		],
		"friends": [{
				"id": 0,
				"name": "Josie Petty"
			},
			{
				"id": 1,
				"name": "Clemons Weiss"
			},
			{
				"id": 2,
				"name": "Casandra Roberts"
			}
		],
		"greeting": "Hello, Bailey! You have 5 unread messages.",
		"favorite_fruit": "apple"
		},
		{
		"id": "5cc59c2dfe7aa6384869bc6c",
		"index": 4,
		"guid": "2ad3854d-d702-45dd-9eb6-e456b3d70511",
		"is_active": true,
		"balance": "$3,341.68",
		"picture": "http://placehold.it/32x32",
		"age": 26,
		"eye_color": "brown",
		"name": {
			"first": "Janette",
			"last": "Benjamin"
		},
		"company": "CUBICIDE",
		"email": "janette.benjamin@cubicide.biz",
		"phone": "+1 (838) 552-3517",
		"address": "556 Beverley Road, Orviston, California, 2278",
		"about": "Et aliquip adipisicing id sit cupidatat reprehenderit fugiat incididunt ad magna. Amet amet labore qui deserunt velit dolore dolore cupidatat ut laboris ullamco. Ad ex irure dolor consectetur adipisicing. Proident minim ipsum nostrud in do do nulla laboris proident. Velit cillum occaecat magna pariatur velit ipsum commodo occaecat ea nulla ut.",
		"registered": "Monday, March 27, 2017 10:40 AM",
		"latitude": "-20.860616",
		"longitude": "68.150601",
		"tags": [
			"culpa",
			"aute",
			"id",
			"irure",
			"non"
		],
		"range": [
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		],
		"friends": [{
				"id": 0,
				"name": "Hayes Bray"
			},
			{
				"id": 1,
				"name": "Cynthia Lamb"
			},
			{
				"id": 2,
				"name": "Jenifer Glover"
			}
		],
		"greeting": "Hello, Janette! You have 10 unread messages.",
		"favorite_fruit": "banana"
		},
		{
		"id": "5cc59c2dc959945e9782b14c",
		"index": 5,
		"guid": "d889b741-369a-497a-b375-153cab986911",
		"is_active": true,
		"balance": "$1,916.79",
		"picture": "http://placehold.it/32x32",
		"age": 35,
		"eye_color": "green",
		"name": {
			"first": "Olsen",
			"last": "Bush"
		},
		"company": "OPTICON",
		"email": "olsen.bush@opticon.com",
		"phone": "+1 (843) 545-3379",
		"address": "809 Garden Street, Harmon, Northern Mariana Islands, 104",
		"about": "Laboris Lorem culpa aliqua ullamco sint magna. Tempor dolore aute sit amet officia ex anim. Ullamco commodo consectetur aute exercitation consectetur aliquip est. Enim veniam aliquip adipisicing consectetur ut.",
		"registered": "Monday, January 26, 2015 5:32 PM",
		"latitude": "-17.289152",
		"longitude": "47.656989",
		"tags": [
			"incididunt",
			"officia",
			"mollit",
			"mollit",
			"proident"
		],
		"range": [
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		],
		"friends": [{
				"id": 0,
				"name": "Patterson Brennan"
			},
			{
				"id": 1,
				"name": "Murray Douglas"
			},
			{
				"id": 2,
				"name": "Mcintosh Logan"
			}
		],
		"greeting": "Hello, Olsen! You have 8 unread messages.",
		"favorite_fruit": "apple"
		},
		{
		"id": "5cc59c2daca89aae3b75ea04",
		"index": 6,
		"guid": "bb5eca0a-acf8-4ed3-a14f-656dd4e3bcb5",
		"is_active": true,
		"balance": "$3,558.68",
		"picture": "http://placehold.it/32x32",
		"age": 37,
		"eye_color": "brown",
		"name": {
			"first": "Gilliam",
			"last": "Sexton"
		},
		"company": "ORBAXTER",
		"email": "gilliam.sexton@orbaxter.ca",
		"phone": "+1 (941) 532-2700",
		"address": "710 Hawthorne Street, Westerville, Oklahoma, 5488",
		"about": "Proident proident sit do dolor mollit nostrud eu sunt minim do consequat esse occaecat anim. Voluptate in eu dolor elit Lorem. Dolor dolore quis cupidatat amet commodo pariatur qui. Enim cupidatat ex ipsum ad quis duis et aliqua sit dolore aliquip nulla minim laboris.",
		"registered": "Thursday, October 29, 2015 12:11 PM",
		"latitude": "-31.393875",
		"longitude": "-177.68314",
		"tags": [
			"officia",
			"eu",
			"esse",
			"proident",
			"consectetur"
		],
		"range": [
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		],
		"friends": [{
				"id": 0,
				"name": "Parks House"
			},
			{
				"id": 1,
				"name": "Pamela Roach"
			},
			{
				"id": 2,
				"name": "English Odonnell"
			}
		],
		"greeting": "Hello, Gilliam! You have 10 unread messages.",
		"favorite_fruit": "apple"
		}
		]
		""".data(using: .utf8)!
}
