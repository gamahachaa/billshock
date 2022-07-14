package capture.calls;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class AboutWhatZone extends Descision 
{

	override public function onYesClick():Void
	{
		// not Europe
		this._nexts = [{step: IsLineCreditBlocked, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//Europe
		this._nexts = [{step: _ElligibleForRet, params: []}];
		super.onNoClick();
	}
	
}