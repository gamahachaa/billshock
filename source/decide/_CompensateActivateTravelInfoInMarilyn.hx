package decide;

import decide._InformAboutNewLaw;
import firetongue.Replace;
import tstool.layout.History.Interactions;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _CompensateActivateTravelInfoInMarilyn extends Action 
{
    var compensate:Float;
	override public function create()
	{
		 var optionPrice = 19.95;
		 var amount:Float = Std.parseFloat(Main.customer.contract.balance.overdue);
		 compensate = Math.round((amount - optionPrice)*100)/100;
		var formula = '$amount - $optionPrice = $compensate';
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>", "<OPTION>"], [Std.string(compensate), Std.string(optionPrice)]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>"], [formula, Std.string(optionPrice) , Std.string(optionPrice)]);
		super.create(); 
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _InformAboutNewLaw, params: []}];
		super.onClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, ["compensate"=> compensate]);
	}
}