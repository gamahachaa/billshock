package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxAssets;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import js.Browser;
import js.html.Location;
import lime.utils.Assets;
import openfl.display.Sprite;
import tstool.layout.History;
import tstool.layout.Login;
import tstool.layout.SaltColor;
import tstool.salt.Agent;
import tstool.salt.Customer;
import tstool.utils.Csv;
import tstool.utils.Translator;
import tstool.utils.VersionTracker;
import tstool.utils.XapiTracker;

/**
 * ...
 * @author bb
 */
typedef BasicFormat =
{
	var font:String;
	var size:Int;
}
typedef ThemeColor =
{
	var title:FlxColor;
	var basic:FlxColor;
	var basicStrong:FlxTextFormatMarkerPair;
	var basicEmphasis:FlxTextFormatMarkerPair;
	var meta:FlxColor;
	var interaction:FlxColor;
	var bg:FlxColor;
}
class Main extends Sprite
{
	public static inline var LIB_FOLDER = "../trouble/";
	public static inline var MAIL_WRAPPER_URL:String = LIB_FOLDER + "php/mail/index.php";
	
	public static var HISTORY:History = new History();
	public static var adminFile:tstool.utils.Csv;
	//public static var tongue:FireTongue = new FireTongue();
	public static var tongue:Translator = new Translator();
	public static var user:Agent;
	public static var customer:Customer;
	public static var track:XapiTracker;
	static inline var TITLE_FONT:String = "assets/fonts/Lato-Black.ttf";
	static inline var BASIC_FONT:String = "assets/fonts/Lato-Regular.ttf";
	
	public static var TITLE_FMT:BasicFormat = {font:TITLE_FONT, size:20};
	public static var BASIC_FMT:BasicFormat = {font:BASIC_FONT, size:14};
	public static var META_FMT:BasicFormat = {font:TITLE_FONT, size:16};
	public static var INTERACTION_FMT:BasicFormat = {font:TITLE_FONT, size:18};

	public static var VERSION:String;
	public static var VERSION_TRACKER:VersionTracker;
	public static var LOCATION:Location;
	public static var DEBUG:Bool;
	public static var COOKIE: FlxSave;
	public static var THEME:ThemeColor;
	public static var LANGS = ["fr-FR", "de-DE", "en-GB"];
	//public static var LANGS = ["fr-FR", "de-DE"];
	public static inline var LAST_STEP:Class<FlxState> = End;
	/**
	 * FORMAT COLOR
	 * */
	public static var DARK_THEME :ThemeColor =
	{
		bg: SaltColor.BLACK_PURE,
		title:SaltColor.WHITE,
		basic:SaltColor.WHITE,
	basicStrong:new FlxTextFormatMarkerPair(new FlxTextFormat(SaltColor.TUQUOISE,false),"<b>"),
		basicEmphasis:new FlxTextFormatMarkerPair(new FlxTextFormat(SaltColor.ORANGE,false),"<em>"),
		meta:SaltColor.MUSTARD,
		interaction: SaltColor.WHITE

	};
	public static var WHITE_THEME :ThemeColor =
	{
		bg: SaltColor.WHITE,
		title:SaltColor.BLACK_PURE,
		basic:SaltColor.BLACK,
		basicStrong:new FlxTextFormatMarkerPair(new FlxTextFormat(SaltColor.RED,true),"<b>"),
		basicEmphasis:new FlxTextFormatMarkerPair(new FlxTextFormat(SaltColor.RED,false,true),"<em>"),
		meta:SaltColor.TUQUOISE,
		interaction: SaltColor.DARK_GRAY

	};
	public function new() 
	{
		super();
		FlxAssets.FONT_DEFAULT =  "Consolas";
		adminFile = new Csv(Assets.getText("assets/data/admins.txt"),",",false);
		COOKIE = new FlxSave();
		COOKIE.bind("billshock_js.user");
		LOCATION = Browser.location;
		track =  new XapiTracker();
		DEBUG = LOCATION.origin.indexOf("qook.test.salt.ch") > -1;
		VERSION_TRACKER = new VersionTracker( LOCATION.origin + LOCATION.pathname +  "php/version/index.php", "bill_shock_js");
		THEME = DARK_THEME;
		Main.customer = new Customer();
		tongue.initialize("fr-FR",
					function(){
					#if debug
					//trace(tongue.get("$flow.nointernet.vti.CheckContractorVTI_UI1", "meta"));
					#end
				});
	
		//trace(FlxG.VERSION);
		Main.user = new Agent();
		//addChild(new FlxGame(1400, 880, Intro, 1, 30, 30, true, true));
		addChild(new FlxGame(1400, 880, Login, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, IsCompTicketOpened, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, _SelectPP, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, ElligibleForRet, 1, 30, 30, true, true));
	}
	static public function TOGGLE_MAIN_STYLE()
	{
		THEME = THEME == WHITE_THEME ? DARK_THEME: WHITE_THEME;
	}
	static public function setUpSystemDefault(?block:Bool = false )
	{
		FlxG.sound.soundTrayEnabled = false;
		FlxG.mouse.useSystemCursor = block;
		FlxG.keys.preventDefaultKeys = block ? [FlxKey.BACKSPACE, FlxKey.TAB] : [FlxKey.TAB];
		//FlxG.keys.preventDefaultKeys = [FlxKey.TAB];
	}
    static public function MOVE_ON(?old:Bool=false)
	{
		setUpSystemDefault(true);
		//trace("Main::MOVE_ON::MOVE_ON");
		tongue.initialize(Main.user.mainLanguage, ()->(FlxG.switchState( old ? new Intro(): new Intro() )) );
		//tongue.initialize(Main.user.mainLanguage, ()->(FlxG.switchState( old ? new _MajorUpdate():new flow.TutoTree() )) );
	}
}