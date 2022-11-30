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
	var amount:String;
	var simpleCompensate:Float;
	public static inline var COMPENSATE:String = "compensate (100 max to compensate)";
	override public function create()
	{
		var calc_comp:SimplCompData = CAL_COMP();
		amount = (calc_comp.amount);
		simpleCompensate = (calc_comp.comp);
		
		//amount = Std.parseFloat(Process.STORAGE.get(HighUsageData.STORAGE_TOTAL_AMOUNT));
		//simpleCompensate = Math.min( amount / 2, 100);
		//simpleCompensate = Math.ffloor(simpleCompensate * 100) / 100;
		//var toPay = amount - simpleCompensate;
		//var formula = '\n( $amount / 2) = ${amount/2} > 100 ?\n= $simpleCompensate';
		
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>", "<AMOUNT>"], [Std.string(simpleCompensate), Std.string(amount)]);
		//this._titleTxt = Replace.flags(_titleTxt, ["<COMP>","<AMOUNT>"], [Std.string(simpleCompensate), Std.string(amount)]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>","<PAY>"], [calc_comp.formula, Std.string(calc_comp.topay)]);
		//this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>","<PAY>"], [formula, Std.string(toPay)]);
		super.create();
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: simpleCompensate > Intro.FRONT_COMP_LIMIT ? TicketMobileFiveOneOneAccept: ApplyCompensationInMarilyn}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: TicketMobileFiveOneOneRefuse}];
		super.onNoClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [TOTAL_SCHOCK => amount, COMPENSATE => simpleCompensate]);
	}
	static public inline function CAL_COMP():SimplCompData
	{
		var amnt = Process.STORAGE.get(HighUsageData.STORAGE_TOTAL_AMOUNT);
		var comp = Math.ffloor(Math.min( Std.parseFloat(amnt) / 2, 100) * 100) / 100;
		var formula = '\n( $amnt / 2) = ${amnt/2} > 100 ?\n= $comp';
		return {
			topay : amnt - comp,
			comp: comp,
			formula: formula,
			amount : amnt
		};
	}
}
typedef SimplCompData = {
	var topay:Float;
	var comp:Float;
	var formula:String;
	var amount:String;
}