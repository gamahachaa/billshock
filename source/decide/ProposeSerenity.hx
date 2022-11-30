package decide;

import capture.WasLimitsChanged;
import capture._HowMadeHugeAmount;
import decide.NewSimplComp;
import firetongue.Replace;
import haxe.Exception;
import string.StringUtils;
import ticket.TicketMobileFiveOneOne;
import ticket.TicketMobileFiveOneOneAccept;
import tstool.layout.History.Interactions;
import tstool.layout.History.Snapshot;
import tstool.layout.History.ValueReturn;
import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class ProposeSerenity extends Triplet 
{
	var serenityCompensate:Float;
	var limitWereChanged:Bool;
	var howMade:ValueReturn;
	public static inline var COMPENSATE:String = "compensate";
    override public function create()
	{
		//var amounts:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HighUsageData", 1, true);
		limitWereChanged = Main.HISTORY.isClassInteractionInHistory(WasLimitsChanged, Yes);
		howMade = Main.HISTORY.findValueOfFirstClassInHistory(_HowMadeHugeAmount,_HowMadeHugeAmount.HOW);
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
		serenityCompensate = Math.round(Math.min( amount - optionPrice, serenityCover )*100)/100;
		var formula = '$amount - $optionPrice (max 250.-) = $serenityCompensate';
		var pay = Math.round((amount - serenityCompensate) * 100) / 100;
		
		if (limitWereChanged || howMade.exists && howMade.value == _HowMadeHugeAmount.SAT)
		{
			this._titleTxt = StringUtils.removeTagsAndContent(this._titleTxt, "span");
		}
		else{
			var simpleComp = NewSimplComp.CAL_COMP();
			this._titleTxt = Replace.flags(
				_titleTxt,
				["<SIMPLECOMP>"],
				[Std.string(simpleComp.comp)]
			);
			this._titleTxt = StringTools.replace(StringTools.replace(this._titleTxt, "<span>", ""), "</span>", "");
		}
		this._titleTxt = Replace.flags(
			_titleTxt, 
			["<COMP>", "<OPTION>"], 
			[Std.string(serenityCompensate), Std.string(optionPrice)]
		);
		this._detailTxt = Replace.flags(
			_detailTxt, 
			["<FORMULA>", "<PAY>", "<OPTION>"], 
			[formula, Std.string(pay) , Std.string(optionPrice)]
		);
		super.create();
	}
	inline function getNext():Class<Process>
	{
		
		 return if (howMade.exists && howMade.value == _HowMadeHugeAmount.SAT)
		 {
			  TicketMobileFiveOneOne;
		 }
		 else if (limitWereChanged) _InformAboutNewLaw
		 else NewSimplComp;
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: TicketMobileFiveOneOneAccept, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		
		this._nexts = [{step: limitWereChanged ?_InformAboutNewLaw:  NewSimplComp, params: []}];
		//this._nexts = [{step: NewSimplComp, params: []}];
		super.onNoClick();
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: limitWereChanged ?_InformAboutNewLaw:  NewSimplComp, params: []}];
		//this._nexts = [{step: NewSimplComp, params: []}];
		super.onMidClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [COMPENSATE=> serenityCompensate]);
	}
}