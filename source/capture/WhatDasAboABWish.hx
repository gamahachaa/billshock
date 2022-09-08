package capture;

import firetongue.Replace;
import tstool.layout.History.Snapshot;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhatDasAboABWish extends Descision 
{

	
	/*override public function create()
	{
		var howMadeHugeAmount:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(capture._HowMadeHugeAmount);
		var where = howMadeHugeAmount.values.get(_HowMadeHugeAmount.HOW);
		this._titleTxt = Replace.flags(_titleTxt,  ["<WHERE>"], [where.toUpperCase()]);
		super.create();
	}*/
		/****************************
	* Needed for validation
	*****************************/
	
	override public function onYesClick():Void
	{
		//this._nextYesProcesses = [new AcceptRenewalPlan()];
		this._nexts = [{step: AcceptRenewalPlan}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nextNoProcesses = [new AcceptRenewalPlan()];
		this._nexts = [{step: AcceptRenewalPlan}];
		super.onNoClick();
	}
	
}