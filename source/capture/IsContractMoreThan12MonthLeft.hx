package capture;

import decide.NewSimplComp;
import decide.ProposeSerenity;
import decide._InformAboutNewLaw;
import firetongue.Replace;
import thx.DateTime;
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
	override public function create():Void 
	{
		var now:DateTime = DateTime.now();
		var contract_end:DateTime = now.nextYear();
		var max_date = '${contract_end.day}.${contract_end.month +1}.${contract_end.year}';
		//trace(now, contract_end);
		this._titleTxt = Replace.flags(this._titleTxt, ["<MAX_DATE>"], [max_date]);
		super.create();
	}
}