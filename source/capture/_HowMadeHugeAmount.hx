package capture;

import decide.SimplComp;
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
class _HowMadeHugeAmount extends ActionRadios {
	public static inline var HOW:String = "How";
	public static inline var CH:String = "ch";
	public static inline var AB:String = "ab";
	public static inline var CDEF:String = "cdef";
	public static inline var SAT:String = "sat";
	public static inline var SURF:String = "surfv2";
	

	public function new() {
		super([
			{
				title: HOW,
				values: [CH, AB, CDEF, SAT, SURF],
				hasTranslation: true
			}
		]);
	}

	override public function onClick() {
		if (validate()) {
			var how = status.get(HOW);
			var next:Class<Process> = switch (how) {
				case CH: _ElligibleForRet;
				case AB: WasLimitsChanged; // _ElligibleForRet;// WasLimitsChanged
				case CDEF: WasLimitsChanged; //  SimplComp; // WasLimitsChanged
				case SAT: TicketMobileFiveOneOne; //NOT REFUSE TicketMobileFiveOneOneRefuse
				case SURF: SimplComp;
				default: SimplComp;
			}
			//Main.track.sendInitial(how);
            prepareTacking( how );
			this._nexts = [{step: next}];
			super.onClick();
		}
	}
	function prepareTacking(activity) 
	{
		//Main.track.initKeepActor();
		
		Main.trackH.setVerb(Verb.initialized);
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
