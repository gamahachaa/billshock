package decide;
import capture.HighUsageData;
import decide._InformAboutNewLaw;
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
class SimplComp extends Descision
{
	var compensate:Float;
	var amount:Float;
	static inline var TOTAL_SCHOCK:String = "total shock";
	//static inline var FRONT_COMP_LIMIT:Float = 40;
	public static inline var COMPENSATE:String = "compensate (max 150 to pay)";
	override public function create()
	{
		//var choice:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HowMadeHugeAmount", 1, true);
		//var amounts:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HighUsageData", 1, true);
		var amounts:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(HighUsageData);
		/**
		 * @todo splits amount
		 */
		
		amount = Std.parseFloat(Process.STORAGE.get(HighUsageData.STORAGE_TOTAL_AMOUNT));
		compensate = amount - Math.min(amount / 2, 150);
		var toPay = Math.min(amount / 2, 150);
		var formula = '\n$amount - ($amount / 2) = $amount - ${amount/2} = ${amount - (amount / 2)}\n= ${amount - Math.min(amount / 2, 150)}';
		compensate = Math.ffloor(compensate * 100) / 100;
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>","<AMOUNT>"], [Std.string(compensate), Std.string(amount)]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>","<PAY>"], [formula, Std.string(toPay)]);
		super.create();
	}

	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [TOTAL_SCHOCK => amount, COMPENSATE => compensate]);
	}
	
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
		//this._nextNoProcesses = [new TicketMobileFiveOneOne()];
		this._nexts = [{step: TicketMobileFiveOneOneRefuse}];
		super.onNoClick();
	}
	//function compute(s:String)
	//{
		//var r:EReg = new EReg("[+ ;\\/]{1,3}","g");
		////var test = "999 99.00 / 99.50 + 99,50 999.99 + 444,44 / 333;888 777";
		//var t = r.split(s);
		//trace(t);
		//var sum:Float = 0;
		//for (i in r.split(s))
		//{
			//sum += Std.parseFloat(i);
		//}
		//return sum;
	//}
}