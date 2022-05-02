package;

import js.Browser;
import tstool.MainApp;
import tstool.layout.UI;
import tstool.process.Action;
import tstool.process.CheckUpdateSub;
import tstool.process.Process;
//import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class Intro extends Action 
{

	
	override public function create()
	{
		//Main.customer.reset();
		Process.INIT();
		super.create();
		//#if !debug
		Main.VERSION_TRACKER.scriptChangedSignal.addOnce(onNewVersion);
		Main.VERSION_TRACKER.request();
		#if debug
		if (Main.DEBUG){
			trace("Main.DEBUG OPEN ROBOT");
			//openSubState(new CheckUpdateSub(UI.THEME.bg));
		}
		else{
			trace("LOCAL.DEBUG does not OPEN ROBOT");
		}
		
		#else
		//trace("PROD does OPEN ROBOT");
		openSubState(new CheckUpdateSub(UI.THEME.bg));
		#end
	}
	function onNewVersion(needsUpdate:Bool):Void 
	{
		#if debug
		trace("Intro::onNewVersion::needsUpdate", needsUpdate );
		#end
		if (needsUpdate)
		{
			Browser.location.reload(true);
		}
		else{
			closeSubState();
			MainApp.VERSION_TIMER_value = MainApp.VERSION_TIMER_DURATION;
		}
		//closeSubState();
		#if debug
		trace("Intro::onNewVersion::SHOULD HAVE CLOSED");
		#end
	}
	override public function onClick():Void
	{
		this._nexts = [{step: capture.AreYouTheContractOwner, params: []}];
		super.onClick();
	}
}