package capture.calls;

import haxe.Json;
import tstool.process.Process;
import tstool.process.Triplet;
import xapi.Verb;

import tstool.process.ActionRadios;


/**
 * ...
 * @author bb
 */
/*class AboutWhatZone extends Descision 
{

	override public function onYesClick():Void
	{
		// not Europe
		this._nexts = [{step: IsLineCreditBlocked, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//Europe
		this._nexts = [{step: _ElligibleForRet, params: []}];
		super.onNoClick();
	}
	
}*/
class AboutWhatZone extends ActionRadios
{
	public static inline var HOW:String = _HowMadeHugeAmount.HOW;
	//public static inline var CH:String = "ch";
	public static inline var EUROPE:String = _HowMadeHugeAmount.EUROPE;
	public static inline var TRAVEL:String = _HowMadeHugeAmount.TRAVEL;
	public static inline var WORLD:String = _HowMadeHugeAmount.WORLD;
	
	public function new()
	{
		super([
		{
			title: HOW,
			values: [EUROPE, TRAVEL, WORLD],
			hasTranslation: true
		}
		]);
	}
	//public static inline var FAR:String = "far";
	//public static inline var SAT:String = "sat";
	//public static inline var SURF:String = "surfv2";

	/*public function new()
	{
		super([
		{
			title: HOW,
			values: Main.HISTORY.isClassInteractionInHistory(HighUsageData, Yes)?[EUROPE, TRAVEL, WORLD] : [EUROPE, TRAVEL, WORLD]
			,
			hasTranslation: true
		}
		]);
	}*/
	/*override public function create()
	{
		//var jsonDetails = Json.parse(_detailTxt);
		//_detailTxt = Main.HISTORY.isClassInteractionInHistory(HighUsageData, Yes)?jsonDetails.data: jsonDetails.call;
		super.create();
	}*/
	/*override public function onClick()
	{
		if (validate())
		{
			prepareTacking( how );
			this._nexts = [ {step: IsLineCreditBlocked}];
			super.onClick();
		}
	}*/
	/*override public function onYesClick():Void
	{
		prepareTacking( WORLD );
		this._nexts = [{step: IsLineCreditBlocked, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		prepareTacking( EUROPE );
		this._nexts = [{step: _ElligibleForRet, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		prepareTacking( TRAVEL );
		this._nexts = [{step: IsLineCreditBlocked, params: []}];
		super.onMidClick();
	}*/
	override public function onClick()
	{
		if (validate())
		{
			var how = status.get(HOW);
			var next:Class<Process> = switch (how)
				{
					case EUROPE: _ElligibleForRet;
					case TRAVEL: _ElligibleForRet;
					case _ : IsLineCreditBlocked;
				}
			
			
			prepareTacking( how );
			this._nexts = [ {step: next}];
			super.onClick();
		}
	}
	function prepareTacking(activity)
	{
		//Main.track.initKeepActor();

		//Main.trackH.setVerb(Verb.initialized);
		//Main.trackH.setStatementRefs(null);

		//Main.track.setVerb("initialized");
		//Main.track.setStatementRef(null);
		var extensions:Map<String,Dynamic> = [];
		extensions.set("https://customercare.salt.ch/admin/contracts/customer/", Main.customer.iri);
		//Main.track.setCustomer(true);
		Main.trackH.setActivityObject( "rezoning/"+activity,null,null,"http://activitystrea.ms/schema/1.0/process",extensions );
		Main.trackH.send();
		Main.trackH.setVerb(Verb.resolved);
	}
}
