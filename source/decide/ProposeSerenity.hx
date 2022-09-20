package decide;

import capture.WasLimitsChanged;
import decide.NewSimplComp;
import firetongue.Replace;
import haxe.Exception;
import ticket.TicketMobileFiveOneOneAccept;
import tstool.layout.History.Interactions;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class ProposeSerenity extends Descision 
{
	var compensate:Float;
	public static inline var COMPENSATE:String = "compensate";
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
		var optionPrice = 4.95;
		var serenityCover = 250;
		//compensate = Math.round((amount - optionPrice)*100)/100; //
		compensate = Math.round(Math.min( amount - optionPrice, serenityCover )*100)/100;
		var formula = '$amount - $optionPrice (max 250.-) = $compensate';
		var pay = Math.round((amount - compensate)*100)/100;
		this._titleTxt = Replace.flags(_titleTxt, ["<COMP>", "<OPTION>"], [Std.string(compensate), Std.string(optionPrice)]);
		this._detailTxt = Replace.flags(_detailTxt, ["<FORMULA>","<PAY>","<OPTION>"], [formula, Std.string(pay) , Std.string(optionPrice)]);
		super.create();
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: TicketMobileFiveOneOneAccept, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		var limitWereChanged = Main.HISTORY.isClassInteractionInHistory(WasLimitsChanged, Yes);
		this._nexts = [{step: limitWereChanged ?_InformAboutNewLaw:  NewSimplComp, params: []}];
		//this._nexts = [{step: NewSimplComp, params: []}];
		super.onNoClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [COMPENSATE=> compensate]);
	}
}