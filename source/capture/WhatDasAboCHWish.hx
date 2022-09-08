package capture;

import tstool.process.Descision;
//import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
//class WhatDasAboCHWish extends Triplet
class WhatDasAboCHWish extends Descision
{
	/*
	override public function create()
	{
		super.create();
	}
	*/
	
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
	
	//override public function onMidClick():Void
	//{
		////this._nextMidProcesses = [new AcceptRenewalPlan()];
		//this._nexts = [{step: AcceptRenewalPlan}];
		//super.onMidClick();
	//}
	
}