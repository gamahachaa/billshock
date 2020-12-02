package capture;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhatDasAboABWish extends Descision 
{

	/*
	override public function create()
	{
		this._nextNoProcesses = [];
		this._nextYesProcesses = [];
		super.create();
	}
	*/
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