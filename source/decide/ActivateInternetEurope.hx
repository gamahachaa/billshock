package decide;

import decide._InformAboutNewLaw;
//import decide.AlternativeCompensation;
import firetongue.Replace;
import haxe.Exception;
import ticket.TicketMobileFiveOneOneAccept;
//import ticket.TicketMobileFiveOneOne;
import tstool.layout.History.Interactions;
//import tstool.layout.History.Snapshot;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class ActivateInternetEurope extends Descision 
{
	var compensate:Float;
	public static inline var COMPENSATE:String = "compensate";

	/**/
	override public function create()
	{
		//var amounts:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HighUsageData", 1, true);
		#if debug
		var amount:Float=0;
		try{
			amount = Main.customer.contract.balance.overdue == null ? 1000: Std.parseFloat(Main.customer.contract.balance.overdue);
		}
		catch (e:Exception)
		{
			amount = 1000;
		}
		#else
		var amount:Float = Std.parseFloat(Main.customer.contract.balance.overdue);
		#end
		var optionPrice = 9.95;
		compensate = Math.round((amount - optionPrice)*100)/100;
		var formula = '$amount - $optionPrice = $compensate';
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>", "<OPTION>"], [Std.string(compensate), Std.string(optionPrice)]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>","<PAY>","<OPTION>"], [formula, Std.string(optionPrice) , Std.string(optionPrice)]);
		super.create();
	}
	/**/
	/****************************
	* Needed for validation
	*****************************/
	
	override public function onYesClick():Void
	{
		//this._nextYesProcesses = [new TicketMobileFiveOneOne()];
		this._nexts = [{step: compensate > Intro.FRONT_COMP_LIMIT ? TicketMobileFiveOneOneAccept: ApplyCompensationInMarilyn}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nextNoProcesses = [new AlternativeCompensation()];
		this._nexts = [{step: NewSimplComp}];
		super.onNoClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [COMPENSATE=> compensate]);
	}
}