package capture.calls;

import tstool.process.Action;

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