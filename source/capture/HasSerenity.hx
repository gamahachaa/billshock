package capture;

//import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOneSerenity;
import tstool.process.Descision;
import xapi.Verb;

/**
 * ...
 * @author bb
 */
class HasSerenity extends Descision 
{

	override public function onYesClick():Void
	{
		var extensions:Map<String,Dynamic> = [];
		extensions.set("https://customercare.salt.ch/admin/contracts/customer/", Main.customer.iri);
		Main.trackH.setActivityObject( "serenity",null,null,"http://activitystrea.ms/schema/1.0/process",extensions );
		Main.trackH.send();
		Main.trackH.setVerb(Verb.resolved);
		this._nexts = [{step: TicketMobileFiveOneOneSerenity, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _HowMadeHugeAmount, params: []}];
		super.onNoClick();
	}
	
}