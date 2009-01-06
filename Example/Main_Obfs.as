package  {
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.text.*;
	import flash.utils.Timer;

	[SWF(width="\x34\x30\x30", height="\x36\x30\x30", backgroundColor="\x23\x46\x46\x46\x46\x46\x46",frameRate="\x33\x30")]
	public class _2837 extends Sprite {
		
		private var _841:MovieClip;
		private var _2434:int;
		private var _1034:Array;
		private var _501:Array;
		private var _667:Array;
		
		private var _2426:Boolean;
		private var _536:int;
		private var _2972:int;
		
		private var _3053:Boolean;
		private var _1071:int;
		private var _2322:int;
		
		private var _4746:Boolean;
		private var _2348:int;
		private var _1352:int;
		
		private var _2194:Timer;
		private var _3494:Timer;
		private var _4743:Timer;
		
		public function _2837() {
			
			
			var _663:StyleSheet = new StyleSheet();
			_663.parseCSS("\x70\x7b\x66\x6f\x6e\x74\x57\x65\x69\x67\x68\x74\x3a\x62\x6f\x6c\x64\x3b\x66\x6f\x6e\x74\x53\x69\x7a\x65\x3a\x34\x38\x70\x78\x3b\x66\x6f\x6e\x74\x46\x61\x6d\x69\x6c\x79\x3a\x41\x72\x69\x61\x6c\x3b\x7d\x61\x3a\x6c\x69\x6e\x6b\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x33\x33\x33\x33\x33\x33\x7d\x61\x3a\x68\x6f\x76\x65\x72\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x46\x46\x41\x41\x43\x43\x3b\x7d");
			var _254:TextField = new TextField();
			_254.styleSheet = _663;
			_254.autoSize = TextFieldAutoSize.CENTER;
			_254.htmlText = "\x3c\x70\x3e\x3c\x61\x20\x68\x72\x65\x66\x3d\x27\x23\x27\x3e\x53\x74\x61\x72\x74\x3c\x2f\x61\x3e\x3c\x2f\x70\x3e";
			
			var _4456:SimpleButton = new SimpleButton(_254, _254, _254, _254);
			_4456.x = stage.stageWidth/2 - _4456.width/2;
			_4456.y = stage.stageHeight / 2 - _4456.height;
			addChildAt(_4456, 0);
			stage.addEventListener(MouseEvent.CLICK, _1842);
			
		}
		
		private function _766( _1990:Event ):void
		{
			
			if ( _2194.currentCount > 1 ) {
				
				
				_2295(_1034[_536], 0xFFAACC);
				_2295(_1034[_536+1], 0xFFAACC);
				
				
				if ( _1034[_536].width > _1034[_536+1].width ) {
					
					var _4930:int = _1034[_536].y;
					_1034[_536].y = _1034[_536 + 1].y;
					_1034[_536 + 1].y = _4930;
					
					
					var _2223:MovieClip = _1034[_536];
					_1034[_536] = _1034[_536 + 1];
					_1034[_536 + 1] = _2223;
					
					
					_2426 = true;
				}
				
				
				if ( _536 > 0 ) {
					_2295(_1034[_536-1], 0x333333);
					_2295(_1034[_536], 0x333333);
				}
				
				
				
				
				if ( _536 < _2434-2-_2972 ) { 
					_536++;
					_2194.reset();
					_2194.start();
				}
				else {
					_536 = 0;
					_2972++;
					if ( !_2426 ) { 
						_2194.reset();
						_2194.stop();
					}
					else { 
						_2426 = false;
						_2194.reset();
						_2194.start();
					}
				}
			}
			
			
			if ( _3494.currentCount > 1 ) {
				
				
				_2295(_501[_1071], 0xFFAACC);
				_2295(_501[_1071+1], 0xFFAACC);
				
				
				if ( _501[_1071].width > _501[_1071+1].width ) {
					
					var _106:int = _501[_1071].y;
					_501[_1071].y = _501[_1071 + 1].y;
					_501[_1071 + 1].y = _106;
					
					
					var _1856:MovieClip = _501[_1071];
					_501[_1071] = _501[_1071 + 1];
					_501[_1071 + 1] = _1856;
					
					_3053 = true;
				}
				
				
				if ( _1071 > 0 ) {
					_2295(_501[_1071-1], 0x333333);
					_2295(_501[_1071], 0x333333);
				}
				
				if ( _1071 < _2434-2-_2322 ) { 
					_1071++;
					_3494.reset();
					_3494.start();
				}
				else {
					_1071 = 0;
					_2322++;
					if ( !_3053 ) {
						_3494.reset();
						_3494.stop();
					}
					else {
						_3053 = false;
						_3494.reset();
						_3494.start();
					}
				}
			}
			
			
			if ( _4743.currentCount > 1 ) {
				
				
				_2295(_667[_2348], 0xFFAACC);
				_2295(_667[_2348+1], 0xFFAACC);
				
				
				
				if ( _667[_2348].width > _667[_2348+1].width ) {
					
					var _809:int = _667[_2348].y;
					_667[_2348].y = _667[_2348 + 1].y;
					_667[_2348 + 1].y = _809;
					
					
					var _569:MovieClip = _667[_2348];
					_667[_2348] = _667[_2348 + 1];
					_667[_2348 + 1] = _569;
					
					_4746 = true;
				}
				
				
				if ( _2348 > 0 ) {
					_2295(_667[_2348-1], 0x333333);
					_2295(_667[_2348], 0x333333);
				}
				
				if ( _2348 < _2434-2-_1352 ) { 
					_2348++;
					_4743.reset();
					_4743.start();
				}
				else {
					_2348 = 0;
					_1352++;
					if ( !_4746 ) {
						_4743.reset();
						_4743.stop();
					}
					else {
						_4746 = false;
						_4743.reset();
						_4743.start();
					}
				}
			}
			
		}
		
		private function _2757( _1665:MouseEvent ):void
		{
			_841 = new MovieClip();
			_841.graphics.beginFill(0xFFFFFF, 1);
			_841.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			_841.graphics.endFill();
			
			
			_2434 = 40;
			_1034 = new Array();
			_501 = new Array();
			_667 = new Array();
			
			_2426 = _3053 = _4746 = false;
			_536 = _1071 = _2348 = 0;
			_2972 = _2322 = _1352 = 0;
			_2194 = new Timer(20, 0);
			_3494 = new Timer(20, 0);
			_4743 = new Timer(20, 0);
			
			
			for ( var _151:int = 0; _151 < _2434; ++_151 ) {
				var _1635:MovieClip = new MovieClip();
				_1635.graphics.beginFill(0x333333, 1);
				_1635.graphics.drawRect(0, 0, (_151*9)+Math.floor(Math.random()*50), 2);
				_1635.graphics.endFill();
				_1635.y = (_151 * 3) + 20;
				_1034.push( _1635 );
				_841.addChild(_1034[_151]);
			}
			
			
			for ( var _1262:int = 0; _1262 < _2434; ++_1262 ) {
				var _4841:MovieClip = new MovieClip();
				_4841.graphics.beginFill(0x333333, 1);
				_4841.graphics.drawRect(0, 0, Math.floor(Math.random()*stage.stageWidth), 2);
				_4841.graphics.endFill();
				_4841.y = (_1262 * 3) + 220;
				_501.push( _4841 );
				_841.addChild(_501[_1262]);
			}
			
			
			for ( var _3527:int = 0; _3527 < _2434; ++_3527 ) {
				var _4734:Number = stage.stageWidth - (_3527 * 10);
				_4734 -= Math.floor(Math.random() * 50);
				if ( _4734 < 0 ) { _4734 = _3527; }
				var _295:MovieClip = new MovieClip();
				_295.graphics.beginFill(0x333333, 1);
				_295.graphics.drawRect(0, 0, _4734, 2);
				_295.graphics.endFill();
				_295.y = (_3527 * 3) + 420;
				_667.push( _295 );
				_841.addChild(_667[_3527]);
			}
			
			
			var _3355:TextFormat = new TextFormat("\x41\x72\x69\x61\x6c", 16, 0x333333, true);
			var _282:TextField = new TextField();
			_282.defaultTextFormat = _3355;
			_282.autoSize = TextFieldAutoSize.CENTER;
			_282.x = stage.stageWidth / 2;
			_282.text = "\x4d\x6f\x73\x74\x6c\x79\x20\x53\x6f\x72\x74\x65\x64\x20\x41\x73\x63\x65\x6e\x64\x69\x6e\x67";
			_841.addChild(_282);
			
			var _4093:TextField = new TextField();
			_4093.defaultTextFormat = _3355;
			_4093.autoSize = TextFieldAutoSize.CENTER;
			_4093.x = stage.stageWidth / 2;
			_4093.y = 200;
			_4093.text = "\x52\x61\x6e\x64\x6f\x6d";
			_841.addChild(_4093);
			
			var _744:TextField = new TextField();
			_744.defaultTextFormat = _3355;
			_744.autoSize = TextFieldAutoSize.CENTER;
			_744.x = stage.stageWidth / 2;
			_744.y = 400;
			_744.text = "\x4d\x6f\x73\x74\x6c\x79\x20\x53\x6f\x72\x74\x65\x64\x20\x44\x65\x73\x63\x65\x6e\x64\x69\x6e\x67";
			_841.addChild(_744);
			
			
			var _663:StyleSheet = new StyleSheet();
			_663.parseCSS("\x70\x7b\x66\x6f\x6e\x74\x57\x65\x69\x67\x68\x74\x3a\x62\x6f\x6c\x64\x3b\x66\x6f\x6e\x74\x53\x69\x7a\x65\x3a\x31\x36\x3b\x66\x6f\x6e\x74\x46\x61\x6d\x69\x6c\x79\x3a\x41\x72\x69\x61\x6c\x3b\x7d\x61\x3a\x6c\x69\x6e\x6b\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x33\x33\x33\x33\x33\x33\x7d\x61\x3a\x68\x6f\x76\x65\x72\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x46\x46\x41\x41\x43\x43\x3b\x7d");
			var _3174:TextField = new TextField();
			_3174.border = true;
			_3174.styleSheet = _663;
			_3174.autoSize = TextFieldAutoSize.CENTER;
			_3174.htmlText = "\x3c\x70\x3e\x3c\x61\x20\x68\x72\x65\x66\x3d\x27\x23\x27\x3e\x52\x65\x73\x74\x61\x72\x74\x3c\x2f\x61\x3e\x3c\x2f\x70\x3e";
			
			var _1966:SimpleButton = new SimpleButton(_3174, _3174, _3174, _3174);
			_1966.x = stage.stageWidth/2 - _1966.width;
			_1966.y = 570;
			_841.addChild(_1966);
			_1966.addEventListener(MouseEvent.CLICK, _2757);
			
			
			_2194.start();
			_3494.start();
			_4743.start();
			
			addChild(_841);
		}
		
		private function _2295( _65:MovieClip, _1368:uint ):void
		{
			var _4734:int = _65.width;
			var _2323:int = _65.height;
			_65.graphics.beginFill(_1368, 1);
			_65.graphics.drawRect(0, 0, _4734, _2323);
			_65.graphics.endFill();
		}
		
		private function _1842( _1665:MouseEvent ):void
		{
			
			_2757(null);
			
			
			addEventListener(Event.ENTER_FRAME, _766);
			
			
			stage.removeEventListener(MouseEvent.CLICK, _1842);
			removeChildAt(0);
		}
		
	}
	
}
