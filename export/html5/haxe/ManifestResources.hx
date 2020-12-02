package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_jetbrainsmono_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_jetbrainsmono_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_lato_black_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_lato_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy57:assets%2Fdata%2F20200402_CycleTimeExpectedNextWeek_BB.csvy4:sizei1178y4:typey4:TEXTy2:idR1y7:preloadtgoR0y26:assets%2Fdata%2Fadmins.txtR2i68R3R4R5R7R6tgoR0y36:assets%2Fdata%2FcustomerProfile.jsonR2i9974R3R4R5R8R6tgoR0y35:assets%2Fdata%2FdashboardSante.jsonR2i3461R3R4R5R9R6tgoR0y34:assets%2Fdata%2Fdata-goes-here.txtR2zR3R4R5R10R6tgoR0y24:assets%2Fdata%2Ftest.txtR2i9R3R4R5R11R6tgoR0y46:assets%2Ffonts%2FJetBrainsMono-Bold-Italic.eotR2i145232R3y6:BINARYR5R12R6tgoR2i145004R3y4:FONTy9:classNamey51:__ASSET__assets_fonts_jetbrainsmono_bold_italic_ttfR5y46:assets%2Ffonts%2FJetBrainsMono-Bold-Italic.ttfR6tgoR0y47:assets%2Ffonts%2FJetBrainsMono-Bold-Italic.woffR2i67044R3R13R5R18R6tgoR0y39:assets%2Ffonts%2FJetBrainsMono-Bold.eotR2i138892R3R13R5R19R6tgoR2i138692R3R14R15y44:__ASSET__assets_fonts_jetbrainsmono_bold_ttfR5y39:assets%2Ffonts%2FJetBrainsMono-Bold.ttfR6tgoR0y40:assets%2Ffonts%2FJetBrainsMono-Bold.woffR2i62276R3R13R5R22R6tgoR0y51:assets%2Ffonts%2FJetBrainsMono-ExtraBold-Italic.eotR2i145920R3R13R5R23R6tgoR2i145672R3R14R15y56:__ASSET__assets_fonts_jetbrainsmono_extrabold_italic_ttfR5y51:assets%2Ffonts%2FJetBrainsMono-ExtraBold-Italic.ttfR6tgoR0y52:assets%2Ffonts%2FJetBrainsMono-ExtraBold-Italic.woffR2i65812R3R13R5R26R6tgoR0y44:assets%2Ffonts%2FJetBrainsMono-ExtraBold.eotR2i139388R3R13R5R27R6tgoR2i139168R3R14R15y49:__ASSET__assets_fonts_jetbrainsmono_extrabold_ttfR5y44:assets%2Ffonts%2FJetBrainsMono-ExtraBold.ttfR6tgoR0y45:assets%2Ffonts%2FJetBrainsMono-ExtraBold.woffR2i61016R3R13R5R30R6tgoR0y41:assets%2Ffonts%2FJetBrainsMono-Italic.eotR2i141780R3R13R5R31R6tgoR2i141572R3R14R15y46:__ASSET__assets_fonts_jetbrainsmono_italic_ttfR5y41:assets%2Ffonts%2FJetBrainsMono-Italic.ttfR6tgoR0y42:assets%2Ffonts%2FJetBrainsMono-Italic.woffR2i64504R3R13R5R34R6tgoR0y48:assets%2Ffonts%2FJetBrainsMono-Medium-Italic.eotR2i144764R3R13R5R35R6tgoR2i144528R3R14R15y53:__ASSET__assets_fonts_jetbrainsmono_medium_italic_ttfR5y48:assets%2Ffonts%2FJetBrainsMono-Medium-Italic.ttfR6tgoR0y49:assets%2Ffonts%2FJetBrainsMono-Medium-Italic.woffR2i66768R3R13R5R38R6tgoR0y41:assets%2Ffonts%2FJetBrainsMono-Medium.eotR2i138484R3R13R5R39R6tgoR2i138276R3R14R15y46:__ASSET__assets_fonts_jetbrainsmono_medium_ttfR5y41:assets%2Ffonts%2FJetBrainsMono-Medium.ttfR6tgoR0y42:assets%2Ffonts%2FJetBrainsMono-Medium.woffR2i62064R3R13R5R42R6tgoR0y42:assets%2Ffonts%2FJetBrainsMono-Regular.eotR2i136920R3R13R5R43R6tgoR2i136708R3R14R15y47:__ASSET__assets_fonts_jetbrainsmono_regular_ttfR5y42:assets%2Ffonts%2FJetBrainsMono-Regular.ttfR6tgoR0y43:assets%2Ffonts%2FJetBrainsMono-Regular.woffR2i60220R3R13R5R46R6tgoR0y31:assets%2Ffonts%2FLato-Black.eotR2i114806R3R13R5R47R6tgoR2i114588R3R14R15y36:__ASSET__assets_fonts_lato_black_ttfR5y31:assets%2Ffonts%2FLato-Black.ttfR6tgoR0y32:assets%2Ffonts%2FLato-Black.woffR2i48592R3R13R5R50R6tgoR0y33:assets%2Ffonts%2FLato-Regular.eotR2i120422R3R13R5R51R6tgoR2i120196R3R14R15y38:__ASSET__assets_fonts_lato_regular_ttfR5y33:assets%2Ffonts%2FLato-Regular.ttfR6tgoR0y34:assets%2Ffonts%2FLato-Regular.woffR2i50140R3R13R5R54R6tgoR0y50:assets%2Fimages%2Factivation%2FSST-door-online.pngR2i623931R3y5:IMAGER5R55R6tgoR0y53:assets%2Fimages%2Factivation%2Fverrif_eligibility.pngR2i84443R3R56R5R57R6tgoR0y29:assets%2Fimages%2Fdefault.pngR2i210155R3R56R5R58R6tgoR0y34:assets%2Fimages%2FILLUSTRATION.pngR2i210155R3R56R5R59R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R60R6tgoR0y42:assets%2Fimages%2Fintro%2Fbaby_shocked.pngR2i135091R3R56R5R61R6tgoR0y29:assets%2Fimages%2Fsync.ffs_dbR2i1200R3R13R5R62R6tgoR0y35:assets%2Fimages%2Fui%2Fall-good.pngR2i4661R3R56R5R63R6tgoR0y31:assets%2Fimages%2Fui%2Fback.pngR2i7760R3R56R5R64R6tgoR0y36:assets%2Fimages%2Fui%2FclipBoard.pngR2i2456R3R56R5R65R6tgoR0y32:assets%2Fimages%2Fui%2Fclose.pngR2i4989R3R56R5R66R6tgoR0y34:assets%2Fimages%2Fui%2Fcomment.pngR2i6291R3R56R5R67R6tgoR0y29:assets%2Fimages%2Fui%2Fde.pngR2i3550R3R56R5R68R6tgoR0y31:assets%2Fimages%2Fui%2Fdown.pngR2i6660R3R56R5R69R6tgoR0y29:assets%2Fimages%2Fui%2Fen.pngR2i3502R3R56R5R70R6tgoR0y31:assets%2Fimages%2Fui%2Fexit.pngR2i4953R3R56R5R71R6tgoR0y29:assets%2Fimages%2Fui%2Ffr.pngR2i3603R3R56R5R72R6tgoR0y31:assets%2Fimages%2Fui%2Fhelp.pngR2i7180R3R56R5R73R6tgoR0y32:assets%2Fimages%2Fui%2Fhowto.pngR2i3824R3R56R5R74R6tgoR0y29:assets%2Fimages%2Fui%2Fit.pngR2i1994R3R56R5R75R6tgoR0y31:assets%2Fimages%2Fui%2Fleft.pngR2i5261R3R56R5R76R6tgoR0y32:assets%2Fimages%2Fui%2Flight.pngR2i7477R3R56R5R77R6tgoR0y31:assets%2Fimages%2Fui%2Fmail.pngR2i21955R3R56R5R78R6tgoR0y32:assets%2Fimages%2Fui%2Fright.pngR2i5276R3R56R5R79R6tgoR0y34:assets%2Fimages%2Fui%2FshowPwd.pngR2i8423R3R56R5R80R6tgoR0y39:assets%2Fimages%2Fui%2FtrainingMode.pngR2i6934R3R56R5R81R6tgoR0y41:assets%2Fimages%2Fui%2FtutoKeyboardDE.pngR2i197972R3R56R5R82R6tgoR0y41:assets%2Fimages%2Fui%2FtutoKeyboardEN.pngR2i194114R3R56R5R83R6tgoR0y41:assets%2Fimages%2Fui%2FtutoKeyboardFR.pngR2i197400R3R56R5R84R6tgoR0y41:assets%2Fimages%2Fui%2FtutoKeyboardIT.pngR2i196927R3R56R5R85R6tgoR0y34:assets%2Fimages%2Fui%2Fversion.pngR2i33131R3R56R5R86R6tgoR0y32:assets%2Flocales%2Fcan_index.xmlR2i2788R3R4R5R87R6tgoR0y37:assets%2Flocales%2Fde-DE%2Fall_de.txtR2i4872R3R4R5R88R6tgoR0y43:assets%2Flocales%2Fde-DE%2FbillShock_de.txtR2i3857R3R4R5R89R6tgoR0y40:assets%2Flocales%2Fde-DE%2Fcables_de.txtR2i2804R3R4R5R90R6tgoR0y41:assets%2Flocales%2Fde-DE%2Fcan_all_de.txtR2i289R3R4R5R91R6tgoR0y40:assets%2Flocales%2Fde-DE%2Fcan_bo_de.txtR2i1605R3R4R5R92R6tgoR0y43:assets%2Flocales%2Fde-DE%2Fcan_front_de.txtR2i1174R3R4R5R93R6tgoR0y44:assets%2Flocales%2Fde-DE%2Fcollection_de.txtR2i4834R3R4R5R94R6tgoR0y43:assets%2Flocales%2Fde-DE%2Fequipment_de.txtR2i7242R3R4R5R95R6tgoR0y44:assets%2Flocales%2Fde-DE%2Fescalation_de.txtR2i5245R3R4R5R96R6tgoR0y57:assets%2Flocales%2Fde-DE%2Finstallation-activation_de.txtR2i3754R3R4R5R97R6tgoR0y38:assets%2Flocales%2Fde-DE%2Fmeta_de.txtR2i648R3R4R5R98R6tgoR0y44:assets%2Flocales%2Fde-DE%2Fnointernet_de.txtR2i14614R3R4R5R99R6tgoR0y40:assets%2Flocales%2Fde-DE%2Fsalttv_de.txtR2i17209R3R4R5R100R6tgoR0y43:assets%2Flocales%2Fde-DE%2Fstability_de.txtR2i6519R3R4R5R101R6tgoR0y43:assets%2Flocales%2Fde-DE%2Fvalidator_de.txtR2i242R3R4R5R102R6tgoR0y42:assets%2Flocales%2Fde-DE%2Fwifi-lan_de.txtR2i8353R3R4R5R103R6tgoR0y37:assets%2Flocales%2Fen-GB%2Fall_en.txtR2i4212R3R4R5R104R6tgoR0y43:assets%2Flocales%2Fen-GB%2FbillShock_en.txtR2i3391R3R4R5R105R6tgoR0y40:assets%2Flocales%2Fen-GB%2Fcables_en.txtR2i2460R3R4R5R106R6tgoR0y41:assets%2Flocales%2Fen-GB%2Fcan_all_en.txtR2i289R3R4R5R107R6tgoR0y40:assets%2Flocales%2Fen-GB%2Fcan_bo_en.txtR2i2402R3R4R5R108R6tgoR0y43:assets%2Flocales%2Fen-GB%2Fcan_front_en.txtR2i1174R3R4R5R109R6tgoR0y44:assets%2Flocales%2Fen-GB%2Fcollection_en.txtR2i4584R3R4R5R110R6tgoR0y35:assets%2Flocales%2Fen-GB%2Fdata.tsvR2i386R3R4R5R111R6tgoR0y43:assets%2Flocales%2Fen-GB%2Fequipment_en.txtR2i7299R3R4R5R112R6tgoR0y44:assets%2Flocales%2Fen-GB%2Fescalation_en.txtR2i4745R3R4R5R113R6tgoR0y36:assets%2Flocales%2Fen-GB%2Ffonts.xmlR2i103R3R4R5R114R6tgoR0y57:assets%2Flocales%2Fen-GB%2Finstallation-activation_en.txtR2i3271R3R4R5R115R6tgoR0y38:assets%2Flocales%2Fen-GB%2Fmeta_en.txtR2i569R3R4R5R116R6tgoR0y44:assets%2Flocales%2Fen-GB%2Fnointernet_en.txtR2i13026R3R4R5R117R6tgoR0y40:assets%2Flocales%2Fen-GB%2Fsalttv_en.txtR2i14504R3R4R5R118R6tgoR0y43:assets%2Flocales%2Fen-GB%2Fstability_en.txtR2i5574R3R4R5R119R6tgoR0y43:assets%2Flocales%2Fen-GB%2Fvalidator_en.txtR2i243R3R4R5R120R6tgoR0y42:assets%2Flocales%2Fen-GB%2Fwifi-lan_en.txtR2i7135R3R4R5R121R6tgoR0y37:assets%2Flocales%2Ffr-FR%2Fall_fr.txtR2i4688R3R4R5R122R6tgoR0y43:assets%2Flocales%2Ffr-FR%2FbillShock_fr.txtR2i3615R3R4R5R123R6tgoR0y40:assets%2Flocales%2Ffr-FR%2Fcables_fr.txtR2i2448R3R4R5R124R6tgoR0y41:assets%2Flocales%2Ffr-FR%2Fcan_all_fr.txtR2i289R3R4R5R125R6tgoR0y40:assets%2Flocales%2Ffr-FR%2Fcan_bo_fr.txtR2i1637R3R4R5R126R6tgoR0y43:assets%2Flocales%2Ffr-FR%2Fcan_front_fr.txtR2i1174R3R4R5R127R6tgoR0y44:assets%2Flocales%2Ffr-FR%2Fcollection_fr.txtR2i4893R3R4R5R128R6tgoR0y44:assets%2Flocales%2Ffr-FR%2Fdrop_downs_fr.txtR2zR3R4R5R129R6tgoR0y43:assets%2Flocales%2Ffr-FR%2Fequipment_fr.txtR2i6890R3R4R5R130R6tgoR0y44:assets%2Flocales%2Ffr-FR%2Fescalation_fr.txtR2i5064R3R4R5R131R6tgoR0y57:assets%2Flocales%2Ffr-FR%2Finstallation-activation_fr.txtR2i3558R3R4R5R132R6tgoR0y38:assets%2Flocales%2Ffr-FR%2Fmeta_fr.txtR2i648R3R4R5R133R6tgoR0y44:assets%2Flocales%2Ffr-FR%2Fnointernet_fr.txtR2i14653R3R4R5R134R6tgoR0y40:assets%2Flocales%2Ffr-FR%2Fsalttv_fr.txtR2i16577R3R4R5R135R6tgoR0y43:assets%2Flocales%2Ffr-FR%2Fstability_fr.txtR2i6434R3R4R5R136R6tgoR0y43:assets%2Flocales%2Ffr-FR%2Fvalidator_fr.txtR2i248R3R4R5R137R6tgoR0y42:assets%2Flocales%2Ffr-FR%2Fwifi-lan_fr.txtR2i8042R3R4R5R138R6tgoR0y28:assets%2Flocales%2Findex.xmlR2i2613R3R4R5R139R6tgoR0y37:assets%2Flocales%2Fit-IT%2Fall_it.txtR2i4642R3R4R5R140R6tgoR0y43:assets%2Flocales%2Fit-IT%2FbillShock_it.txtR2i3710R3R4R5R141R6tgoR0y40:assets%2Flocales%2Fit-IT%2Fcables_it.txtR2i2699R3R4R5R142R6tgoR0y41:assets%2Flocales%2Fit-IT%2Fcan_all_it.txtR2i289R3R4R5R143R6tgoR0y40:assets%2Flocales%2Fit-IT%2Fcan_bo_it.txtR2i1634R3R4R5R144R6tgoR0y43:assets%2Flocales%2Fit-IT%2Fcan_front_it.txtR2i1145R3R4R5R145R6tgoR0y44:assets%2Flocales%2Fit-IT%2Fcollection_it.txtR2i4974R3R4R5R146R6tgoR0y43:assets%2Flocales%2Fit-IT%2Fequipment_it.txtR2i6823R3R4R5R147R6tgoR0y44:assets%2Flocales%2Fit-IT%2Fescalation_it.txtR2i3473R3R4R5R148R6tgoR0y57:assets%2Flocales%2Fit-IT%2Finstallation-activation_it.txtR2i3473R3R4R5R149R6tgoR0y38:assets%2Flocales%2Fit-IT%2Fmeta_it.txtR2i647R3R4R5R150R6tgoR0y44:assets%2Flocales%2Fit-IT%2Fnointernet_it.txtR2i12995R3R4R5R151R6tgoR0y40:assets%2Flocales%2Fit-IT%2Fsalttv_it.txtR2i16019R3R4R5R152R6tgoR0y43:assets%2Flocales%2Fit-IT%2Fstability_it.txtR2i5634R3R4R5R153R6tgoR0y43:assets%2Flocales%2Fit-IT%2Fvalidator_it.txtR2i320R3R4R5R154R6tgoR0y42:assets%2Flocales%2Fit-IT%2Fwifi-lan_it.txtR2i7794R3R4R5R155R6tgoR0y41:assets%2Flocales%2Ftranslations_notes.txtR2i154R3R4R5R156R6tgoR0y37:assets%2Flocales%2F_icons%2Fcs-CZ.pngR2i3115R3R56R5R157R6tgoR0y37:assets%2Flocales%2F_icons%2Fde-DE.pngR2i822R3R56R5R158R6tgoR0y37:assets%2Flocales%2F_icons%2Fen-CA.pngR2i930R3R56R5R159R6tgoR0y37:assets%2Flocales%2F_icons%2Fen-GB.pngR2i1005R3R56R5R160R6tgoR0y37:assets%2Flocales%2F_icons%2Fen-US.pngR2i954R3R56R5R161R6tgoR0y37:assets%2Flocales%2F_icons%2Fes-ES.pngR2i800R3R56R5R162R6tgoR0y37:assets%2Flocales%2F_icons%2Ffr-FR.pngR2i829R3R56R5R163R6tgoR0y37:assets%2Flocales%2F_icons%2Fit-IT.pngR2i740R3R56R5R164R6tgoR0y37:assets%2Flocales%2F_icons%2Fja-JP.pngR2i771R3R56R5R165R6tgoR0y37:assets%2Flocales%2F_icons%2Fko-KR.pngR2i3281R3R56R5R166R6tgoR0y37:assets%2Flocales%2F_icons%2Fnb-NO.pngR2i858R3R56R5R167R6tgoR0y37:assets%2Flocales%2F_icons%2Fpl-PL.pngR2i2980R3R56R5R168R6tgoR0y37:assets%2Flocales%2F_icons%2Fyo-DA.pngR2i3065R3R56R5R169R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R170R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R171R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR173y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R172R5y28:flixel%2Fsounds%2Fflixel.mp3R174aR176y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R175R174aR173R175hgoR2i33629R3R178R5R177R174aR176R177hgoR2i15744R3R14R15y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R14R15y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R56R5R183R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R56R5R184R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR2i912R3R56R5R185R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR2i433R3R56R5R186R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR2i446R3R56R5R187R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR2i459R3R56R5R188R6tgoR0y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR2i511R3R56R5R189R6tgoR0y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR2i493R3R56R5R190R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR2i247R3R56R5R191R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR2i534R3R56R5R192R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR2i922R3R56R5R193R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR2i946R3R56R5R194R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR2i253R3R56R5R195R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR2i212R3R56R5R196R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR2i192R3R56R5R197R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR2i214R3R56R5R198R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR2i156R3R56R5R199R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR2i1724R3R56R5R200R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR2i294R3R56R5R201R6tgoR0y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR2i129R3R56R5R202R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR2i128R3R56R5R203R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR2i136R3R56R5R204R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR2i147R3R56R5R205R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR2i191R3R56R5R206R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR2i153R3R56R5R207R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR2i185R3R56R5R208R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR2i201R3R56R5R209R6tgoR0y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR2i210R3R56R5R210R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR2i18509R3R56R5R211R6tgoR0y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR2i1263R3R4R5R212R6tgoR0y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR2i1953R3R4R5R213R6tgoR0y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR2i1848R3R4R5R214R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_20200402_cycletimeexpectednextweek_bb_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_admins_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_customerprofile_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_dashboardsante_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_test_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_italic_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_italic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_italic_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_italic_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_italic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_italic_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_italic_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_italic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_italic_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_regular_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_regular_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_regular_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_black_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_black_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_black_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_regular_eot extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_regular_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_regular_woff extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_activation_sst_door_online_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_activation_verrif_eligibility_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_illustration_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_intro_baby_shocked_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_sync_ffs_db extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_all_good_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_clipboard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_close_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_comment_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_de_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_en_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_exit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_fr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_help_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_howto_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_it_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_mail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_showpwd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_trainingmode_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardde_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboarden_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardfr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_version_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_can_index_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_all_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_billshock_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_cables_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_can_all_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_can_bo_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_can_front_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_collection_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_equipment_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_escalation_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_installation_activation_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_meta_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_nointernet_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_salttv_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_stability_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_validator_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_wifi_lan_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_all_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_billshock_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_cables_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_can_all_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_can_bo_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_can_front_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_collection_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_data_tsv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_equipment_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_escalation_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_fonts_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_installation_activation_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_meta_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_nointernet_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_salttv_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_stability_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_validator_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_wifi_lan_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_all_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_billshock_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_cables_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_can_all_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_can_bo_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_can_front_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_collection_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_drop_downs_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_equipment_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_escalation_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_installation_activation_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_meta_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_nointernet_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_salttv_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_stability_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_validator_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_wifi_lan_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_index_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_all_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_billshock_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_cables_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_can_all_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_can_bo_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_can_front_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_collection_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_equipment_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_escalation_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_installation_activation_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_meta_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_nointernet_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_salttv_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_stability_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_validator_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_wifi_lan_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_translations_notes_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_cs_cz_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_de_de_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_en_ca_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_en_gb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_en_us_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_es_es_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_fr_fr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_it_it_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_ja_jp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_ko_kr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_nb_no_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_pl_pl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales__icons_yo_da_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/20200402_CycleTimeExpectedNextWeek_BB.csv") @:noCompletion #if display private #end class __ASSET__assets_data_20200402_cycletimeexpectednextweek_bb_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/admins.txt") @:noCompletion #if display private #end class __ASSET__assets_data_admins_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/customerProfile.json") @:noCompletion #if display private #end class __ASSET__assets_data_customerprofile_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/dashboardSante.json") @:noCompletion #if display private #end class __ASSET__assets_data_dashboardsante_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/test.txt") @:noCompletion #if display private #end class __ASSET__assets_data_test_txt extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/JetBrainsMono-Bold-Italic.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_italic_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/JetBrainsMono-Bold-Italic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_italic_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/JetBrainsMono-Bold-Italic.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_italic_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/JetBrainsMono-Bold.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/JetBrainsMono-Bold.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/JetBrainsMono-Bold.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/JetBrainsMono-ExtraBold-Italic.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/JetBrainsMono-ExtraBold-Italic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/JetBrainsMono-ExtraBold-Italic.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/JetBrainsMono-ExtraBold.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/JetBrainsMono-ExtraBold.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/JetBrainsMono-ExtraBold.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/JetBrainsMono-Italic.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_italic_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/JetBrainsMono-Italic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_italic_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/JetBrainsMono-Italic.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_italic_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/JetBrainsMono-Medium-Italic.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_italic_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/JetBrainsMono-Medium-Italic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_italic_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/JetBrainsMono-Medium-Italic.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_italic_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/JetBrainsMono-Medium.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/JetBrainsMono-Medium.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/JetBrainsMono-Medium.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/JetBrainsMono-Regular.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_regular_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/JetBrainsMono-Regular.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_regular_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/JetBrainsMono-Regular.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_regular_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/Lato-Black.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_black_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/Lato-Black.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_black_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/Lato-Black.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_black_woff extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/Lato-Regular.eot") @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_regular_eot extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/Lato-Regular.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_regular_ttf extends lime.text.Font {}
@:keep @:file("assets/fonts/Lato-Regular.woff") @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_regular_woff extends haxe.io.Bytes {}
@:keep @:image("assets/images/activation/SST-door-online.png") @:noCompletion #if display private #end class __ASSET__assets_images_activation_sst_door_online_png extends lime.graphics.Image {}
@:keep @:image("assets/images/activation/verrif_eligibility.png") @:noCompletion #if display private #end class __ASSET__assets_images_activation_verrif_eligibility_png extends lime.graphics.Image {}
@:keep @:image("assets/images/default.png") @:noCompletion #if display private #end class __ASSET__assets_images_default_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ILLUSTRATION.png") @:noCompletion #if display private #end class __ASSET__assets_images_illustration_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/intro/baby_shocked.png") @:noCompletion #if display private #end class __ASSET__assets_images_intro_baby_shocked_png extends lime.graphics.Image {}
@:keep @:file("assets/images/sync.ffs_db") @:noCompletion #if display private #end class __ASSET__assets_images_sync_ffs_db extends haxe.io.Bytes {}
@:keep @:image("assets/images/ui/all-good.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_all_good_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/back.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_back_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/clipBoard.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_clipboard_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/close.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_close_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/comment.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_comment_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/de.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_de_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/down.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_down_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/en.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_en_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/exit.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_exit_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/fr.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_fr_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/help.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_help_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/howto.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_howto_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/it.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_it_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/left.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_left_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/light.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_light_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/mail.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_mail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/right.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_right_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/showPwd.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_showpwd_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/trainingMode.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_trainingmode_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/tutoKeyboardDE.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardde_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/tutoKeyboardEN.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboarden_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/tutoKeyboardFR.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardfr_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/tutoKeyboardIT.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardit_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/version.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_version_png extends lime.graphics.Image {}
@:keep @:file("assets/locales/can_index.xml") @:noCompletion #if display private #end class __ASSET__assets_locales_can_index_xml extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/all_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_all_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/billShock_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_billshock_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/cables_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_cables_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/can_all_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_can_all_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/can_bo_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_can_bo_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/can_front_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_can_front_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/collection_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_collection_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/equipment_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_equipment_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/escalation_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_escalation_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/installation-activation_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_installation_activation_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/meta_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_meta_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/nointernet_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_nointernet_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/salttv_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_salttv_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/stability_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_stability_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/validator_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_validator_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/wifi-lan_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_wifi_lan_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/all_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_all_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/billShock_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_billshock_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/cables_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_cables_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/can_all_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_can_all_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/can_bo_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_can_bo_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/can_front_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_can_front_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/collection_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_collection_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/data.tsv") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_data_tsv extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/equipment_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_equipment_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/escalation_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_escalation_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/fonts.xml") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_fonts_xml extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/installation-activation_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_installation_activation_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/meta_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_meta_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/nointernet_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_nointernet_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/salttv_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_salttv_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/stability_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_stability_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/validator_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_validator_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/wifi-lan_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_wifi_lan_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/all_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_all_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/billShock_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_billshock_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/cables_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_cables_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/can_all_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_can_all_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/can_bo_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_can_bo_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/can_front_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_can_front_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/collection_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_collection_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/drop_downs_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_drop_downs_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/equipment_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_equipment_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/escalation_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_escalation_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/installation-activation_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_installation_activation_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/meta_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_meta_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/nointernet_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_nointernet_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/salttv_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_salttv_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/stability_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_stability_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/validator_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_validator_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/wifi-lan_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_wifi_lan_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/index.xml") @:noCompletion #if display private #end class __ASSET__assets_locales_index_xml extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/all_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_all_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/billShock_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_billshock_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/cables_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_cables_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/can_all_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_can_all_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/can_bo_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_can_bo_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/can_front_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_can_front_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/collection_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_collection_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/equipment_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_equipment_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/escalation_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_escalation_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/installation-activation_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_installation_activation_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/meta_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_meta_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/nointernet_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_nointernet_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/salttv_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_salttv_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/stability_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_stability_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/validator_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_validator_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/wifi-lan_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_wifi_lan_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/translations_notes.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_translations_notes_txt extends haxe.io.Bytes {}
@:keep @:image("assets/locales/_icons/cs-CZ.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_cs_cz_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/de-DE.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_de_de_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/en-CA.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_en_ca_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/en-GB.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_en_gb_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/en-US.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_en_us_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/es-ES.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_es_es_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/fr-FR.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_fr_fr_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/it-IT.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_it_it_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/ja-JP.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_ja_jp_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/ko-KR.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_ko_kr_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/nb-NO.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_nb_no_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/pl-PL.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_pl_pl_png extends lime.graphics.Image {}
@:keep @:image("assets/locales/_icons/yo-DA.png") @:noCompletion #if display private #end class __ASSET__assets_locales__icons_yo_da_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,3/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_jetbrainsmono_bold_italic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_italic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/JetBrainsMono-Bold-Italic"; #else ascender = 970; descender = -270; height = 1240; numGlyphs = 825; underlinePosition = -142; underlineThickness = 45; unitsPerEM = 1000; #end name = "JetBrains Mono Bold Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_jetbrainsmono_bold_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_bold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/JetBrainsMono-Bold"; #else ascender = 970; descender = -270; height = 1240; numGlyphs = 825; underlinePosition = -142; underlineThickness = 45; unitsPerEM = 1000; #end name = "JetBrains Mono Bold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_jetbrainsmono_extrabold_italic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/JetBrainsMono-ExtraBold-Italic"; #else ascender = 970; descender = -270; height = 1240; numGlyphs = 825; underlinePosition = -142; underlineThickness = 45; unitsPerEM = 1000; #end name = "JetBrains Mono ExtraBold Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_jetbrainsmono_extrabold_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_extrabold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/JetBrainsMono-ExtraBold"; #else ascender = 970; descender = -270; height = 1240; numGlyphs = 825; underlinePosition = -142; underlineThickness = 45; unitsPerEM = 1000; #end name = "JetBrains Mono ExtraBold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_jetbrainsmono_italic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_italic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/JetBrainsMono-Italic"; #else ascender = 970; descender = -270; height = 1240; numGlyphs = 825; underlinePosition = -142; underlineThickness = 45; unitsPerEM = 1000; #end name = "JetBrains Mono Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_jetbrainsmono_medium_italic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_italic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/JetBrainsMono-Medium-Italic"; #else ascender = 970; descender = -270; height = 1240; numGlyphs = 825; underlinePosition = -142; underlineThickness = 45; unitsPerEM = 1000; #end name = "JetBrains Mono Medium Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_jetbrainsmono_medium_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_medium_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/JetBrainsMono-Medium"; #else ascender = 970; descender = -270; height = 1240; numGlyphs = 825; underlinePosition = -142; underlineThickness = 45; unitsPerEM = 1000; #end name = "JetBrains Mono Medium"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_jetbrainsmono_regular_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_jetbrainsmono_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/JetBrainsMono-Regular"; #else ascender = 970; descender = -270; height = 1240; numGlyphs = 825; underlinePosition = -142; underlineThickness = 45; unitsPerEM = 1000; #end name = "JetBrains Mono Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_lato_black_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_black_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Lato-Black"; #else ascender = 1974; descender = -426; height = 2400; numGlyphs = 277; underlinePosition = -200; underlineThickness = 194; unitsPerEM = 2000; #end name = "Lato Black"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_lato_regular_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_lato_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Lato-Regular"; #else ascender = 1974; descender = -426; height = 2400; numGlyphs = 277; underlinePosition = -200; underlineThickness = 120; unitsPerEM = 2000; #end name = "Lato Regular"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_bold_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_bold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_extrabold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_medium_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_medium_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_lato_black_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_lato_black_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_lato_black_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_lato_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_lato_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_lato_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_bold_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_bold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_bold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_extrabold_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_extrabold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_extrabold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_medium_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_medium_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_medium_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_jetbrainsmono_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_jetbrainsmono_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_jetbrainsmono_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_lato_black_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_lato_black_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_lato_black_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_lato_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_lato_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_lato_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
