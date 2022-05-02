package capture;

/**
 * ...
 * @author bb
 */
class PPmap
{
	public static inline var START_PP:String = "Start";
	public static inline var BASIC_PP:String = "Basic";
	public static inline var DASABO_EASY_PP:String = "DasAbo easy";
	public static inline var DASABO_NO_AB_PP:String = "DasAbo no EU & USA calls";
	public static inline var DAS_ABO_AB_PP:String = "DasAbo with EU & USA calls";
	public static inline var SMART_PP:String = "SmartSwiss";
	public static inline var SWISS_PP:String = "Swiss";
	public static inline var NO_MORE_AB:String = " no_more_EU_AB_calls";
	public static inline var JUST_CALLS:String = " just_EU_AB_calls";
	public static inline var UNLIMITED_CALLS:String = " unlimited_call_and_data_in_EU_AB";
	public static inline var NEW_PLAN:String = "newPlan";
	public static inline var SPECIAL_RC:String = "specialRc";
	public static inline var STANDARD_RC:String = "standardRc";
	static var START:Array<String> = [
										 "5",
										 "9",
										 "14",
										 "19",
										 "24",
										 "29"
									 ];
	static var BASIC:Array<String> = [
										 "14.95",
										 "19",
										 "25",
										 "29",
										 "35",
										 "39",
										 "49"
									 ];
	static var SMART_SWISS:Array<String> = [
			"19.95",
			"24.95",
			"29.95",
			"34.95",
			"39.95"
										   ];
	static var SWISS:Array<String> = [
										 "29",
										 "35",
										 "39",
										 "45",
										 "49",
										 "55",
										 "59",
										 "65",
										 "69"
									 ];
	static var DAS_ABO_NO_INTL:Array<String> = [
				"19.95",
				"24.95",
				"29",
				"34.95",
				"39"
			];
	static var DAS_ABO_INTL:Array<String> = [
			"19.95",
			"24.95",
			"29.95",
			"34.95",
			"39.95"
											];
	static var DAS_ABO_EASY:Array<String> = [
			"9.95",
			"14.95",
			"19.95",
			"24.95",
			"29.95",
			"34.95",
			"39.95"

											];

	public static var ppMap:Map<String,Map<String,Array<String>>> =
		[
			"ch" =>
			[
				START_PP => START,
				BASIC_PP=> BASIC,
				DASABO_EASY_PP => DAS_ABO_EASY,
				DASABO_NO_AB_PP => DAS_ABO_NO_INTL,
				DAS_ABO_AB_PP=> DAS_ABO_INTL
			]
			,
			"ab" =>
			[
				START_PP => START,
				BASIC_PP => BASIC,
				SMART_PP => SMART_SWISS,
				SWISS_PP => SWISS,
				DASABO_EASY_PP => DAS_ABO_EASY,
				DASABO_NO_AB_PP => DAS_ABO_NO_INTL,
				DAS_ABO_AB_PP => DAS_ABO_INTL
			]
		];

	public static var ppMapProposal =
	[
		"ch" =>
		[
			START_PP => [
				"5" => [NEW_PLAN =>'Smart Swiss', SPECIAL_RC=> "29.95", STANDARD_RC=>"59.95"],
				"9" => [NEW_PLAN =>'Smart Swiss', SPECIAL_RC=> "29.95", STANDARD_RC=>"59.95"],
				"14" => [NEW_PLAN =>'Smart Swiss', SPECIAL_RC=> "29.95", STANDARD_RC=>"59.95"],
				"19" => [NEW_PLAN =>'Smart Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"24"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"29"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"]
			],
			BASIC_PP => [
				"14.95"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"24.95", STANDARD_RC=>"59.95"],
				"19"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"25"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"34.95", STANDARD_RC=>"59.95"],
				"29"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"35"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"39"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"49.95", STANDARD_RC=>"59.95"],
				"49"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"59.95", STANDARD_RC=>"59.95"]
			],
			DASABO_EASY_PP => [
				"9.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"14.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"19.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"24.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"34.95", STANDARD_RC=>"59.95"],
				"29.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"34.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"39.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=> "49.95", STANDARD_RC=>"59.95"]
			],
			DASABO_NO_AB_PP => [
				"19.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"24.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"34.95", STANDARD_RC=>"59.95"],
				"29"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"34.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"44.95", STANDARD_RC=>"59.95"],
				"39"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=> "49.95", STANDARD_RC=>"59.95"]
			],
			DAS_ABO_AB_PP + NO_MORE_AB => [
				"19.95"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"24.95"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"34.95", STANDARD_RC=>"59.95"],
				"29.95"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=> "39.95", STANDARD_RC => "59.95"],
				"34.95"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=> "44.95", STANDARD_RC=>"59.95"],
				"39.95"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=> "49.95", STANDARD_RC=>"59.95"]
			],
			DAS_ABO_AB_PP + JUST_CALLS => [
				"19.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=>"34.95", STANDARD_RC=>"89.95"],
				"24.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=>"34.95", STANDARD_RC=>"89.95"],
				"29.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=>"39.95", STANDARD_RC=>"89.95"],
				"34.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=> "44.95", STANDARD_RC=>"89.95"],
				"39.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=> "49.95", STANDARD_RC=>"89.95"]
			],
			DAS_ABO_AB_PP + UNLIMITED_CALLS => [
				"19.95"=> [NEW_PLAN =>'Europe_unlimited', SPECIAL_RC=>"49.95", STANDARD_RC=>"89.95"],
				"24.95"=> [NEW_PLAN =>'Europe unlimited', SPECIAL_RC=>"54.95", STANDARD_RC=>"89.95"],
				"29.95"=> [NEW_PLAN =>'Europe unlimited', SPECIAL_RC=>"59.95", STANDARD_RC=>"89.95"],
				"34.95"=> [NEW_PLAN =>'Europe unlimited', SPECIAL_RC=>"59.95", STANDARD_RC=>"89.95"],
				"39.95"=> [NEW_PLAN =>'Europe unlimited', SPECIAL_RC=>"59.95", STANDARD_RC=>"89.95"]
			]
		]
		,
		"ab" =>
		[
			START_PP => [
				"5"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=> "29.95", STANDARD_RC=>"59.95"],
				"9"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=> "29.95", STANDARD_RC=>"59.95"],
				"14"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"19"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"24"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"29"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"]
			],
			BASIC_PP => [
				"14.95" => [NEW_PLAN =>'Swiss', SPECIAL_RC=>"24.95", STANDARD_RC=>"59.95"],
				"19" => [NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"25" => [NEW_PLAN =>'Swiss', SPECIAL_RC=>"34.95", STANDARD_RC=>"59.95"],
				"29" => [NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"35" =>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"44.95", STANDARD_RC=>"59.95"],
				"39" =>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"49.95", STANDARD_RC=>"59.95"],
				"49" =>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"59.95", STANDARD_RC=>"59.95"]
			],
			SMART_PP => [
				"19.95"=> [NEW_PLAN =>'Swiss', SPECIAL_RC=> "29.95", STANDARD_RC=>"59.95"],
				"24.95" => [NEW_PLAN =>'Swiss', SPECIAL_RC=>"34.95", STANDARD_RC=>"59.95"],
				"29.95" => [NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"34.95" => [NEW_PLAN =>'Swiss', SPECIAL_RC=>"44.95", STANDARD_RC=>"59.95"],
				"39.95" => [NEW_PLAN =>'Swiss', SPECIAL_RC=>"49.95", STANDARD_RC=>"59.95"]
			],
			SWISS_PP => [
				"29" => [NEW_PLAN => 'Europe', SPECIAL_RC => "39.95", STANDARD_RC => "89.95"],
				"35" => [NEW_PLAN => 'Europe', SPECIAL_RC => "44.95", STANDARD_RC => "89.95"],
				"39" => [NEW_PLAN => 'Europe', SPECIAL_RC => "49.95", STANDARD_RC => "89.95"],
				"45" => [NEW_PLAN =>'Europe', SPECIAL_RC=> "54.95", STANDARD_RC=>"89.95"],
				"49" => [NEW_PLAN =>'Europe', SPECIAL_RC=> "59.95", STANDARD_RC=>"89.95"],
				"55" => [NEW_PLAN =>'Europe', SPECIAL_RC=> "55.95", STANDARD_RC=>"89.95"],
				"59" => [NEW_PLAN =>'Europe', SPECIAL_RC=> "69.95", STANDARD_RC=>"89.95"],
				"69"=> [NEW_PLAN =>'Europe', SPECIAL_RC=> "79.95", STANDARD_RC=>"89.95"]
			],
			DASABO_EASY_PP => [
				"9.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"14.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"19.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"24.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"34.95", STANDARD_RC=>"59.95"],
				"29.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"34.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"39.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=> "49.95", STANDARD_RC=>"59.95"]
			],
			DASABO_NO_AB_PP => [
				"19.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"29.95", STANDARD_RC=>"59.95"],
				"24.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"34.95", STANDARD_RC=>"59.95"],
				"29"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"39.95", STANDARD_RC=>"59.95"],
				"34.95"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=>"44.95", STANDARD_RC=>"59.95"],
				"39"=>[NEW_PLAN =>'Swiss', SPECIAL_RC=> "49.95", STANDARD_RC=>"59.95"]
			],
			DAS_ABO_AB_PP + JUST_CALLS=> [
				"19.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=>"34.95", STANDARD_RC=>"89.95"],
				"24.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=>"34.95", STANDARD_RC=>"89.95"],
				"29.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=>"39.95", STANDARD_RC=>"89.95"],
				"34.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=> "44.95", STANDARD_RC=>"89.95"],
				"39.95"=> [NEW_PLAN =>'Europe 1Go', SPECIAL_RC=> "49.95", STANDARD_RC=>"89.95"]
			],
			DAS_ABO_AB_PP + UNLIMITED_CALLS => [
				"19.95"=> [NEW_PLAN =>'Europe_unlimited', SPECIAL_RC=>"49.95", STANDARD_RC=>"89.95"],
				"24.95"=> [NEW_PLAN =>'Europe unlimited', SPECIAL_RC=>"54.95", STANDARD_RC=>"89.95"],
				"29.95"=> [NEW_PLAN =>'Europe unlimited', SPECIAL_RC=>"59.95", STANDARD_RC=>"89.95"],
				"34.95"=> [NEW_PLAN =>'Europe unlimited', SPECIAL_RC=>"59.95", STANDARD_RC=>"89.95"],
				"39.95"=> [NEW_PLAN =>'Europe unlimited', SPECIAL_RC=>"59.95", STANDARD_RC=>"89.95"]
			]
		]
	];
}