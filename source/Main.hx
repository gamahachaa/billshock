package;

//import decide.ActivateInternetEurope;
import capture.WasLimitsChanged;
import capture.calls.WhichAddonForWhichPP;
import flixel.FlxG;
import flixel.FlxGame;
import tstool.utils.XapiTracker;
//import flixel.FlxGame;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import tstool.layout.UI;
import tstool.process.Process;
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
	//public static var user:Agent;
	public static var customer:Customer;
	public static var trackH:XapiTracker;
	//public static var track:XapiTracker;
	public static var VERSION:String;
	public static var VERSION_TRACKER:VersionTracker;
	public static var LOCATION:Location;
	public static var DEBUG:Bool;
	public static var _mainDebug:Bool;
	public static inline var DEBUG_LEVEL = 0;
	
	public static var LANGS:Array<String> = ["fr-FR", "de-DE", "it-IT", "en-GB"];
	public static inline var LAST_STEP:Class<Process> = End;
	public static inline var START_STEP:Class<Process>  = Intro;
	public static inline var INTRO_PIC:String = "intro/favicon.png";
	public static var LIB_FOLDER_LOGIN:String;
	
	/**
	 * FORMAT COLOR
	 * */
	
	public function new() 
	{
		super({
				cookie:"billshock_20210216.user",
				scriptName:"billshock"
				
		});
		//trace("LOADED !");
		//LIB_FOLDER = "../trouble/";
		LIB_FOLDER = MainApp.LIB_FOLDER;
		//LIB_FOLDER_LOGIN = "commonlibs/";
		tongue = MainApp.translator;
		//COOKIE = MainApp.save;
		HISTORY = MainApp.stack;
		LOCATION = MainApp.location;
		trackH =  MainApp.xapiHelper;
		DEBUG = MainApp.debug;
		_mainDebug = MainApp.debug;
		VERSION_TRACKER = MainApp.versionTracker;
		customer = MainApp.cust;
		
		addChild(new FlxGame(1400, 880, Login, 1, 30, 30, true, true));

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
		var next:Process;
		var tuto:Process = new Tuto();
		setUpSystemDefault(true);
		//trace("Main::MOVE_ON::MOVE_ON");
		//#if !debug
		//Main.track.setActor();
		//#else
		//if(Main.DEBUG) Main.track.setActor();
		//#end
		//trackH.setActor(new xapi.Agent(MainApp.agent.iri, MainApp.agent.sAMAccountName));
		#if debug
			/**
			 * USe this  to debug a slide
			 */
			next = new Intro();
			//next = new WhichAddonForWhichPP();
			//tuto = new WasLimitsChanged();
		#else
			next = Type.createInstance(Main.START_STEP,[]);
		#end
		tongue.initialize(MainApp.agent.mainLanguage, ()->(FlxG.switchState( old ? next : tuto)) );
	}
	
}