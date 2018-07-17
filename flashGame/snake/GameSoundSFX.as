package snake
{
	import com.fish.modules.preloadMD.models.SystemMD;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.system.System;
	import flash.utils.getTimer;

	public class GameSoundSFX
	{
		public var cannvas:GameCanvas;
		
		public var tempVol:Number;
		
		public var acidSfx:int=0;
		public var artifactSfx:int=0;
		public var closestArtifact_dist:int;
		public var closestArtifact_num:int;
		
		
		public var sfx_0:Sound;
		public var sfx_1:Sound;
		public var sfx_2:Sound;
		public var sfx_3:Sound;
		public var sfx_4:Sound;
		public var sfx_5:Sound;
		public var sfx_6:Sound;
		public var sfx_7:Sound;
		public var sfx_8:Sound;
		public var sfx_9:Sound;
		public var sfx_10:Sound;
		public var sfx_11:Sound;
		public var sfx_12:Sound;
		public var sfx_13:Sound;
		public var sfx_14:Sound;
		public var sfx_15:Sound;
		public var sfx_20:Sound;
		public var sfx_21:Sound;
		public var sfx_22:Sound;
		public var sfx_23:Sound;
		public var sfx_24:Sound;
		public var sfx_25:Sound;
		public var sfx_26:Sound;
		public var sfx_27:Sound;
		public var sfx_28:Sound;
		public var sfx_29:Sound;
		public var sfx_30:Sound;
		public var sfx_31:Sound;
		public var sfx_32:Sound;
		public var sfx_33:Sound;
		public var sfx_34:Sound;
		public var sfx_35:Sound;
		public var sfx_36:Sound;
		public var sfx_37:Sound;
		public var sfx_38:Sound;
		public var sfx_39:Sound;
		public var sfx_40:Sound;
		public var sfx_41:Sound;
		public var sfx_42:Sound;
		public var sfx_43:Sound;
		public var sfx_44:Sound;
		public var sfx_45:Sound;
		public var sfx_46:Sound;
		public var sfx_47:Sound;
		public var sfx_48:Sound;
		public var sfx_49:Sound;
		public var sfx_50:Sound;
		public var sfx_51:Sound;
		public var sfx_52:Sound;
		public var sfx_53:Sound;
		public var sfx_54:Sound;
		public var sfx_55:Sound;
		public var sfx_56:Sound;
		public var sfx_57:Sound;
		public var sfx_58:Sound;
		public var sfx_59:Sound;
		public var sfx_60:Sound;
		public var sfx_61:Sound;
		public var sfx_62:Sound;
		public var sfx_63:Sound;
		public var sfx_64:Sound;
		public var sfx_65:Sound;
		public var sfx_66:Sound;
		public var sfx_67:Sound;
		public var sfx_68:Sound;
		public var sfx_69:Sound;
		public var sfx_70:Sound;
		public var sfx_71:Sound;
		public var sfx_72:Sound;
		public var sfx_73:Sound;
		public var sfx_74:Sound;
		public var sfx_75:Sound;
		public var sfx_76:Sound;
		public var sfx_77:Sound;
		public var sfx_78:Sound;
		public var sfx_79:Sound;
		public var sfx_80:Sound;
		public var sfx_81:Sound;
		public var sfx_82:Sound;
		public var sfx_83:Sound;
		public var sfx_84:Sound;
		public var sfx_85:Sound;
		public var sfx_86:Sound;
		public var sfx_87:Sound;
		public var sfx_88:Sound;
		public var sfx_89:Sound;
		public var sfx_90:Sound;
		public var sfx_91:Sound;
		public var sfx_92:Sound;
		public var sfx_93:Sound;
		public var sfx_94:Sound;
		public var sfx_95:Sound;
		public var sfx_96:Sound;
		public var sfx_97:Sound;
		public var sfx_98:Sound;
		public var sfx_99:Sound;
		public var sfx_100:Sound;
		public var sfx_101:Sound;
		public var sfx_102:Sound;
		public var sfx_103:Sound;
		public var sfx_104:Sound;
		public var sfx_105:Sound;
		public var sfx_106:Sound;
		public var sfx_107:Sound;
		public var sfx_108:Sound;
		public var sfx_109:Sound;
		public var sfx_110:Sound;
		public var sfx_111:Sound;
		public var sfx_112:Sound;
		public var sfx_113:Sound;
		public var sfx_114:Sound;
		public var sfxVolume:Number;
		public var sfxOn:Boolean;

		public var sfxChannel_0:SoundChannel;
		public var sfxTransform_0:SoundTransform;
		public var sfxChannel_0_playing:Boolean;
		public var sfxChannel_1:SoundChannel;
		public var sfxTransform_1:SoundTransform;
		public var sfxChannel_1_playing:Boolean;
		public var sfxChannel_2:SoundChannel;
		public var sfxTransform_2:SoundTransform;
		public var sfxChannel_2_playing:Boolean;
		public var sfxChannel_3:SoundChannel;
		public var sfxTransform_3:SoundTransform;
		public var sfxChannel_3_playing:Boolean;
		public var sfxChannel_4:SoundChannel;
		public var sfxTransform_4:SoundTransform;
		public var sfxChannel_4_playing:Boolean;
		public var sfxChannel_5:SoundChannel;
		public var sfxTransform_5:SoundTransform;
		public var sfxChannel_5_playing:Boolean;
		public var sfxChannel_6:SoundChannel;
		public var sfxTransform_6:SoundTransform;
		public var sfxChannel_6_playing:Boolean;
		public var sfxChannel_7:SoundChannel;
		public var sfxTransform_7:SoundTransform;
		public var sfxChannel_7_playing:Boolean;
		public var sfxChannel_8:SoundChannel;
		public var sfxTransform_8:SoundTransform;
		public var sfxChannel_8_playing:Boolean;
		public var sfxChannel_9:SoundChannel;
		public var sfxTransform_9:SoundTransform;
		public var sfxChannel_9_playing:Boolean;
		public var sfxChannel_10:SoundChannel;
		public var sfxTransform_10:SoundTransform;
		public var sfxChannel_10_playing:Boolean;
		public var sfx_a:int;
		public var sfx_b:int;
		
		/** 掉血的音效播放数量  **/
		public var numberOfBloodSplatSFX:int;
		
		private var sfcClsDic:Object={
			0:gunshot0,
			1:gunshot1,
			2:gunshot2,
			3:gunshot3,
			4:gunshot4,
			5:gunshot5,
			6:gunshot6,
			7:gunshot7,
			8:gunshot8,
			9:gunshot9,
			10:gunshot10,
			11:gunshot11,
			12:artifact,
			13:rocket,
			14:gunshot12,
			15:airsoft,
			20:dry_fire,
			21:footstep1,
			22:footstep2,
			23:footstep3,
			24:footstep4,
			25:cd_break,
			26:pistol_shell0,
			27:pistol_shell1,
			28:pistol_shell2,
			29:rifle_shell0,
			30:rifle_shell1,
			31:rifle_shell2,
			32:shotgun_shell1,
			33:shotgun_shell2,
			34:shotgun_shell3,
			35:riccochet1,
			36:riccochet2,
			37:riccochet3,
			38:gore1,
			39:gore2,
			40:gore3,
			41:gore4,
			42:headshot1,
			43:headshot2,
			44:headshot3,
			45:bulletImpact1,
			46:bulletImpact2,
			47:bulletImpact3,
			48:bulletImpact4,
			49:mag_drop,
			50:reloaded,
			51:CMG_swoosh,
			52:CMG_thump,
			53:CMG_sparkle,
			54:dis_logoSound,
			55:gun_cock,
			56:collect_health,
			57:sfx_countdown,
			58:cant_submit,
			59:death_1,
			60:death_2,
			61:death_3,
			62:death_4,
			63:death_5,
			64:death_6,
			65:death_7,
			66:death_8,
			67:death_9,
			68:death_10,
			69:death_11,
			70:death_12,
			71:death_13,
			72:death_14,
			73:death_15,
			74:death_16,
			75:death_17,
			76:death_18,
			77:acid1,
			78:acid2,
			79:acid3,
			80:acid4,
			81:door,
			82:artifact_drone1,
			83:artifact_drone2,
			84:artifact_drone3,
			85:sfx_goalComplete,
			86:sfx_goalPart,
			87:sfx_explode,
			88:sfx_collect,
			89:sfx_time,
			90:sfx_beanDie_01,
			91:sfx_beanDie_02,
			92:sfx_beanDie_03,
			93:zombie_death_1,
			94:zombie_death_2,
			95:zombie_death_3,
			96:zombie_death_4,
			97:zombie_death_5,
			98:zombie_death_6,
			99:zombie_death_7,
			100:zombie_death_9,
			101:zombie_death_10,
			102:zombie_death_11,
			103:zombie_death_12,
			104:zombie_death_13,
			105:zombie_death_14,
			106:zombie_death_15,
			107:zombie_death_16,
			108:zombie_death_17,
			109:zombie_death_19,
			110:bean_die_1,
			111:bean_die_2,
			112:bean_die_3,
			113:bean_die_4,
			114:bean_die_5
		}
		
		private static var _instance:GameSoundSFX;
		public static function getInstance():GameSoundSFX{
			if(_instance==null) _instance=new GameSoundSFX();
			return _instance;
		}
		
		public function GameSoundSFX()
		{
			if(_instance!=null) throw new Error("GameSoundSFX 不能重复实例化");
			_instance=this;
			var memory:Number=System.totalMemoryNumber;
			var time:int=getTimer();
			
			this.sfxVolume = 0.5;
			this.sfxOn = true;
			this.tempVol = 0;
			this.sfxChannel_0 = new SoundChannel();
			this.sfxTransform_0 = this.sfxChannel_0.soundTransform;
			this.sfxChannel_0_playing = false;
			this.sfxChannel_1 = new SoundChannel();
			this.sfxTransform_1 = this.sfxChannel_1.soundTransform;
			this.sfxChannel_1_playing = false;
			this.sfxChannel_2 = new SoundChannel();
			this.sfxTransform_2 = this.sfxChannel_2.soundTransform;
			this.sfxChannel_2_playing = false;
			this.sfxChannel_3 = new SoundChannel();
			this.sfxTransform_3 = this.sfxChannel_3.soundTransform;
			this.sfxChannel_3_playing = false;
			this.sfxChannel_4 = new SoundChannel();
			this.sfxTransform_4 = this.sfxChannel_4.soundTransform;
			this.sfxChannel_4_playing = false;
			this.sfxChannel_5 = new SoundChannel();
			this.sfxTransform_5 = this.sfxChannel_5.soundTransform;
			this.sfxChannel_5_playing = false;
			this.sfxChannel_6 = new SoundChannel();
			this.sfxTransform_6 = this.sfxChannel_6.soundTransform;
			this.sfxChannel_6_playing = false;
			this.sfxChannel_7 = new SoundChannel();
			this.sfxTransform_7 = this.sfxChannel_7.soundTransform;
			this.sfxChannel_7_playing = false;
			this.sfxChannel_8 = new SoundChannel();
			this.sfxTransform_8 = this.sfxChannel_8.soundTransform;
			this.sfxChannel_8_playing = false;
			this.sfxChannel_9 = new SoundChannel();
			this.sfxTransform_9 = this.sfxChannel_9.soundTransform;
			this.sfxChannel_9_playing = false;
			this.sfxChannel_10 = new SoundChannel();
			this.sfxTransform_10 = this.sfxChannel_10.soundTransform;
			this.sfxChannel_10_playing = false;
			this.sfx_a = 0;
			this.sfx_b = 0;
			trace("初始化音乐：\t"+(getTimer()-time)+"\t"+(System.totalMemoryNumber-memory)/1024/1024+"M");
		}
		public function endSoundChannel0(event:Event):void
		{
			this.sfxChannel_0_playing = false;
			this.sfxChannel_0.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel0);
			return;
		}// end function
		
		public function endSoundChannel1(event:Event):void
		{
			this.sfxChannel_1_playing = false;
			this.sfxChannel_1.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel1);
			return;
		}// end function
		
		public function endSoundChannel2(event:Event):void
		{
			this.sfxChannel_2_playing = false;
			this.sfxChannel_2.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel2);
			return;
		}// end function
		
		public function endSoundChannel3(event:Event):void
		{
			this.sfxChannel_3_playing = false;
			this.sfxChannel_3.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel3);
			return;
		}// end function
		
		public function endSoundChannel4(event:Event):void
		{
			this.sfxChannel_4_playing = false;
			this.sfxChannel_4.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel4);
			return;
		}// end function
		
		public function endSoundChannel5(event:Event):void
		{
			this.sfxChannel_5_playing = false;
			this.sfxChannel_5.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel5);
			return;
		}// end function
		
		public function endSoundChannel6(event:Event):void
		{
			this.sfxChannel_6_playing = false;
			this.sfxChannel_6.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel6);
			return;
		}// end function
		
		public function endSoundChannel7(event:Event):void
		{
			this.sfxChannel_7_playing = false;
			this.sfxChannel_7.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel7);
			return;
		}// end function
		
		public function endSoundChannel8(event:Event):void
		{
			this.sfxChannel_8_playing = false;
			this.sfxChannel_8.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel8);
			return;
		}// end function
		
		public function endSoundChannel9(event:Event):void
		{
			this.sfxChannel_9_playing = false;
			this.sfxChannel_9.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel9);
			return;
		}// end function
		
		public function endSoundChannel10(event:Event):void
		{
			this.sfxChannel_10_playing = false;
			this.sfxChannel_10.removeEventListener(Event.SOUND_COMPLETE, this.endSoundChannel10);
			return;
		}// end function
		
		public function playSoundEffect(param1:int, param2:Number, param3:int):void
		{
			
			
			
			if ((Context.getInjectInstance(SystemMD) as SystemMD).yinxiaoSwitch>0 && GlobalRef.activateState)
			{
				this.sfx_b = 100;
				this.sfx_a = 0;
				while (this.sfx_a < 10)
				{
					
					if (this["sfxChannel_" + this.sfx_a + "_playing"] == false)
					{
						this.sfx_b = this.sfx_a;
						this.sfx_a = 100;
					}
					
					this.sfx_a  ++ ;
					
				}
				if (this.sfx_b != 100)
				{
					if(this["sfx_" + param1]==null){
						this["sfx_" + param1]=new (sfcClsDic[param1])();
					}
					this["sfxChannel_" + this.sfx_b] = this["sfx_" + param1].play();
					this["sfxTransform_" + this.sfx_b].volume = this.sfxVolume * param2;
					this["sfxTransform_" + this.sfx_b].pan = param3;
					this["sfxChannel_" + this.sfx_b].soundTransform = this["sfxTransform_" + this.sfx_b];
					this["sfxChannel_" + this.sfx_b + "_playing"] = true;
					this["sfxChannel_" + this.sfx_b].addEventListener(Event.SOUND_COMPLETE, this["endSoundChannel" + this.sfx_b]);
				}
			}
		}
		
		/** 根据 位置计算音量大小， 逼真**/
		public function getVolume(param1:Number, param2:Number):void
		{
			tempVol = Math.abs(Math.sqrt((cannvas.cameraX - param1 + 400) * (cannvas.cameraX - param1 + 400) + (cannvas.cameraY - param2 + 300) * (cannvas.cameraY - param2 + 300)));
			if (tempVol < 300)
			{
				tempVol = 1;
			}
			else
			{
				tempVol = tempVol - 300;
				tempVol = 600 - Math.abs(tempVol);
				tempVol = tempVol / 600;
				if (tempVol < 0.1)
				{
					tempVol = 0;
				}
			}
			return;
		}
	}
}