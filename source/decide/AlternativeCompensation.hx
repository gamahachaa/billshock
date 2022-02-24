package decide;

import capture.TravelInfoRecieved;
import capture._HowMadeHugeAmount;
import decide._InformAboutNewLaw;
import firetongue.Replace;
import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOneRefuse;
//import ticket.TicketMobileFiveOneOne;
import tstool.layout.History.Interactions;
import tstool.layout.History.Snapshot;
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
	static inline var TOTAL_SCHOCK:String = "total shock";
	public static inline var COMPENSATE:String = "compensate 50% ";

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
		this._nexts = [{step: compensate > 40 ? TicketMobileFiveOneOneAccept: ApplyCompensationInMarilyn}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nextNoProcesses = [new TicketMobileFiveOneOne()];
		//var howMadeHugeAmount:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(capture._HowMadeHugeAmount);
		//if( howMadeHugeAmount.values.get(_HowMadeHugeAmount.HOW) == _HowMadeHugeAmount.AB)
			//this._nexts = [{step: TravelInfoRecieved}];
		//else
		this._nexts = [{step: TicketMobileFiveOneOneRefuse}];
		super.onNoClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [TOTAL_SCHOCK=>amount, COMPENSATE=> compensate]);
	}
}