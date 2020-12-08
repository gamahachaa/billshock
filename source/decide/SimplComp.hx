package decide;
import capture.HighUsageData;
import firetongue.Replace;
import ticket.TicketMobileFiveOneOne;
import tstool.layout.History.Interactions;
import tstool.layout.History.Snapshot;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class SimplComp extends Descision
{
	var compensate:Float;
	override public function create()
	{
		//var choice:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HowMadeHugeAmount", 1, true);
		//var amounts:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HighUsageData", 1, true);
		var amounts:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(HighUsageData);
		var amount:Float = Std.parseFloat(amounts.values.get(HighUsageData.AMOUNT));
		compensate = amount - Math.min(amount / 2, 150);
		var toPay = Math.min(amount / 2, 150);
		var formula = '\n$amount - ($amount / 2) = $amount - ${amount/2} = ${amount - (amount / 2)}\n= ${amount - Math.min(amount / 2, 150)}';
		compensate = Math.ffloor(compensate * 100) / 100;
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>","<AMOUNT>"], [Std.string(compensate), Std.string(amount)]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>","<PAY>"], [formula, Std.string(toPay)]);
		super.create();
	}
	/**/
	//override public function onClick():Void
	//{
		//this._nextProcesses = [new TicketMobileFiveOneOne()];
		//super.onClick();
	//}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, ["compensate"=> compensate]);
	}
	
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
}