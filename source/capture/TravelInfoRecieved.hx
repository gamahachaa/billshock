package capture;

//import decide.AlternativeCompensation;
import decide._CompensateActivateTravelInfoInMarilyn;
import decide._InformAboutNewLaw;
//import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class TravelInfoRecieved extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _InformAboutNewLaw, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformAboutNewLaw, params: []}];
		super.onNoClick();
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: _InformAboutNewLaw, params: []}];
		super.onNoClick();
	}
	
}