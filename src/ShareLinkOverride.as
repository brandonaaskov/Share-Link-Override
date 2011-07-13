package {
	import com.brightcove.api.APIModules;
	import com.brightcove.api.CustomModule;
	import com.brightcove.api.events.MediaEvent;
	import com.brightcove.api.modules.ExperienceModule;
	import com.brightcove.api.modules.SocialModule;
	import com.brightcove.api.modules.VideoPlayerModule;

	public class ShareLinkOverride extends CustomModule
	{
		private var _experienceModule:ExperienceModule;
		private var _videoPlayerModule:VideoPlayerModule;
		private var _socialModule:SocialModule;
		
		public function ShareLinkOverride()
		{
			trace("@project ShareLinkOverride");
			trace("@author Brandon Aaskov (Brightcove)");
			trace("@lastModified 07.13.11 1010 EST");
			trace("@version 1.0.0");
		}
		
		override protected function initialize():void
		{
			_experienceModule = player.getModule(APIModules.EXPERIENCE) as ExperienceModule;
			_videoPlayerModule = player.getModule(APIModules.VIDEO_PLAYER) as VideoPlayerModule;
			_socialModule = player.getModule(APIModules.SOCIAL) as SocialModule;
			
			_videoPlayerModule.addEventListener(MediaEvent.BEGIN, onMediaBegin);
			_videoPlayerModule.addEventListener(MediaEvent.CHANGE, onMediaChange);
			
			if(_videoPlayerModule.getCurrentVideo())
			{
				changeShareLinkToPageURL();
			}
		}
		
		private function onMediaBegin(pEvent:MediaEvent):void
		{
			changeShareLinkToPageURL();	
		}
		
		private function onMediaChange(pEvent:MediaEvent):void
		{
			changeShareLinkToPageURL();
		}
		
		private function changeShareLinkToPageURL():void
		{
			_socialModule.setLink(_experienceModule.getExperienceURL());
		}
	}
}
