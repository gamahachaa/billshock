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
		Main.customer.reset();
		Process.INIT();
		super.create();
		//#if !debug
		Main.VERSION_TRACKER.scriptChangedSignal.add(onNewVersion);
		Main.VERSION_TRACKER.request();
		#if debug
		trace("Showing the new version if any");
		//trace(Main.user.mainLanguage);
		if(Main.DEBUG)
			openSubState(new CheckUpdateSub(UI.THEME.bg));
		
		#else
		
		openSubState(new CheckUpdateSub(UI.THEME.bg));
		#end
	}
	function onNewVersion(needsUpdate:Bool):Void 
	{
		
		if (needsUpdate)
		{
			Browser.location.reload(true);
		}
		else{
			closeSubState();
		}
		closeSubState();
	}
	override public function onClick():Void
	{
		this._nexts = [{step: capture.AreYouTheContractOwner, params: []}];
		super.onClick();
	}
}