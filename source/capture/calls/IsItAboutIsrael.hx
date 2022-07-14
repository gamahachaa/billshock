package capture.calls;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsItAboutIsrael extends Descision 
{

	override public function onYesClick():Void
	{
		// palestine
		this._nexts = [{step: SpeechIsrael, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//other
		this._nexts = [{step: WhichAddonForWhichPP, params: []}];
		super.onNoClick();
	}
	
}