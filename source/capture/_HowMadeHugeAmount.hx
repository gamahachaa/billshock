package capture;

import capture.calls._ReassueSpeech;
import decide.SimplComp;
import haxe.Json;
import ticket.TicketMobileFiveOneOne;
import ticket.TicketMobileFiveOneOneRefuse;
import tstool.MainApp;
import tstool.process.ActionRadios;
import tstool.process.Process;
import xapi.Verb;

/**
	class _HowMadeHugeAmount extends ActionRadios
	* ...
	* @author bb
 */
class _HowMadeHugeAmount extends ActionRadios
{
	public static inline var HOW:String = "How";
	public static inline var CH:String = "ch";
	public static inline var EUROPE:String = "europe";
	public static inline var TRAVEL:String = "travel";
	public static inline var WORLD:String = "world";
	public static inline var FAR:String = "far";
	public static inline var SAT:String = "sat";
	public static inline var SURF:String = "surfv2";

	public function new()
	{
		super([
		{
			title: HOW,
			values: Main.HISTORY.isClassInteractionInHistory(HighUsageData, Yes)?[CH, EUROPE, TRAVEL, WORLD, FAR, SAT, SURF] : [CH, EUROPE, TRAVEL, WORLD, FAR, SAT]
			,
			hasTranslation: true
		}
		]);
	}
	override public function create()
	{
		var jsonDetails = Json.parse(_detailTxt);
		_detailTxt = Main.HISTORY.isClassInteractionInHistory(HighUsageData, Yes)?jsonDetails.data: jsonDetails.call;
		super.create();
	}
	override public function onClick()
	{
		if (validate())
		{
			var how = status.get(HOW);
			var next:Class<Process> = if (Main.HISTORY.isClassInteractionInHistory(HighUsageData, No))
			{
				_ReassueSpeech;
			}
			else
			{
				//data
				switch (how)
				{
					case CH: _ElligibleForRet;
					//case AB: WasLimitsChanged; // _ElligibleForRet;// WasLimitsChanged
					//case CDEF: WasLimitsChanged; //  SimplComp; // WasLimitsChanged
					case SAT: TicketMobileFiveOneOne; //NOT REFUSE TicketMobileFiveOneOneRefuse
					case SURF: SimplComp;
					case _ : WasLimitsChanged;
				}
			}
			//var next:Class<Process> =
				//Main.track.sendInitial(how);
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
		Main.trackH.setActivityObject( activity,null,null,"http://activitystrea.ms/schema/1.0/process",extensions );
		Main.trackH.send();
		Main.trackH.setVerb(Verb.resolved);
	}
	
}
