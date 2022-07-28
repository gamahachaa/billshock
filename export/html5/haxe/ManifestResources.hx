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

		data = '{"name":null,"assets":"aoy4:pathy26:assets%2Fdata%2Fadmins.txty4:sizei68y4:typey4:TEXTy2:idR1y7:preloadtgoR0y36:assets%2Fdata%2FcustomerProfile.jsonR2i9974R3R4R5R7R6tgoR0y35:assets%2Fdata%2FdashboardSante.jsonR2i3461R3R4R5R8R6tgoR0y34:assets%2Fdata%2Fdata-goes-here.txtR2zR3R4R5R9R6tgoR0y33:assets%2Fdata%2Flist_packages.csvR2i2082R3R4R5R10R6tgoR0y41:assets%2Fdata%2Foption_for_price_plan.csvR2i3476R3R4R5R11R6tgoR0y33:assets%2Fdata%2Fpp_to_options.csvR2i13033R3R4R5R12R6tgoR0y24:assets%2Fdata%2Ftest.txtR2i9R3R4R5R13R6tgoR0y27:assets%2Fdata%2Ftesters.txtR2i85R3R4R5R14R6tgoR0y46:assets%2Ffonts%2FJetBrainsMono-Bold-Italic.eotR2i145232R3y6:BINARYR5R15R6tgoR2i145004R3y4:FONTy9:classNamey51:__ASSET__assets_fonts_jetbrainsmono_bold_italic_ttfR5y46:assets%2Ffonts%2FJetBrainsMono-Bold-Italic.ttfR6tgoR0y47:assets%2Ffonts%2FJetBrainsMono-Bold-Italic.woffR2i67044R3R16R5R21R6tgoR0y39:assets%2Ffonts%2FJetBrainsMono-Bold.eotR2i138892R3R16R5R22R6tgoR2i138692R3R17R18y44:__ASSET__assets_fonts_jetbrainsmono_bold_ttfR5y39:assets%2Ffonts%2FJetBrainsMono-Bold.ttfR6tgoR0y40:assets%2Ffonts%2FJetBrainsMono-Bold.woffR2i62276R3R16R5R25R6tgoR0y51:assets%2Ffonts%2FJetBrainsMono-ExtraBold-Italic.eotR2i145920R3R16R5R26R6tgoR2i145672R3R17R18y56:__ASSET__assets_fonts_jetbrainsmono_extrabold_italic_ttfR5y51:assets%2Ffonts%2FJetBrainsMono-ExtraBold-Italic.ttfR6tgoR0y52:assets%2Ffonts%2FJetBrainsMono-ExtraBold-Italic.woffR2i65812R3R16R5R29R6tgoR0y44:assets%2Ffonts%2FJetBrainsMono-ExtraBold.eotR2i139388R3R16R5R30R6tgoR2i139168R3R17R18y49:__ASSET__assets_fonts_jetbrainsmono_extrabold_ttfR5y44:assets%2Ffonts%2FJetBrainsMono-ExtraBold.ttfR6tgoR0y45:assets%2Ffonts%2FJetBrainsMono-ExtraBold.woffR2i61016R3R16R5R33R6tgoR0y41:assets%2Ffonts%2FJetBrainsMono-Italic.eotR2i141780R3R16R5R34R6tgoR2i141572R3R17R18y46:__ASSET__assets_fonts_jetbrainsmono_italic_ttfR5y41:assets%2Ffonts%2FJetBrainsMono-Italic.ttfR6tgoR0y42:assets%2Ffonts%2FJetBrainsMono-Italic.woffR2i64504R3R16R5R37R6tgoR0y48:assets%2Ffonts%2FJetBrainsMono-Medium-Italic.eotR2i144764R3R16R5R38R6tgoR2i144528R3R17R18y53:__ASSET__assets_fonts_jetbrainsmono_medium_italic_ttfR5y48:assets%2Ffonts%2FJetBrainsMono-Medium-Italic.ttfR6tgoR0y49:assets%2Ffonts%2FJetBrainsMono-Medium-Italic.woffR2i66768R3R16R5R41R6tgoR0y41:assets%2Ffonts%2FJetBrainsMono-Medium.eotR2i138484R3R16R5R42R6tgoR2i138276R3R17R18y46:__ASSET__assets_fonts_jetbrainsmono_medium_ttfR5y41:assets%2Ffonts%2FJetBrainsMono-Medium.ttfR6tgoR0y42:assets%2Ffonts%2FJetBrainsMono-Medium.woffR2i62064R3R16R5R45R6tgoR0y42:assets%2Ffonts%2FJetBrainsMono-Regular.eotR2i136920R3R16R5R46R6tgoR2i136708R3R17R18y47:__ASSET__assets_fonts_jetbrainsmono_regular_ttfR5y42:assets%2Ffonts%2FJetBrainsMono-Regular.ttfR6tgoR0y43:assets%2Ffonts%2FJetBrainsMono-Regular.woffR2i60220R3R16R5R49R6tgoR0y31:assets%2Ffonts%2FLato-Black.eotR2i114806R3R16R5R50R6tgoR2i114588R3R17R18y36:__ASSET__assets_fonts_lato_black_ttfR5y31:assets%2Ffonts%2FLato-Black.ttfR6tgoR0y32:assets%2Ffonts%2FLato-Black.woffR2i48592R3R16R5R53R6tgoR0y33:assets%2Ffonts%2FLato-Regular.eotR2i120422R3R16R5R54R6tgoR2i120196R3R17R18y38:__ASSET__assets_fonts_lato_regular_ttfR5y33:assets%2Ffonts%2FLato-Regular.ttfR6tgoR0y34:assets%2Ffonts%2FLato-Regular.woffR2i50140R3R16R5R57R6tgoR0y42:assets%2Fimages%2Fintro%2Fbaby_shocked.pngR2i135091R3y5:IMAGER5R58R6tgoR0y37:assets%2Fimages%2Fintro%2Ffavicon.pngR2i18396R3R59R5R60R6tgoR0y45:assets%2Fimages%2Fmarylin%2Fcopyppmarilyn.pngR2i7704R3R59R5R61R6tgoR0y41:assets%2Fimages%2Fmarylin%2Flimits_de.pngR2i10073R3R59R5R62R6tgoR0y41:assets%2Fimages%2Fmarylin%2Flimits_en.pngR2i9698R3R59R5R63R6tgoR0y41:assets%2Fimages%2Fmarylin%2Flimits_fr.pngR2i10189R3R59R5R64R6tgoR0y41:assets%2Fimages%2Fmarylin%2Flimits_it.pngR2i10024R3R59R5R65R6tgoR0y35:assets%2Fimages%2Fui%2Fall-good.pngR2i4661R3R59R5R66R6tgoR0y31:assets%2Fimages%2Fui%2Fback.pngR2i7760R3R59R5R67R6tgoR0y36:assets%2Fimages%2Fui%2FclipBoard.pngR2i2456R3R59R5R68R6tgoR0y32:assets%2Fimages%2Fui%2Fclose.pngR2i4989R3R59R5R69R6tgoR0y34:assets%2Fimages%2Fui%2Fcomment.pngR2i6291R3R59R5R70R6tgoR0y29:assets%2Fimages%2Fui%2Fde.pngR2i3650R3R59R5R71R6tgoR0y31:assets%2Fimages%2Fui%2Fdown.pngR2i6660R3R59R5R72R6tgoR0y29:assets%2Fimages%2Fui%2Fen.pngR2i3572R3R59R5R73R6tgoR0y31:assets%2Fimages%2Fui%2Fexit.pngR2i4953R3R59R5R74R6tgoR0y29:assets%2Fimages%2Fui%2Ffr.pngR2i3645R3R59R5R75R6tgoR0y31:assets%2Fimages%2Fui%2Fhelp.pngR2i7180R3R59R5R76R6tgoR0y32:assets%2Fimages%2Fui%2Fhowto.pngR2i3824R3R59R5R77R6tgoR0y29:assets%2Fimages%2Fui%2Fit.pngR2i2051R3R59R5R78R6tgoR0y31:assets%2Fimages%2Fui%2Fleft.pngR2i5261R3R59R5R79R6tgoR0y32:assets%2Fimages%2Fui%2Flight.pngR2i7477R3R59R5R80R6tgoR0y33:assets%2Fimages%2Fui%2Flogout.pngR2i4472R3R59R5R81R6tgoR0y31:assets%2Fimages%2Fui%2Fmail.pngR2i21955R3R59R5R82R6tgoR0y37:assets%2Fimages%2Fui%2FpageLoader.pngR2i11707R3R59R5R83R6tgoR0y32:assets%2Fimages%2Fui%2Fright.pngR2i5276R3R59R5R84R6tgoR0y33:assets%2Fimages%2Fui%2Fscript.pngR2i8958R3R59R5R85R6tgoR0y34:assets%2Fimages%2Fui%2FshowPwd.pngR2i8423R3R59R5R86R6tgoR0y35:assets%2Fimages%2Fui%2Ftemplate.pngR2i11468R3R59R5R87R6tgoR0y39:assets%2Fimages%2Fui%2FtrainingMode.pngR2i5713R3R59R5R88R6tgoR0y41:assets%2Fimages%2Fui%2FtutoKeyboardDE.pngR2i197972R3R59R5R89R6tgoR0y41:assets%2Fimages%2Fui%2FtutoKeyboardEN.pngR2i194114R3R59R5R90R6tgoR0y41:assets%2Fimages%2Fui%2FtutoKeyboardFR.pngR2i197400R3R59R5R91R6tgoR0y41:assets%2Fimages%2Fui%2FtutoKeyboardIT.pngR2i196927R3R59R5R92R6tgoR0y34:assets%2Fimages%2Fui%2Fversion.pngR2i33131R3R59R5R93R6tgoR0y43:assets%2Flocales%2Fde-DE%2FbillShock_de.txtR2i1962R3R4R5R94R6tgoR0y41:assets%2Flocales%2Fde-DE%2Fcapture_de.txtR2i6724R3R4R5R95R6tgoR0y40:assets%2Flocales%2Fde-DE%2Fdecide_de.txtR2i3925R3R4R5R96R6tgoR0y41:assets%2Flocales%2Fde-DE%2Fheaders_de.txtR2i1210R3R4R5R97R6tgoR0y38:assets%2Flocales%2Fde-DE%2Fmeta_de.txtR2i648R3R4R5R98R6tgoR0y43:assets%2Flocales%2Fen-GB%2FbillShock_en.txtR2i1731R3R4R5R99R6tgoR0y41:assets%2Flocales%2Fen-GB%2Fcapture_en.txtR2i5790R3R4R5R100R6tgoR0y40:assets%2Flocales%2Fen-GB%2Fdecide_en.txtR2i3518R3R4R5R101R6tgoR0y41:assets%2Flocales%2Fen-GB%2Fheaders_en.txtR2i1190R3R4R5R102R6tgoR0y38:assets%2Flocales%2Fen-GB%2Fmeta_en.txtR2i569R3R4R5R103R6tgoR0y43:assets%2Flocales%2Ffr-FR%2FbillShock_fr.txtR2i1976R3R4R5R104R6tgoR0y41:assets%2Flocales%2Ffr-FR%2Fcapture_fr.txtR2i6477R3R4R5R105R6tgoR0y40:assets%2Flocales%2Ffr-FR%2Fdecide_fr.txtR2i3752R3R4R5R106R6tgoR0y41:assets%2Flocales%2Ffr-FR%2Fheaders_fr.txtR2i1306R3R4R5R107R6tgoR0y38:assets%2Flocales%2Ffr-FR%2Fmeta_fr.txtR2i648R3R4R5R108R6tgoR0y28:assets%2Flocales%2Findex.xmlR2i3214R3R4R5R109R6tgoR0y43:assets%2Flocales%2Fit-IT%2FbillShock_it.txtR2i1740R3R4R5R110R6tgoR0y41:assets%2Flocales%2Fit-IT%2Fcapture_it.txtR2i6110R3R4R5R111R6tgoR0y40:assets%2Flocales%2Fit-IT%2Fdecide_it.txtR2i3639R3R4R5R112R6tgoR0y41:assets%2Flocales%2Fit-IT%2Fheaders_it.txtR2i1238R3R4R5R113R6tgoR0y38:assets%2Flocales%2Fit-IT%2Fmeta_it.txtR2i647R3R4R5R114R6tgoR0y37:assets%2Flocales%2F_icons%2Fcs-CZ.pngR2i3115R3R59R5R115R6tgoR0y37:assets%2Flocales%2F_icons%2Fde-DE.pngR2i822R3R59R5R116R6tgoR0y37:assets%2Flocales%2F_icons%2Fen-CA.pngR2i930R3R59R5R117R6tgoR0y37:assets%2Flocales%2F_icons%2Fen-GB.pngR2i1005R3R59R5R118R6tgoR0y37:assets%2Flocales%2F_icons%2Fen-US.pngR2i954R3R59R5R119R6tgoR0y37:assets%2Flocales%2F_icons%2Fes-ES.pngR2i800R3R59R5R120R6tgoR0y37:assets%2Flocales%2F_icons%2Ffr-FR.pngR2i829R3R59R5R121R6tgoR0y37:assets%2Flocales%2F_icons%2Fit-IT.pngR2i740R3R59R5R122R6tgoR0y37:assets%2Flocales%2F_icons%2Fja-JP.pngR2i771R3R59R5R123R6tgoR0y37:assets%2Flocales%2F_icons%2Fko-KR.pngR2i3281R3R59R5R124R6tgoR0y37:assets%2Flocales%2F_icons%2Fnb-NO.pngR2i858R3R59R5R125R6tgoR0y37:assets%2Flocales%2F_icons%2Fpl-PL.pngR2i2980R3R59R5R126R6tgoR0y37:assets%2Flocales%2F_icons%2Fyo-DA.pngR2i3065R3R59R5R127R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R128R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R129R6tgoR0y25:assets%2Fxml%2Fbutton.pngR2i3200R3R59R5R130R6tgoR0y28:assets%2Fxml%2Fhaxeui_96.pngR2i2503R3R59R5R131R6tgoR0y23:assets%2Fxml%2Ftest.xmlR2i4460R3R4R5R132R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR134y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R133R5y28:flixel%2Fsounds%2Fflixel.mp3R135aR137y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R136R135aR134R136hgoR2i33629R3R139R5R138R135aR137R138hgoR2i15744R3R17R18y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R17R18y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R59R5R144R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R59R5R145R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR2i912R3R59R5R146R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR2i433R3R59R5R147R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR2i446R3R59R5R148R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR2i459R3R59R5R149R6tgoR0y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR2i511R3R59R5R150R6tgoR0y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR2i493R3R59R5R151R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR2i247R3R59R5R152R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR2i534R3R59R5R153R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR2i922R3R59R5R154R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR2i946R3R59R5R155R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR2i253R3R59R5R156R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR2i212R3R59R5R157R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR2i192R3R59R5R158R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR2i214R3R59R5R159R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR2i156R3R59R5R160R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR2i1724R3R59R5R161R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR2i294R3R59R5R162R6tgoR0y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR2i129R3R59R5R163R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR2i128R3R59R5R164R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR2i136R3R59R5R165R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR2i147R3R59R5R166R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR2i191R3R59R5R167R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR2i153R3R59R5R168R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR2i185R3R59R5R169R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR2i201R3R59R5R170R6tgoR0y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR2i210R3R59R5R171R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR2i18509R3R59R5R172R6tgoR0y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR2i1263R3R4R5R173R6tgoR0y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR2i1953R3R4R5R174R6tgoR0y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR2i1848R3R4R5R175R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_admins_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_customerprofile_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_dashboardsante_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_list_packages_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_option_for_price_plan_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_pp_to_options_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_test_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_testers_txt extends null { }
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_intro_baby_shocked_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_intro_favicon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_marylin_copyppmarilyn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_marylin_limits_de_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_marylin_limits_en_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_marylin_limits_fr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_marylin_limits_it_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_logout_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_mail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_pageloader_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_script_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_showpwd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_template_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_trainingmode_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardde_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboarden_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardfr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_version_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_billshock_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_capture_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_decide_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_headers_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_meta_de_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_billshock_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_capture_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_decide_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_headers_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_meta_en_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_billshock_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_capture_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_decide_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_headers_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_meta_fr_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_index_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_billshock_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_capture_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_decide_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_headers_it_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_meta_it_txt extends null { }
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_xml_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_xml_haxeui_96_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_xml_test_xml extends null { }
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

@:keep @:file("assets/data/admins.txt") @:noCompletion #if display private #end class __ASSET__assets_data_admins_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/customerProfile.json") @:noCompletion #if display private #end class __ASSET__assets_data_customerprofile_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/dashboardSante.json") @:noCompletion #if display private #end class __ASSET__assets_data_dashboardsante_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/list_packages.csv") @:noCompletion #if display private #end class __ASSET__assets_data_list_packages_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/option_for_price_plan.csv") @:noCompletion #if display private #end class __ASSET__assets_data_option_for_price_plan_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/pp_to_options.csv") @:noCompletion #if display private #end class __ASSET__assets_data_pp_to_options_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/test.txt") @:noCompletion #if display private #end class __ASSET__assets_data_test_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/testers.txt") @:noCompletion #if display private #end class __ASSET__assets_data_testers_txt extends haxe.io.Bytes {}
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
@:keep @:image("assets/images/intro/baby_shocked.png") @:noCompletion #if display private #end class __ASSET__assets_images_intro_baby_shocked_png extends lime.graphics.Image {}
@:keep @:image("assets/images/intro/favicon.png") @:noCompletion #if display private #end class __ASSET__assets_images_intro_favicon_png extends lime.graphics.Image {}
@:keep @:image("assets/images/marylin/copyppmarilyn.png") @:noCompletion #if display private #end class __ASSET__assets_images_marylin_copyppmarilyn_png extends lime.graphics.Image {}
@:keep @:image("assets/images/marylin/limits_de.png") @:noCompletion #if display private #end class __ASSET__assets_images_marylin_limits_de_png extends lime.graphics.Image {}
@:keep @:image("assets/images/marylin/limits_en.png") @:noCompletion #if display private #end class __ASSET__assets_images_marylin_limits_en_png extends lime.graphics.Image {}
@:keep @:image("assets/images/marylin/limits_fr.png") @:noCompletion #if display private #end class __ASSET__assets_images_marylin_limits_fr_png extends lime.graphics.Image {}
@:keep @:image("assets/images/marylin/limits_it.png") @:noCompletion #if display private #end class __ASSET__assets_images_marylin_limits_it_png extends lime.graphics.Image {}
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
@:keep @:image("assets/images/ui/logout.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_logout_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/mail.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_mail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/pageLoader.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_pageloader_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/right.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_right_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/script.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_script_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/showPwd.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_showpwd_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/template.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_template_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/trainingMode.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_trainingmode_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/tutoKeyboardDE.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardde_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/tutoKeyboardEN.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboarden_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/tutoKeyboardFR.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardfr_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/tutoKeyboardIT.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_tutokeyboardit_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ui/version.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_version_png extends lime.graphics.Image {}
@:keep @:file("assets/locales/de-DE/billShock_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_billshock_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/capture_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_capture_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/decide_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_decide_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/headers_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_headers_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/de-DE/meta_de.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_de_de_meta_de_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/billShock_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_billshock_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/capture_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_capture_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/decide_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_decide_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/headers_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_headers_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/en-GB/meta_en.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_en_gb_meta_en_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/billShock_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_billshock_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/capture_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_capture_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/decide_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_decide_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/headers_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_headers_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/fr-FR/meta_fr.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_fr_fr_meta_fr_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/index.xml") @:noCompletion #if display private #end class __ASSET__assets_locales_index_xml extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/billShock_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_billshock_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/capture_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_capture_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/decide_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_decide_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/headers_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_headers_it_txt extends haxe.io.Bytes {}
@:keep @:file("assets/locales/it-IT/meta_it.txt") @:noCompletion #if display private #end class __ASSET__assets_locales_it_it_meta_it_txt extends haxe.io.Bytes {}
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
@:keep @:image("assets/xml/button.png") @:noCompletion #if display private #end class __ASSET__assets_xml_button_png extends lime.graphics.Image {}
@:keep @:image("assets/xml/haxeui_96.png") @:noCompletion #if display private #end class __ASSET__assets_xml_haxeui_96_png extends lime.graphics.Image {}
@:keep @:file("assets/xml/test.xml") @:noCompletion #if display private #end class __ASSET__assets_xml_test_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
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
