package capture;

/**
 * ...
 * @author bb
 */
class PPmap
{
	public static inline var START_PP:String = "Start";
	public static inline var START_MAX_PP:String = "Start Max";
	public static inline var BASIC_PP:String = "Basic";
	public static inline var DASABO_EASY_PP:String = "DasAbo easy";
	public static inline var DASABO_NO_EUROPE_PP:String = "DasAbo no EUROPE calls";
	public static inline var DAS_ABO_EUROPE_PP:String = "DasAbo with EUROPE calls";
	public static inline var SMART_PP:String = "SmartSwiss";
	public static inline var SWISS_PP:String = "Swiss";
	public static inline var NO_MORE_EUROPE:String = " no_more_EU_AB_calls";
	public static inline var JUST_CALLS:String = " just_EU_AB_calls";
	public static inline var UNLIMITED_CALLS:String = " unlimited_call_and_data_in_EU_AB";
	public static inline var NEW_PLAN:String = "newPlan";
	public static inline var SPECIAL_RC:String = "specialRc";
	public static inline var STANDARD_RC:String = "standardRc";
	//
	static inline var PRICE_FIVE:String = "5";
	static inline var PRICE_NINE:String = "9";
	static inline var PRICE_14:String = "14";
	static inline var PRICE_19:String = "19";
	static inline var PRICE_24:String = "24";
	static inline var PRICE_29:String = "29";
	static inline var PRICE_14_95:String = "14.95";
	static inline var PRICE_25:String = "25";
	static inline var PRICE_35:String = "35";
	static inline var PRICE_39:String = "39";
	static inline var PRICE_49:String = "49";
	static inline var PRICE_19_95:String = "19.95";
	static inline var PRICE_24_95:String = "24.95";
	static inline var PRICE_29_95:String = "29.95";
	static inline var PRICE_34_95:String = "34.95";
	static inline var PRICE_39_95:String = "39.95";
	static inline var PRICE_9_95:String = "9.95";
	static inline var PRICE_45:String = "45";
	static inline var PRICE_44_95:String = "44.95";
	static inline var PRICE_49_95:String = "49.95";
	static inline var PRICE_54_95:String = "54.95";
	static inline var PRICE_55_95:String = "55.95";
	static inline var PRICE_55:String = "55";
	static inline var PRICE_59:String = "59";
	static inline var PRICE_59_95:String = "59.95";
	static inline var PRICE_65:String = "65";
	static inline var PRICE_69:String = "69";
	static inline var PRICE_69_95:String = "69.95";
	static inline var PRICE_79_95:String = "79.95";
	static inline var PRICE_89_95:String = "89.95";
	static inline var SmartSwiss:String = 'Smart Swiss';
	static inline var SwissMax:String = 'Swiss Max';
	static inline var EuropeMax:String = 'Europe Max';
	static inline var SwissXxl:String = 'Swiss XXL';
	static inline var Europe1Go:String = 'Europe 1Go';
	static inline var EuropeUnlimited:String = 'Europe unlimited';
	static var START:Array<String> = [
										 PRICE_FIVE,
										 PRICE_NINE,
										 PRICE_14,
										 PRICE_19,
										 PRICE_24,
										 PRICE_29
									 ];
	static var START_MAX:Array<String> = [
										PRICE_14_95,
										 PRICE_19,
										 PRICE_25,
										 PRICE_29,
										 PRICE_35,
										 PRICE_39,
										 PRICE_49,
									 ];									 
	static var BASIC:Array<String> = [
										 PRICE_14_95,
										 PRICE_19,
										 PRICE_25,
										 PRICE_29,
										 PRICE_35,
										 PRICE_39,
										 PRICE_49
									 ];
	static var SMART_SWISS:Array<String> = [
			PRICE_19_95,
			PRICE_24_95,
			PRICE_29_95,
			PRICE_34_95,
			PRICE_39_95
										   ];
	static var SWISS:Array<String> = [
										 PRICE_29,
										 PRICE_35,
										 PRICE_39,
										 PRICE_45,
										 PRICE_49,
										 PRICE_55,
										 PRICE_59,
										 PRICE_65,
										 PRICE_69
									 ];
	static var DAS_ABO_NO_INTL:Array<String> = [
				PRICE_19_95,
				PRICE_24_95,
				PRICE_29,
				PRICE_34_95,
				PRICE_39
			];
	static var DAS_ABO_INTL:Array<String> = [
			PRICE_19_95,
			PRICE_24_95,
			PRICE_29_95,
			PRICE_34_95,
			PRICE_39_95
											];
	static var DAS_ABO_EASY:Array<String> = [
			PRICE_9_95,
			PRICE_14_95,
			PRICE_19_95,
			PRICE_24_95,
			PRICE_29_95,
			PRICE_34_95,
			PRICE_39_95

											];

	public static var ppMap:Map<String,Map<String,Array<String>>> =
		[
			_HowMadeHugeAmount.CH =>
			[
				START_PP => START,
	START_MAX_PP => START_MAX,
				BASIC_PP=> BASIC,
				DASABO_EASY_PP => DAS_ABO_EASY,
				DASABO_NO_EUROPE_PP => DAS_ABO_NO_INTL,
				DAS_ABO_EUROPE_PP=> DAS_ABO_INTL
			]
			,
			_HowMadeHugeAmount.EUROPE =>
			[
				START_PP => START,
				START_MAX_PP => START_MAX,
				BASIC_PP => BASIC,
				SMART_PP => SMART_SWISS,
				SWISS_PP => SWISS,
				DASABO_EASY_PP => DAS_ABO_EASY,
				DASABO_NO_EUROPE_PP => DAS_ABO_NO_INTL,
				DAS_ABO_EUROPE_PP => DAS_ABO_INTL
			]
		];

	public static var ppMapProposal =
		[
			_HowMadeHugeAmount.CH =>
			[
				START_PP => [
					PRICE_FIVE => [NEW_PLAN => SmartSwiss, SPECIAL_RC=> PRICE_29_95, STANDARD_RC=>PRICE_59_95],
					PRICE_NINE => [NEW_PLAN =>SmartSwiss, SPECIAL_RC=> PRICE_29_95, STANDARD_RC=>PRICE_59_95],
					PRICE_14 => [NEW_PLAN =>SmartSwiss, SPECIAL_RC=> PRICE_29_95, STANDARD_RC=>PRICE_59_95],
					PRICE_19 => [NEW_PLAN =>SmartSwiss, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_59_95],
					PRICE_24=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95]
				],
				BASIC_PP => [
					PRICE_14_95=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_24_95, STANDARD_RC=>PRICE_69_95],
					PRICE_19=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_25=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_35=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_49_95, STANDARD_RC=>PRICE_69_95],
					PRICE_49=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_69_95]
				],
				START_MAX_PP => [
					PRICE_19=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_25=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_35=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_49_95, STANDARD_RC=>PRICE_69_95],
					PRICE_49=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_69_95]
				],

				DASABO_EASY_PP => [
					PRICE_9_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_14_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_19_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_24_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_34_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=> PRICE_49_95, STANDARD_RC=>PRICE_69_95]
				],
				DASABO_NO_EUROPE_PP => [
					PRICE_19_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_24_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_34_95=>[NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_44_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=> PRICE_49_95, STANDARD_RC=>PRICE_69_95]
				],
				DAS_ABO_EUROPE_PP + NO_MORE_EUROPE => [
					PRICE_19_95=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_24_95=> [NEW_PLAN =>SwissMax, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29_95=> [NEW_PLAN =>SwissMax, SPECIAL_RC=> PRICE_39_95, STANDARD_RC => PRICE_69_95],
					PRICE_34_95=> [NEW_PLAN =>SwissMax, SPECIAL_RC=> PRICE_44_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39_95=> [NEW_PLAN =>SwissXxl, SPECIAL_RC=> PRICE_49_95, STANDARD_RC=>PRICE_69_95]
				],
				DAS_ABO_EUROPE_PP + JUST_CALLS => [
					PRICE_19_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_89_95],
					PRICE_24_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_89_95],
					PRICE_29_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_89_95],
					PRICE_34_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=> PRICE_44_95, STANDARD_RC=>PRICE_89_95],
					PRICE_39_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=> PRICE_49_95, STANDARD_RC=>PRICE_89_95]
				],
				DAS_ABO_EUROPE_PP + UNLIMITED_CALLS => [
					PRICE_19_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_49_95, STANDARD_RC=>PRICE_89_95],
					PRICE_24_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_54_95, STANDARD_RC=>PRICE_89_95],
					PRICE_29_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_89_95],
					PRICE_34_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_89_95],
					PRICE_39_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_89_95]
				]
			]
			,
			_HowMadeHugeAmount.EUROPE =>
			[
				START_PP => [
					PRICE_FIVE=> [NEW_PLAN =>SwissXxl, SPECIAL_RC=> PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_NINE=> [NEW_PLAN =>SwissXxl, SPECIAL_RC=> PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_14=> [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_19=> [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_24=> [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29=> [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95]
				],
				BASIC_PP => [
					PRICE_14_95 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_19 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_25 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_35 =>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_44_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39 =>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_49_95, STANDARD_RC=>PRICE_69_95],
					PRICE_49 =>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_69_95]
				],
				START_MAX_PP => [
					PRICE_14_95 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_19 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_25 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_35 =>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_44_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39 =>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_49_95, STANDARD_RC=>PRICE_69_95],
					PRICE_49 =>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_69_95]
				],

				SMART_PP => [
					PRICE_19_95=> [NEW_PLAN =>SwissXxl, SPECIAL_RC=> PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_24_95 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29_95 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_34_95 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_44_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39_95 => [NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_49_95, STANDARD_RC=>PRICE_69_95]
				],
				SWISS_PP => [
					PRICE_29 => [NEW_PLAN => EuropeMax, SPECIAL_RC => PRICE_39_95, STANDARD_RC => PRICE_79_95],
					PRICE_35 => [NEW_PLAN => EuropeMax, SPECIAL_RC => PRICE_44_95, STANDARD_RC => PRICE_79_95],
					PRICE_39 => [NEW_PLAN => EuropeMax, SPECIAL_RC => PRICE_49_95, STANDARD_RC => PRICE_79_95],
					PRICE_45 => [NEW_PLAN =>EuropeMax, SPECIAL_RC=> PRICE_54_95, STANDARD_RC=>PRICE_79_95],
					PRICE_49 => [NEW_PLAN =>EuropeMax, SPECIAL_RC=> PRICE_59_95, STANDARD_RC=>PRICE_79_95],
					PRICE_55 => [NEW_PLAN =>EuropeMax, SPECIAL_RC=> PRICE_55_95, STANDARD_RC=>PRICE_79_95],
					PRICE_59 => [NEW_PLAN =>EuropeMax, SPECIAL_RC=> PRICE_69_95, STANDARD_RC=>PRICE_79_95],
					PRICE_69=> [NEW_PLAN =>EuropeMax, SPECIAL_RC=> PRICE_79_95, STANDARD_RC=>PRICE_79_95]
				],
				DASABO_EASY_PP => [
					PRICE_9_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_14_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_19_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_24_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_34_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=> PRICE_49_95, STANDARD_RC=>PRICE_69_95]
				],
				DASABO_NO_EUROPE_PP => [
					PRICE_19_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_29_95, STANDARD_RC=>PRICE_69_95],
					PRICE_24_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_69_95],
					PRICE_29=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_69_95],
					PRICE_34_95=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=>PRICE_44_95, STANDARD_RC=>PRICE_69_95],
					PRICE_39=>[NEW_PLAN =>SwissXxl, SPECIAL_RC=> PRICE_49_95, STANDARD_RC=>PRICE_69_95]
				],
				DAS_ABO_EUROPE_PP + JUST_CALLS=> [
					PRICE_19_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_89_95],
					PRICE_24_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=>PRICE_34_95, STANDARD_RC=>PRICE_89_95],
					PRICE_29_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=>PRICE_39_95, STANDARD_RC=>PRICE_89_95],
					PRICE_34_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=> PRICE_44_95, STANDARD_RC=>PRICE_89_95],
					PRICE_39_95=> [NEW_PLAN =>Europe1Go, SPECIAL_RC=> PRICE_49_95, STANDARD_RC=>PRICE_89_95]
				],
				DAS_ABO_EUROPE_PP + UNLIMITED_CALLS => [
					PRICE_19_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_49_95, STANDARD_RC=>PRICE_89_95],
					PRICE_24_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_54_95, STANDARD_RC=>PRICE_89_95],
					PRICE_29_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_89_95],
					PRICE_34_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_89_95],
					PRICE_39_95=> [NEW_PLAN =>EuropeUnlimited, SPECIAL_RC=>PRICE_59_95, STANDARD_RC=>PRICE_89_95]
				]
			]
		];
}