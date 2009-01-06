package  {
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.text.*;
	import flash.utils.Timer;

	[SWF(width="\x34\x30\x30", height="\x36\x30\x30", backgroundColor="\x23\x46\x46\x46\x46\x46\x46",frameRate="\x33\x30")]
	public class Bubble_Sort_Obfs extends Sprite {
		
		private var _2951:MovieClip;
		private var _3472:int;
		private var _3906:Array;
		private var _1181:Array;
		private var _2017:Array;
		
		private var _936:Boolean;
		private var _3742:int;
		private var _3245:int;
		
		private var _3177:Boolean;
		private var _4308:int;
		private var _4750:int;
		
		private var _4632:Boolean;
		private var _4158:int;
		private var _3118:int;
		
		private var _2385:Timer;
		private var _201:Timer;
		private var _574:Timer;
		
		public function Bubble_Sort_Obfs() {
			
			
			var _2313:StyleSheet = new StyleSheet();
			_2313.parseCSS("\x70\x7b\x66\x6f\x6e\x74\x57\x65\x69\x67\x68\x74\x3a\x62\x6f\x6c\x64\x3b\x66\x6f\x6e\x74\x53\x69\x7a\x65\x3a\x34\x38\x70\x78\x3b\x66\x6f\x6e\x74\x46\x61\x6d\x69\x6c\x79\x3a\x41\x72\x69\x61\x6c\x3b\x7d\x61\x3a\x6c\x69\x6e\x6b\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x33\x33\x33\x33\x33\x33\x7d\x61\x3a\x68\x6f\x76\x65\x72\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x46\x46\x41\x41\x43\x43\x3b\x7d");
			var _4528:TextField = new TextField();
			_4528.styleSheet = _2313;
			_4528.autoSize = TextFieldAutoSize.CENTER;
			_4528.htmlText = "\x3c\x70\x3e\x3c\x61\x20\x68\x72\x65\x66\x3d\x27\x23\x27\x3e\x53\x74\x61\x72\x74\x3c\x2f\x61\x3e\x3c\x2f\x70\x3e";
			
			var _3014:SimpleButton = new SimpleButton(_4528, _4528, _4528, _4528);
			_3014.x = stage.stageWidth/2 - _3014.width/2;
			_3014.y = stage.stageHeight / 2 - _3014.height;
			addChildAt(_3014, 0);
			stage.addEventListener(MouseEvent.CLICK, _1198);
			
		}
		
		private function _3384( _4296:Event ):void
		{
			
			if ( _2385.currentCount > 1 ) {
				
				
				_2525(_3906[_3742], 0xFFAACC);
				_2525(_3906[_3742+1], 0xFFAACC);
				
				
				if ( _3906[_3742].width > _3906[_3742+1].width ) {
					
					var _3511:int = _3906[_3742].y;
					_3906[_3742].y = _3906[_3742 + 1].y;
					_3906[_3742 + 1].y = _3511;
					
					
					var _3547:MovieClip = _3906[_3742];
					_3906[_3742] = _3906[_3742 + 1];
					_3906[_3742 + 1] = _3547;
					
					
					_936 = true;
				}
				
				
				if ( _3742 > 0 ) {
					_2525(_3906[_3742-1], 0x333333);
					_2525(_3906[_3742], 0x333333);
				}
				
				
				
				
				if ( _3742 < _3472-2-_3245 ) { 
					_3742++;
					_2385.reset();
					_2385.start();
				}
				else {
					_3742 = 0;
					_3245++;
					if ( !_936 ) { 
						_2385.reset();
						_2385.stop();
					}
					else { 
						_936 = false;
						_2385.reset();
						_2385.start();
					}
				}
			}
			
			
			if ( _201.currentCount > 1 ) {
				
				
				_2525(_1181[_4308], 0xFFAACC);
				_2525(_1181[_4308+1], 0xFFAACC);
				
				
				if ( _1181[_4308].width > _1181[_4308+1].width ) {
					
					var _2576:int = _1181[_4308].y;
					_1181[_4308].y = _1181[_4308 + 1].y;
					_1181[_4308 + 1].y = _2576;
					
					
					var _4201:MovieClip = _1181[_4308];
					_1181[_4308] = _1181[_4308 + 1];
					_1181[_4308 + 1] = _4201;
					
					_3177 = true;
				}
				
				
				if ( _4308 > 0 ) {
					_2525(_1181[_4308-1], 0x333333);
					_2525(_1181[_4308], 0x333333);
				}
				
				if ( _4308 < _3472-2-_4750 ) { 
					_4308++;
					_201.reset();
					_201.start();
				}
				else {
					_4308 = 0;
					_4750++;
					if ( !_3177 ) {
						_201.reset();
						_201.stop();
					}
					else {
						_3177 = false;
						_201.reset();
						_201.start();
					}
				}
			}
			
			
			if ( _574.currentCount > 1 ) {
				
				
				_2525(_2017[_4158], 0xFFAACC);
				_2525(_2017[_4158+1], 0xFFAACC);
				
				
				
				if ( _2017[_4158].width > _2017[_4158+1].width ) {
					
					var _4413:int = _2017[_4158].y;
					_2017[_4158].y = _2017[_4158 + 1].y;
					_2017[_4158 + 1].y = _4413;
					
					
					var _1098:MovieClip = _2017[_4158];
					_2017[_4158] = _2017[_4158 + 1];
					_2017[_4158 + 1] = _1098;
					
					_4632 = true;
				}
				
				
				if ( _4158 > 0 ) {
					_2525(_2017[_4158-1], 0x333333);
					_2525(_2017[_4158], 0x333333);
				}
				
				if ( _4158 < _3472-2-_3118 ) { 
					_4158++;
					_574.reset();
					_574.start();
				}
				else {
					_4158 = 0;
					_3118++;
					if ( !_4632 ) {
						_574.reset();
						_574.stop();
					}
					else {
						_4632 = false;
						_574.reset();
						_574.start();
					}
				}
			}
			
		}
		
		private function _2266( _2619:MouseEvent ):void
		{
			_2951 = new MovieClip();
			_2951.graphics.beginFill(0xFFFFFF, 1);
			_2951.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			_2951.graphics.endFill();
			
			
			_3472 = 40;
			_3906 = new Array();
			_1181 = new Array();
			_2017 = new Array();
			
			_936 = _3177 = _4632 = false;
			_3742 = _4308 = _4158 = 0;
			_3245 = _4750 = _3118 = 0;
			_2385 = new Timer(20, 0);
			_201 = new Timer(20, 0);
			_574 = new Timer(20, 0);
			
			
			for ( var _3729:int = 0; _3729 < _3472; ++_3729 ) {
				var _3372:MovieClip = new MovieClip();
				_3372.graphics.beginFill(0x333333, 1);
				_3372.graphics.drawRect(0, 0, (_3729*9)+Math.floor(Math.random()*50), 2);
				_3372.graphics.endFill();
				_3372.y = (_3729 * 3) + 20;
				_3906.push( _3372 );
				_2951.addChild(_3906[_3729]);
			}
			
			
			for ( var _3369:int = 0; _3369 < _3472; ++_3369 ) {
				var _2514:MovieClip = new MovieClip();
				_2514.graphics.beginFill(0x333333, 1);
				_2514.graphics.drawRect(0, 0, Math.floor(Math.random()*stage.stageWidth), 2);
				_2514.graphics.endFill();
				_2514.y = (_3369 * 3) + 220;
				_1181.push( _2514 );
				_2951.addChild(_1181[_3369]);
			}
			
			
			for ( var _185:int = 0; _185 < _3472; ++_185 ) {
				var _2914:Number = stage.stageWidth - (_185 * 10);
				_2914 -= Math.floor(Math.random() * 50);
				if ( _2914 < 0 ) { _2914 = _185; }
				var _3828:MovieClip = new MovieClip();
				_3828.graphics.beginFill(0x333333, 1);
				_3828.graphics.drawRect(0, 0, _2914, 2);
				_3828.graphics.endFill();
				_3828.y = (_185 * 3) + 420;
				_2017.push( _3828 );
				_2951.addChild(_2017[_185]);
			}
			
			
			var _4842:TextFormat = new TextFormat("\x41\x72\x69\x61\x6c", 16, 0x333333, true);
			var _2883:TextField = new TextField();
			_2883.defaultTextFormat = _4842;
			_2883.autoSize = TextFieldAutoSize.CENTER;
			_2883.x = stage.stageWidth / 2;
			_2883.text = "\x4d\x6f\x73\x74\x6c\x79\x20\x53\x6f\x72\x74\x65\x64\x20\x41\x73\x63\x65\x6e\x64\x69\x6e\x67";
			_2951.addChild(_2883);
			
			var _4764:TextField = new TextField();
			_4764.defaultTextFormat = _4842;
			_4764.autoSize = TextFieldAutoSize.CENTER;
			_4764.x = stage.stageWidth / 2;
			_4764.y = 200;
			_4764.text = "\x52\x61\x6e\x64\x6f\x6d";
			_2951.addChild(_4764);
			
			var _2498:TextField = new TextField();
			_2498.defaultTextFormat = _4842;
			_2498.autoSize = TextFieldAutoSize.CENTER;
			_2498.x = stage.stageWidth / 2;
			_2498.y = 400;
			_2498.text = "\x4d\x6f\x73\x74\x6c\x79\x20\x53\x6f\x72\x74\x65\x64\x20\x44\x65\x73\x63\x65\x6e\x64\x69\x6e\x67";
			_2951.addChild(_2498);
			
			
			var _2313:StyleSheet = new StyleSheet();
			_2313.parseCSS("\x70\x7b\x66\x6f\x6e\x74\x57\x65\x69\x67\x68\x74\x3a\x62\x6f\x6c\x64\x3b\x66\x6f\x6e\x74\x53\x69\x7a\x65\x3a\x31\x36\x3b\x66\x6f\x6e\x74\x46\x61\x6d\x69\x6c\x79\x3a\x41\x72\x69\x61\x6c\x3b\x7d\x61\x3a\x6c\x69\x6e\x6b\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x33\x33\x33\x33\x33\x33\x7d\x61\x3a\x68\x6f\x76\x65\x72\x7b\x63\x6f\x6c\x6f\x72\x3a\x23\x46\x46\x41\x41\x43\x43\x3b\x7d");
			var _793:TextField = new TextField();
			_793.border = true;
			_793.styleSheet = _2313;
			_793.autoSize = TextFieldAutoSize.CENTER;
			_793.htmlText = "\x3c\x70\x3e\x3c\x61\x20\x68\x72\x65\x66\x3d\x27\x23\x27\x3e\x52\x65\x73\x74\x61\x72\x74\x3c\x2f\x61\x3e\x3c\x2f\x70\x3e";
			
			var _3564:SimpleButton = new SimpleButton(_793, _793, _793, _793);
			_3564.x = stage.stageWidth/2 - _3564.width;
			_3564.y = 570;
			_2951.addChild(_3564);
			_3564.addEventListener(MouseEvent.CLICK, _2266);
			
			
			_2385.start();
			_201.start();
			_574.start();
			
			addChild(_2951);
		}
		
		private function _2525( _3036:MovieClip, _2143:uint ):void
		{
			var _2914:int = _3036.width;
			var _4768:int = _3036.height;
			_3036.graphics.beginFill(_2143, 1);
			_3036.graphics.drawRect(0, 0, _2914, _4768);
			_3036.graphics.endFill();
		}
		
		private function _1198( _2619:MouseEvent ):void
		{
			
			_2266(null);
			
			
			addEventListener(Event.ENTER_FRAME, _3384);
			
			
			stage.removeEventListener(MouseEvent.CLICK, _1198);
			removeChildAt(0);
		}
		
	}
	
}

