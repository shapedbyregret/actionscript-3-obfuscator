package  {
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.text.*;
	import flash.utils.Timer;

	[SWF(width="\x34\x30\x30", height="\x36\x30\x30", backgroundColor="\x23\x46\x46\x46\x46\x46\x46",frameRate="\x33\x30")]
	public class Main_Obfs extends Sprite {
		
		private var _2340:MovieClip;
		private var _2356:int;
		private var _482:Array;
		private var _735:Array;
		private var _3260:Array;
		
		private var _2251:Boolean;
		private var _4486:int;
		private var _2685:int;
		
		private var _3495:Boolean;
		private var _779:int;
		private var _4691:int;
		
		private var _3123:Boolean;
		private var _1479:int;
		private var _2418:int;
		
		private var _1290:Timer;
		private var _317:Timer;
		private var _4805:Timer;
		
		public function Main_Obfs() {
			
			
			var _3672:StyleSheet = new StyleSheet();
			_3672.parseCSS("\x70\x7b\x66\x6f\x6e\x74\x57\x65\x69\x67\x68\x74\x3a\x62\x6f\x6c\x64\x3b\x66\x6f\x6e\x74\x53\x69\x7a\x65\x3a\x34\x38\x70\x78\x3b\x66\x6f\x6e\x74\x46\x61\x6d\x69\x6c\x79\x3a\x41\x72\x69\x61\x6c\x3b\x7d\x61\x3a\x6c\x69\x6e\x6b\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x33\x33\x33\x33\x33\x33\x7d\x61\x3a\x68\x6f\x76\x65\x72\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x46\x46\x41\x41\x43\x43\x3b\x7d");
			var _4955:TextField = new TextField();
			_4955.styleSheet = _3672;
			_4955.autoSize = TextFieldAutoSize.CENTER;
			_4955.htmlText = "\x3c\x70\x3e\x3c\x61\x20\x68\x72\x65\x66\x3d\x27\x23\x27\x3e\x53\x74\x61\x72\x74\x3c\x2f\x61\x3e\x3c\x2f\x70\x3e";
			
			var _1833:SimpleButton = new SimpleButton(_4955, _4955, _4955, _4955);
			_1833.x = stage.stageWidth/2 - _1833.width/2;
			_1833.y = stage.stageHeight / 2 - _1833.height;
			addChildAt(_1833, 0);
			stage.addEventListener(MouseEvent.CLICK, _2679);
			
		}
		
		private function _165( _1147:Event ):void
		{
			
			if ( _1290.currentCount > 1 ) {
				
				
				_1712(_482[_4486], 0xFFAACC);
				_1712(_482[_4486+1], 0xFFAACC);
				
				
				if ( _482[_4486].width > _482[_4486+1].width ) {
					
					var _2953:int = _482[_4486].y;
					_482[_4486].y = _482[_4486 + 1].y;
					_482[_4486 + 1].y = _2953;
					
					
					var _2706:MovieClip = _482[_4486];
					_482[_4486] = _482[_4486 + 1];
					_482[_4486 + 1] = _2706;
					
					
					_2251 = true;
				}
				
				
				if ( _4486 > 0 ) {
					_1712(_482[_4486-1], 0x333333);
					_1712(_482[_4486], 0x333333);
				}
				
				
				
				
				if ( _4486 < _2356-2-_2685 ) { 
					_4486++;
					_1290.reset();
					_1290.start();
				}
				else {
					_4486 = 0;
					_2685++;
					if ( !_2251 ) { 
						_1290.reset();
						_1290.stop();
					}
					else { 
						_2251 = false;
						_1290.reset();
						_1290.start();
					}
				}
			}
			
			
			if ( _317.currentCount > 1 ) {
				
				
				_1712(_735[_779], 0xFFAACC);
				_1712(_735[_779+1], 0xFFAACC);
				
				
				if ( _735[_779].width > _735[_779+1].width ) {
					
					var _2187:int = _735[_779].y;
					_735[_779].y = _735[_779 + 1].y;
					_735[_779 + 1].y = _2187;
					
					
					var _4545:MovieClip = _735[_779];
					_735[_779] = _735[_779 + 1];
					_735[_779 + 1] = _4545;
					
					_3495 = true;
				}
				
				
				if ( _779 > 0 ) {
					_1712(_735[_779-1], 0x333333);
					_1712(_735[_779], 0x333333);
				}
				
				if ( _779 < _2356-2-_4691 ) { 
					_779++;
					_317.reset();
					_317.start();
				}
				else {
					_779 = 0;
					_4691++;
					if ( !_3495 ) {
						_317.reset();
						_317.stop();
					}
					else {
						_3495 = false;
						_317.reset();
						_317.start();
					}
				}
			}
			
			
			if ( _4805.currentCount > 1 ) {
				
				
				_1712(_3260[_1479], 0xFFAACC);
				_1712(_3260[_1479+1], 0xFFAACC);
				
				
				
				if ( _3260[_1479].width > _3260[_1479+1].width ) {
					
					var _4339:int = _3260[_1479].y;
					_3260[_1479].y = _3260[_1479 + 1].y;
					_3260[_1479 + 1].y = _4339;
					
					
					var _1469:MovieClip = _3260[_1479];
					_3260[_1479] = _3260[_1479 + 1];
					_3260[_1479 + 1] = _1469;
					
					_3123 = true;
				}
				
				
				if ( _1479 > 0 ) {
					_1712(_3260[_1479-1], 0x333333);
					_1712(_3260[_1479], 0x333333);
				}
				
				if ( _1479 < _2356-2-_2418 ) { 
					_1479++;
					_4805.reset();
					_4805.start();
				}
				else {
					_1479 = 0;
					_2418++;
					if ( !_3123 ) {
						_4805.reset();
						_4805.stop();
					}
					else {
						_3123 = false;
						_4805.reset();
						_4805.start();
					}
				}
			}
			
		}
		
		private function _535( _582:MouseEvent ):void
		{
			_2340 = new MovieClip();
			_2340.graphics.beginFill(0xFFFFFF, 1);
			_2340.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			_2340.graphics.endFill();
			
			
			_2356 = 40;
			_482 = new Array();
			_735 = new Array();
			_3260 = new Array();
			
			_2251 = _3495 = _3123 = false;
			_4486 = _779 = _1479 = 0;
			_2685 = _4691 = _2418 = 0;
			_1290 = new Timer(20, 0);
			_317 = new Timer(20, 0);
			_4805 = new Timer(20, 0);
			
			
			for ( var _3963:int = 0; _3963 < _2356; ++_3963 ) {
				var _4742:MovieClip = new MovieClip();
				_4742.graphics.beginFill(0x333333, 1);
				_4742.graphics.drawRect(0, 0, (_3963*9)+Math.floor(Math.random()*50), 2);
				_4742.graphics.endFill();
				_4742.y = (_3963 * 3) + 20;
				_482.push( _4742 );
				_2340.addChild(_482[_3963]);
			}
			
			
			for ( var _1340:int = 0; _1340 < _2356; ++_1340 ) {
				var _1116:MovieClip = new MovieClip();
				_1116.graphics.beginFill(0x333333, 1);
				_1116.graphics.drawRect(0, 0, Math.floor(Math.random()*stage.stageWidth), 2);
				_1116.graphics.endFill();
				_1116.y = (_1340 * 3) + 220;
				_735.push( _1116 );
				_2340.addChild(_735[_1340]);
			}
			
			
			for ( var _2513:int = 0; _2513 < _2356; ++_2513 ) {
				var _4057:Number = stage.stageWidth - (_2513 * 10);
				_4057 -= Math.floor(Math.random() * 50);
				if ( _4057 < 0 ) { _4057 = _2513; }
				var _3724:MovieClip = new MovieClip();
				_3724.graphics.beginFill(0x333333, 1);
				_3724.graphics.drawRect(0, 0, _4057, 2);
				_3724.graphics.endFill();
				_3724.y = (_2513 * 3) + 420;
				_3260.push( _3724 );
				_2340.addChild(_3260[_2513]);
			}
			
			
			var _3956:TextFormat = new TextFormat("\x41\x72\x69\x61\x6c", 16, 0x333333, true);
			var _4930:TextField = new TextField();
			_4930.defaultTextFormat = _3956;
			_4930.autoSize = TextFieldAutoSize.CENTER;
			_4930.x = stage.stageWidth / 2;
			_4930.text = "\x4d\x6f\x73\x74\x6c\x79\x20\x53\x6f\x72\x74\x65\x64\x20\x41\x73\x63\x65\x6e\x64\x69\x6e\x67";
			_2340.addChild(_4930);
			
			var _3367:TextField = new TextField();
			_3367.defaultTextFormat = _3956;
			_3367.autoSize = TextFieldAutoSize.CENTER;
			_3367.x = stage.stageWidth / 2;
			_3367.y = 200;
			_3367.text = "\x52\x61\x6e\x64\x6f\x6d";
			_2340.addChild(_3367);
			
			var _1123:TextField = new TextField();
			_1123.defaultTextFormat = _3956;
			_1123.autoSize = TextFieldAutoSize.CENTER;
			_1123.x = stage.stageWidth / 2;
			_1123.y = 400;
			_1123.text = "\x4d\x6f\x73\x74\x6c\x79\x20\x53\x6f\x72\x74\x65\x64\x20\x44\x65\x73\x63\x65\x6e\x64\x69\x6e\x67";
			_2340.addChild(_1123);
			
			
			var _3672:StyleSheet = new StyleSheet();
			_3672.parseCSS("\x70\x7b\x66\x6f\x6e\x74\x57\x65\x69\x67\x68\x74\x3a\x62\x6f\x6c\x64\x3b\x66\x6f\x6e\x74\x53\x69\x7a\x65\x3a\x31\x36\x3b\x66\x6f\x6e\x74\x46\x61\x6d\x69\x6c\x79\x3a\x41\x72\x69\x61\x6c\x3b\x7d\x61\x3a\x6c\x69\x6e\x6b\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x33\x33\x33\x33\x33\x33\x7d\x61\x3a\x68\x6f\x76\x65\x72\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x46\x46\x41\x41\x43\x43\x3b\x7d");
			var _3949:TextField = new TextField();
			_3949.border = true;
			_3949.styleSheet = _3672;
			_3949.autoSize = TextFieldAutoSize.CENTER;
			_3949.htmlText = "\x3c\x70\x3e\x3c\x61\x20\x68\x72\x65\x66\x3d\x27\x23\x27\x3e\x52\x65\x73\x74\x61\x72\x74\x3c\x2f\x61\x3e\x3c\x2f\x70\x3e";
			
			var _1675:SimpleButton = new SimpleButton(_3949, _3949, _3949, _3949);
			_1675.x = stage.stageWidth/2 - _1675.width;
			_1675.y = 570;
			_2340.addChild(_1675);
			_1675.addEventListener(MouseEvent.CLICK, _535);
			
			
			_1290.start();
			_317.start();
			_4805.start();
			
			addChild(_2340);
		}
		
		private function _1712( _2282:MovieClip, _2090:uint ):void
		{
			var _4057:int = _2282.width;
			var _2652:int = _2282.height;
			_2282.graphics.beginFill(_2090, 1);
			_2282.graphics.drawRect(0, 0, _4057, _2652);
			_2282.graphics.endFill();
		}
		
		private function _2679( _582:MouseEvent ):void
		{
			
			_535(null);
			
			
			addEventListener(Event.ENTER_FRAME, _165);
			
			
			stage.removeEventListener(MouseEvent.CLICK, _2679);
			removeChildAt(0);
		}
		
	}
	
}
