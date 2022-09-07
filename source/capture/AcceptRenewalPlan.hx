package capture;

//import decide.AlternativeCompensation;
import capture.calls.AboutWhatZone;
import decide.NewSimplComp;
import decide._InformAboutNewLaw;
import decide.calls.CompensateFullAmount;
import firetongue.Replace;
import ticket.TicketFourFourOne;
import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOnePPRenewalAccept;
//import ticket.TicketMobileFiveOneOne;
import tstool.layout.History.Interactions;
import tstool.layout.History.Snapshot;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class AcceptRenewalPlan extends Descision 
{
	var proposal:Map < String,String>;
	var where:String;
	var calls:Bool;
	/*public function new ()
	{
		var howMadeHugeAmount:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HowMadeHugeAmount");
		var selectPP:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture._SelectPP");
		var where = howMadeHugeAmount[0].values.get("choice");
		var pp = selectPP[0].values.get(_SelectPP.PRICE_PLAN) + specialCases();
		var rc = selectPP[0].values.get(_SelectPP.RC);
		trace(where, pp, rc);
		var proposal = PPmap.ppMapProposal.get(where).get(pp).get(rc);
		
		super();
		this._titleTxt = proposal.toString();
	}*/
	function specialCases():String
	{
		var dasAboCH: Snapshot = Main.HISTORY.findFirstStepsClassInHistory(capture.WhatDasAboCHWish);
		var dasAboAB: Snapshot = Main.HISTORY.findFirstStepsClassInHistory(capture.WhatDasAboABWish);
		var history:Snapshot = null;
		if (dasAboAB != null)
		{
			history = dasAboAB;
		}
		else if (dasAboCH != null)
		{
			history = dasAboCH;
		}
		else{
			#if debug
			//trace("no history");
			#end
		}
		
		if (history != null)
		{
			return switch(history.interaction)
			{
				case Yes: PPmap.UNLIMITED_CALLS;
				case Mid: PPmap.NO_MORE_EUROPE;
				case No: PPmap.JUST_CALLS;
				default: "";
			}
		}
		return "";
	}
	
	override public function create()
	{
		calls = Main.HISTORY.isClassInteractionInHistory(HighUsageData, No);
		var howMadeHugeAmount:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(calls ? AboutWhatZone: capture._HowMadeHugeAmount);
		var selectPP: Snapshot = Main.HISTORY.findFirstStepsClassInHistory(capture._SelectPP);
		where = howMadeHugeAmount.values.get(_HowMadeHugeAmount.HOW);
		var pp = selectPP.values.get(_SelectPP.PRICE_PLAN) + specialCases();
		
		//trace("capture.AcceptRenewalPlan::create::pp", pp );
		var rc = selectPP.values.get(_SelectPP.RC);
		//trace(where, pp, rc);
		proposal = PPmap.ppMapProposal.get(where).get(pp).get(rc);
		this._titleTxt = Replace.flags(_titleTxt,  ["<PP>","<RC>","<STANDARD>","<OLD_PP>", "<OLD_RC>","<WHERE>"], [proposal.get(PPmap.NEW_PLAN), proposal.get(PPmap.SPECIAL_RC), proposal.get(PPmap.STANDARD_RC), pp, rc, where.toUpperCase()]);
		super.create();
		
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, ["Proposed PP"=> proposal.get(PPmap.NEW_PLAN), "Proposed RC"=> proposal.get(PPmap.SPECIAL_RC)]);
	}
	
	/****************************
	* Needed for validation
	*****************************/
	
	override public function onYesClick():Void
	{
		//this._nextYesProcesses = [new TicketMobileFiveOneOne()];
		this._nexts = calls ?  [{step: CompensateFullAmount}]: [{step: TicketMobileFiveOneOnePPRenewalAccept}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nextNoProcesses = [new AlternativeCompensation()];
		var proposeSerenity = where == _HowMadeHugeAmount.TRAVEL ||  where ==_HowMadeHugeAmount.EUROPE;
		this._nexts = calls ?  [{step: TicketFourFourOne}] :  [{step: proposeSerenity ? IsContractMoreThan12MonthLeft : NewSimplComp}];
		//this._nexts = calls ?  [{step: TicketFourFourOne}] :  [{step: NewSimplComp}];
		super.onNoClick();
	}
	
}