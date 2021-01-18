package decide;

import firetongue.Replace;
import ticket.TicketMobileFiveOneOne;
import tstool.layout.History.Interactions;
//import tstool.layout.History.Snapshot;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class AlternativeCompensation extends Descision 
{
	var compensate:Float;
	var amount:Float;
	var formula:String;

	/**/
	override public function create()
	{
		amount = Std.parseFloat(Main.customer.contract.balance.overdue);
		compensate = Math.round(10 * amount / 2)/10;
		formula = '$amount / 2 = <b>${amount/2}<b>';
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>","<AMOUNT>"], [Std.string(compensate), Std.string(amount) ]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>"], [formula]);
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
		//this._nextNoProcesses = [new TicketMobileFiveOneOne()];
		this._nexts = [{step: TicketMobileFiveOneOne}];
		super.onNoClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, ["total shock"=>amount, "compensate 50% "=> compensate]);
	}
}