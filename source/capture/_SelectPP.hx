package capture;

import tstool.MainApp;
import tstool.layout.History.Snapshot;
import tstool.process.ActionRadios;
using string.StringUtils;

/**
 * ...
 * @author bb
 */
class _SelectPP extends ActionRadios 
{
	public static inline var PRICE_PLAN:String = "Price Plan";
	public static inline var RC:String = "RC";
	public static inline var DAS_ABO_SPECIAL:String = "Wish";
	var where:String;
	var ppMap:Map<String,Map<String,Array<String>>>;
	public function new() 
	{
		
		var choices:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(capture._HowMadeHugeAmount);
		where = choices.values.get(_HowMadeHugeAmount.HOW);
		
		ppMap = PPmap.ppMap;
		super(
		[
			{
				title: PRICE_PLAN,
				values:  [for (k in ppMap.get(where).keys()) k],
				titleTranslation: MainApp.translator.translate("capture._SelectPP",PRICE_PLAN,"headers")// do not use hasTranslation because of dynamic values
			},
			{
				title: RC,
				values: [],
				titleTranslation: MainApp.translator.translate("capture._SelectPP",RC,"headers")
			}
		]
		);
		status.set(PRICE_PLAN, "") ;
		status.set(RC, "") ;
		
	}
	/**
	override public function create()
	{
		for (i in radiosMap)
		{
			i.rd.callback = this.callback;
		}
		super.create();
	}
	**/
	override public function onClick():Void
	{
		//
		if (validate())
		{
			if (status.get(PRICE_PLAN) == PPmap.DAS_ABO_AB_PP)
			{
				this._nexts = [{step: (where ==  _HowMadeHugeAmount.CH ? WhatDasAboCHWish : WhatDasAboABWish), params: []}];
				//this._nextProcesses = [where == _HowMadeHugeAmount.CH ? WhatDasAboCHWish : WhatDasAboABWish];
			}
			else this._nexts = [{step: AcceptRenewalPlan, params: []}];
			super.onClick();
		}
	}
	override function changeListener(radioID:String, value:String)
	{
		var valuesRC = [];
		status.set(radioID, value);
		if (radioID == PRICE_PLAN)
		{
			valuesRC = [for (i in ppMap.get(where).get(value)) i];
			this.radiosMap.get(RC).rd.updateRadios(valuesRC, valuesRC);
			this.radiosMap.get(RC).rd.selectedId = null;
			this.radiosMap.get(RC).updateRadioText();
			status.set(RC, "");
			position();
		}
		
	}
	
}