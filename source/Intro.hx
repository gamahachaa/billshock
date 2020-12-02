package;

import js.Browser;
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
		openSubState(new CheckUpdateSub(Main.THEME.bg));
		#else
		openSubState(new CheckUpdateSub(Main.THEME.bg));
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
	}
	override public function onClick():Void
	{
		this._nexts = [{step: capture.IsCompTicketOpened, params: []}];
		super.onClick();
	}
}