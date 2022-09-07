package capture;

import decide.NewSimplComp;
import decide.ProposeSerenity;
import decide._InformAboutNewLaw;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsContractMoreThan12MonthLeft extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: ProposeSerenity, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: NewSimplComp, params: []}];
		super.onNoClick();
	}
	
}