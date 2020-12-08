package;

import decide.ActivateInternetEurope;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import tstool.layout.UI;
//import flixel.system.FlxAssets;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import tstool.MainApp;

import js.Browser;
import js.html.Location;
import lime.utils.Assets;
//import openfl.display.Sprite;
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


class Main extends MainApp
{
	public static var LIB_FOLDER:String;
	//public static var MAIL_WRAPPER_URL:String = LIB_FOLDER + "php/mail/index.php";
	
	public static var HISTORY:History;
	public static var adminFile:tstool.utils.Csv;
	public static var tongue:Translator;
	public static var user:Agent;
	public static var customer:Customer;
	public static var track:XapiTracker;
	public static var VERSION:String;
	public static var VERSION_TRACKER:VersionTracker;
	public static var LOCATION:Location;
	public static var DEBUG:Bool;
	public static var COOKIE: FlxSave;
	
	public static var LANGS:Array<String> = ["fr-FR", "de-DE", "en-GB"];
	//public static var LANGS = ["fr-FR", "de-DE"];
	public static inline var LAST_STEP:Class<FlxState> = End;
	/**
	 * FORMAT COLOR
	 * */
	
	public function new() 
	{
		super({
				cookie:"billshock_js.user",
				scriptName:"bill_shock_js"
				
		});
		LIB_FOLDER = "../trouble/";
		tongue = translator;
		COOKIE = save;
		HISTORY = stack;
		LOCATION = location;
		track =  xapiTracker;
		DEBUG = debug;
		VERSION_TRACKER = versionTracker;
		customer = cust;
		user = agent;
		
		#if debug
		//addChild(new FlxGame(1400, 880, IsCompTicketOpened, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, _SelectPP, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, ElligibleForRet, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, ActivateInternetEurope, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, Login, 1, 30, 30, true, true));
		addChild(new FlxGame(1400, 880, Intro, 1, 30, 30, true, true));
		#else			
		addChild(new FlxGame(1400, 880, Login, 1, 30, 30, true, true));
		#end

	}
	/*static public function TOGGLE_MAIN_STYLE()
	{
		THEME = THEME == WHITE_THEME ? DARK_THEME: WHITE_THEME;
	}*/
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
		#if !debug
		Main.track.setActor();
		#end
		tongue.initialize(Main.user.mainLanguage, ()->(FlxG.switchState( old ? new Intro(): new Intro() )) );
	}
}