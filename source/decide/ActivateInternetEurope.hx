package decide;

import decide.AlternativeCompensation;
import firetongue.Replace;
import ticket.TicketMobileFiveOneOne;
import tstool.layout.History.Interactions;
import tstool.layout.History.Snapshot;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class ActivateInternetEurope extends Descision 
{
	var compensate:Float;

	/**/
	override public function create()
	{
		//var amounts:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HighUsageData", 1, true);
		var amount:Float = Std.parseFloat(Main.customer.contract.balance.overdue);
		var optionPrice = 9.95;
		compensate = amount - optionPrice;
		var formula = '$amount - $optionPrice (Internet Europpe price) = $compensate';
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>", "<OPTION>"], [Std.string(compensate), Std.string(optionPrice)]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>","<PAY>"], [formula, Std.string(optionPrice)]);
		this._titleTxt = this._titleTxt + "\nCHF " + compensate;
		this._detailTxt = this._detailTxt + formula;
		super.create();
	}
	/**/
	/****************************
	* Needed for validation
	*****************************/
	
	override public function onYesClick():Void
	{
		//this._nextYesProcesses = [new TicketMobileFiveOneOne()];
		this._nexts = [{step: TicketMobileFiveOneOne}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nextNoProcesses = [new AlternativeCompensation()];
		this._nexts = [{step: AlternativeCompensation}];
		super.onNoClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory("", interactionType, ["compensate"=> compensate]);
	}
}