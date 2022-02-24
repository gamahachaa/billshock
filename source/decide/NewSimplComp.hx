package decide;

import capture.HighUsageData;
import firetongue.Replace;
import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOneRefuse;
import tstool.layout.History.Interactions;
import tstool.layout.History.Snapshot;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class NewSimplComp extends Descision
{
	static inline var TOTAL_SCHOCK:String = "total shock";
	var amount:Float;
	var compensate:Float;
	public static inline var COMPENSATE:String = "compensate (100 max to compensate)";
	override public function create()
	{
		//var choice:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HowMadeHugeAmount", 1, true);
		//var amounts:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HighUsageData", 1, true);
		amount;
		compensate;
		//var amounts:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(HighUsageData);
		/**
		 * @todo splits amount
		 */
		//var amount:Float = compute(amounts.values.get(HighUsageData.AMOUNTS));
		amount = Std.parseFloat(Process.STORAGE.get(HighUsageData.STORAGE_TOTAL_AMOUNT));
		//var amount:Float = Std.parseFloat(amounts.values.get(HighUsageData.AMOUNT));
		compensate = Math.min( amount / 2, 100);
		var toPay = amount - compensate;
		var formula = '\n( $amount / 2) = ${amount/2} > 100 ?\n= $compensate';
		compensate = Math.ffloor(compensate * 100) / 100;
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>","<AMOUNT>"], [Std.string(compensate), Std.string(amount)]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>","<PAY>"], [formula, Std.string(toPay)]);
		super.create();
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: compensate > 40 ? TicketMobileFiveOneOneAccept: ApplyCompensationInMarilyn}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: TicketMobileFiveOneOneRefuse}];
		super.onNoClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [TOTAL_SCHOCK => amount, COMPENSATE => compensate]);
	}
}