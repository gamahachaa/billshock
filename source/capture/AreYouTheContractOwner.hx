package capture;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class AreYouTheContractOwner extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: InputCustomersDetails, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onNoClick();
	}
	
}