package capture.calls;

import js.Browser;
import tstool.process.Action;
import xapi.Verb;

/**
 * ...
 * @author bb
 */
class _ReassueSpeech extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: AboutWhatZone, params: []}];
		
		super.onClick();
	}
	
}