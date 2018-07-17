package
{
	public class EmbedData
	{
		public function EmbedData()
		{
		}
		
//		[Embed(source="Assets/DigGuideDesc.xml", mimeType="application/octet-stream")] 
//		private static const digGuide:Class;
//		public static function getDigGuideDescXml():XML{
//			return new XML(new digGuide());
//		}
		
//		[Embed(source="Assets/movie.data", mimeType="application/octet-stream")] 
//		public static const movieData:Class;
		
		[Embed(source="Assets/badwords.txt", mimeType="application/octet-stream")] 
		public static const wc:Class;
		
//		[Embed(source="Assets/Splash/perfectworld.png")]
		public static const wanmeiPic:Class;
		
		
		
		public static const AnmatorRock:XML=<Motion duration="6" xmlns="fl.motion.*" xmlns:geom="flash.geom.*" xmlns:filters="flash.filters.*">
	<source>
		<Source frameRate="24" x="0" y="0" scaleX="1" scaleY="1" rotation="0" elementType="graphic" symbolName="补间 1">
			<dimensions>
				<geom:Rectangle left="-60.95" top="-72" width="121.95" height="144"/>
			</dimensions>
			<transformationPoint>
				<geom:Point x="0.4997949979499795" y="0.5"/>
			</transformationPoint>
		</Source>
	</source>

	<Keyframe index="0" tweenSnap="true">
		<tweens>
			<SimpleEase ease="0"/>
		</tweens>
	</Keyframe>

	<Keyframe index="3" tweenSnap="true" scaleX="1.205" scaleY="1.301" rotation="-30">
		<tweens>
			<SimpleEase ease="0"/>
		</tweens>
	</Keyframe>

	<Keyframe index="5" tweenSnap="true" scaleX="1" scaleY="1" rotation="0">
		<tweens>
			<SimpleEase ease="0"/>
		</tweens>
	</Keyframe>
</Motion>;
		
		public static const AttackRockXml:XML=<Motion duration="6" xmlns="fl.motion.*" xmlns:geom="flash.geom.*" xmlns:filters="flash.filters.*">
			<source>
				<Source frameRate="24" x="295.5" y="216.55" scaleX="1" scaleY="1" rotation="0" elementType="movie clip" symbolName="元件 1">
					<dimensions>
						<geom:Rectangle left="0" top="0" width="255" height="355"/>
					</dimensions>
					<transformationPoint>
						<geom:Point x="0.5" y="0.5"/>
					</transformationPoint>
				</Source>
			</source>
		
			<Keyframe index="0" tweenSnap="true">
				<tweens>
					<SimpleEase ease="0"/>
				</tweens>
			</Keyframe>
		
			<Keyframe index="3" tweenSnap="true" y="0.04999999999998295" scaleX="1.2" scaleY="1.2" rotation="-26.7">
				<tweens>
					<SimpleEase ease="0"/>
				</tweens>
			</Keyframe>
		
			<Keyframe index="5" tweenSnap="true" y="0" scaleX="1" scaleY="1" rotation="0">
				<tweens>
					<SimpleEase ease="0"/>
				</tweens>
			</Keyframe>
		</Motion>;
		
		public static const CikeAnimatorXml:XML=<Motion duration="7" xmlns="fl.motion.*" xmlns:geom="flash.geom.*" xmlns:filters="flash.filters.*">
	<source>
		<Source frameRate="24" x="0.5" y="-0.05" scaleX="1" scaleY="1" rotation="0" elementType="movie clip" symbolName="元件 1">
			<dimensions>
				<geom:Rectangle left="0" top="0" width="255" height="355"/>
			</dimensions>
			<transformationPoint>
				<geom:Point x="0.5" y="0.5"/>
			</transformationPoint>
		</Source>
	</source>

	<Keyframe index="0" tweenSnap="true">
		<tweens>
			<SimpleEase ease="0"/>
		</tweens>
	</Keyframe>

	<Keyframe index="2" tweenSnap="true" rotation="-35.2">
		<tweens>
			<SimpleEase ease="0"/>
		</tweens>
	</Keyframe>

	<Keyframe index="4" tweenSnap="true" rotation="40.2">
		<tweens>
			<SimpleEase ease="0"/>
		</tweens>
	</Keyframe>

	<Keyframe index="6" rotation="0"/>
</Motion>;
	}
}