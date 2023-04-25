package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.input.keyboard.FlxKey;
import tstool.process.Process;
import tstool.MainApp;
import tstool.layout.History;
import tstool.layout.Login;
import tstool.salt.Customer;
import tstool.utils.Csv;
import tstool.utils.VersionTracker;
import tstool.utils.XapiTracker;

/**
 * ...
 * @author bb
 */


class Main extends MainApp
{
	
	public static var HISTORY:History;
	public static var adminFile:tstool.utils.Csv;
	public static var customer:Customer;
	public static var trackH:XapiTracker;
	public static var VERSION:String;
	public static var VERSION_TRACKER:VersionTracker;
	public static var DEBUG:Bool;
	/***************************************
	/***************************************
	/********** CONSTANTS ******************
	/***************************************/
	public static inline var DEBUG_LEVEL = 0;
	public static inline var LAST_STEP:Class<Process> = End;
	public static inline var START_STEP:Class<Process>  = Intro;
	static public inline var TMP_FILTER_ASSET_PATH:String = "assets/data/tmp/";
	static public var STORAGE_DISPLAY:Array<String> = [];
	
	public function new() 
	{
		super();
		
		HISTORY = MainApp.stack;
		
		trackH =  MainApp.xapiHelper;
		DEBUG = MainApp.debug;
		
		VERSION_TRACKER = MainApp.versionTracker;
		customer = MainApp.cust;
		
		addChild(new FlxGame(1400, 880, Login, 1, 30, 30, true, true));

	}
	static public function setUpSystemDefault(?block:Bool = false )
	{
		FlxG.sound.soundTrayEnabled = false;
		FlxG.mouse.useSystemCursor = block;
		FlxG.keys.preventDefaultKeys = block ? [FlxKey.BACKSPACE, FlxKey.TAB] : [FlxKey.TAB];
	}
    static public function MOVE_ON(?old:Bool=false)
	{
		var next:Process;
		var tuto:Process = new Tuto();
		setUpSystemDefault(true);

		#if debug
			/**
			 * USe this  to debug a slide
			 */
			next = new Intro();
			//tuto = new WasLimitsChanged();
		#else
			next = Type.createInstance(Main.START_STEP,[]);
		#end
		MainApp.translator.initialize(MainApp.agent.mainLanguage, ()->(FlxG.switchState( old ? next : tuto)) );
	}
	
}