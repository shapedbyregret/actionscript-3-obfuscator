package  {
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.text.*;
	import flash.utils.Timer;

	[SWF(width="400", height="600", backgroundColor="#FFFFFF",frameRate="30")]
	public class Bubble_Sort extends Sprite {
		
		private var buffer:MovieClip;
		private var numElements:int;
		private var arrSorted:Array;
		private var arrRandom:Array;
		private var arrReverse:Array;
		
		private var sortedHaveSwapped:Boolean;
		private var sortedCurElement:int;
		private var numPassesSorted:int;
		
		private var randomHaveSwapped:Boolean;
		private var randomCurElement:int;
		private var numPassesRandom:int;
		
		private var reverseHaveSwapped:Boolean;
		private var reverseCurElement:int;
		private var numPassesReverse:int;
		
		private var timerSorted:Timer;
		private var timerRandom:Timer;
		private var timerReverse:Timer;
		
		public function Bubble_Sort() {
			
			// Create Start Button
			var styles:StyleSheet = new StyleSheet();
			styles.parseCSS("p{fontWeight:bold;fontSize:48px;fontFamily:Arial;}a:link{color:#333333}a:hover{color:#FFAACC;}");
			var tfStart:TextField = new TextField();
			tfStart.styleSheet = styles;
			tfStart.autoSize = TextFieldAutoSize.CENTER;
			tfStart.htmlText = "<p><a href='#'>Start</a></p>";
			
			var butStart:SimpleButton = new SimpleButton(tfStart, tfStart, tfStart, tfStart);
			butStart.x = stage.stageWidth/2 - butStart.width/2;
			butStart.y = stage.stageHeight / 2 - butStart.height;
			addChildAt(butStart, 0);
			stage.addEventListener(MouseEvent.CLICK, begin);
			
		}
		
		private function mainLoop( e:Event ):void
		{
			// Bubble sort on pre-sorted array
			if ( timerSorted.currentCount > 1 ) {
				
				// Highlight which elements are being compared
				changeColor(arrSorted[sortedCurElement], 0xFFAACC);
				changeColor(arrSorted[sortedCurElement+1], 0xFFAACC);
				
				// Sorted
				if ( arrSorted[sortedCurElement].width > arrSorted[sortedCurElement+1].width ) {
					// Swap elements on screen
					var tmpNum:int = arrSorted[sortedCurElement].y;
					arrSorted[sortedCurElement].y = arrSorted[sortedCurElement + 1].y;
					arrSorted[sortedCurElement + 1].y = tmpNum;
					
					// Swap elements in array
					var tmpMc:MovieClip = arrSorted[sortedCurElement];
					arrSorted[sortedCurElement] = arrSorted[sortedCurElement + 1];
					arrSorted[sortedCurElement + 1] = tmpMc;
					
					// Since we made a swap, make sortedHaveSwapped true
					sortedHaveSwapped = true;
				}
				
				// Unhighlight
				if ( sortedCurElement > 0 ) {
					changeColor(arrSorted[sortedCurElement-1], 0x333333);
					changeColor(arrSorted[sortedCurElement], 0x333333);
				}
				
				// Have we reached the end of the array?
				// If not, increment curElement and reset counter
				// Otherwise reset curElement and check if we have made any swaps
				if ( sortedCurElement < numElements-2-numPassesSorted ) { 
					sortedCurElement++;
					timerSorted.reset();
					timerSorted.start();
				}
				else {
					sortedCurElement = 0;
					numPassesSorted++;
					if ( !sortedHaveSwapped ) { // No swaps were made, array is sorted so stop timer
						timerSorted.reset();
						timerSorted.stop();
					}
					else { // At least one swap was made, reset timer
						sortedHaveSwapped = false;
						timerSorted.reset();
						timerSorted.start();
					}
				}
			}
			
			// Bubble sort on random array
			if ( timerRandom.currentCount > 1 ) {
				
				// Highlight which elements are being compared
				changeColor(arrRandom[randomCurElement], 0xFFAACC);
				changeColor(arrRandom[randomCurElement+1], 0xFFAACC);
				
				// Random
				if ( arrRandom[randomCurElement].width > arrRandom[randomCurElement+1].width ) {
					// Swap elements on screen
					var tmpNumRand:int = arrRandom[randomCurElement].y;
					arrRandom[randomCurElement].y = arrRandom[randomCurElement + 1].y;
					arrRandom[randomCurElement + 1].y = tmpNumRand;
					
					// Swap elements in array
					var tmpMcRand:MovieClip = arrRandom[randomCurElement];
					arrRandom[randomCurElement] = arrRandom[randomCurElement + 1];
					arrRandom[randomCurElement + 1] = tmpMcRand;
					
					randomHaveSwapped = true;
				}
				
				// Unhighlight
				if ( randomCurElement > 0 ) {
					changeColor(arrRandom[randomCurElement-1], 0x333333);
					changeColor(arrRandom[randomCurElement], 0x333333);
				}
				
				if ( randomCurElement < numElements-2-numPassesRandom ) { 
					randomCurElement++;
					timerRandom.reset();
					timerRandom.start();
				}
				else {
					randomCurElement = 0;
					numPassesRandom++;
					if ( !randomHaveSwapped ) {
						timerRandom.reset();
						timerRandom.stop();
					}
					else {
						randomHaveSwapped = false;
						timerRandom.reset();
						timerRandom.start();
					}
				}
			}
			
			// Bubble sort on reverse-sorted array
			if ( timerReverse.currentCount > 1 ) {
				
				// Highlight which elements are being compared
				changeColor(arrReverse[reverseCurElement], 0xFFAACC);
				changeColor(arrReverse[reverseCurElement+1], 0xFFAACC);
				
				//trace(new String(arrReverse[reverseCurElement].width + ":" + arrReverse[reverseCurElement+1].width));
				// Reverse
				if ( arrReverse[reverseCurElement].width > arrReverse[reverseCurElement+1].width ) {
					// Swap elements on screen
					var tmpNumRev:int = arrReverse[reverseCurElement].y;
					arrReverse[reverseCurElement].y = arrReverse[reverseCurElement + 1].y;
					arrReverse[reverseCurElement + 1].y = tmpNumRev;
					
					// Swap elements in array
					var tmpMcRev:MovieClip = arrReverse[reverseCurElement];
					arrReverse[reverseCurElement] = arrReverse[reverseCurElement + 1];
					arrReverse[reverseCurElement + 1] = tmpMcRev;
					
					reverseHaveSwapped = true;
				}
				
				// Unhighlight
				if ( reverseCurElement > 0 ) {
					changeColor(arrReverse[reverseCurElement-1], 0x333333);
					changeColor(arrReverse[reverseCurElement], 0x333333);
				}
				
				if ( reverseCurElement < numElements-2-numPassesReverse ) { 
					reverseCurElement++;
					timerReverse.reset();
					timerReverse.start();
				}
				else {
					reverseCurElement = 0;
					numPassesReverse++;
					if ( !reverseHaveSwapped ) {
						timerReverse.reset();
						timerReverse.stop();
					}
					else {
						reverseHaveSwapped = false;
						timerReverse.reset();
						timerReverse.start();
					}
				}
			}
			
		}
		
		private function restart( me:MouseEvent ):void
		{
			buffer = new MovieClip();
			buffer.graphics.beginFill(0xFFFFFF, 1);
			buffer.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			buffer.graphics.endFill();
			
			// Declare variables
			numElements = 40;
			arrSorted = new Array();
			arrRandom = new Array();
			arrReverse = new Array();
			
			sortedHaveSwapped = randomHaveSwapped = reverseHaveSwapped = false;
			sortedCurElement = randomCurElement = reverseCurElement = 0;
			numPassesSorted = numPassesRandom = numPassesReverse = 0;
			timerSorted = new Timer(20, 0);
			timerRandom = new Timer(20, 0);
			timerReverse = new Timer(20, 0);
			
			// Fill arrSorted with sorted elements
			for ( var i:int = 0; i < numElements; ++i ) {
				var tempSorted:MovieClip = new MovieClip();
				tempSorted.graphics.beginFill(0x333333, 1);
				tempSorted.graphics.drawRect(0, 0, (i*9)+Math.floor(Math.random()*50), 2);
				tempSorted.graphics.endFill();
				tempSorted.y = (i * 3) + 20;
				arrSorted.push( tempSorted );
				buffer.addChild(arrSorted[i]);
			}
			
			// Fill arrRandom with sorted elements
			for ( var j:int = 0; j < numElements; ++j ) {
				var tempRandom:MovieClip = new MovieClip();
				tempRandom.graphics.beginFill(0x333333, 1);
				tempRandom.graphics.drawRect(0, 0, Math.floor(Math.random()*stage.stageWidth), 2);
				tempRandom.graphics.endFill();
				tempRandom.y = (j * 3) + 220;
				arrRandom.push( tempRandom );
				buffer.addChild(arrRandom[j]);
			}
			
			// Fill arrReverse with descending sorted elements
			for ( var k:int = 0; k < numElements; ++k ) {
				var w:Number = stage.stageWidth - (k * 10);
				w -= Math.floor(Math.random() * 50);
				if ( w < 0 ) { w = k; }
				var tempReverse:MovieClip = new MovieClip();
				tempReverse.graphics.beginFill(0x333333, 1);
				tempReverse.graphics.drawRect(0, 0, w, 2);
				tempReverse.graphics.endFill();
				tempReverse.y = (k * 3) + 420;
				arrReverse.push( tempReverse );
				buffer.addChild(arrReverse[k]);
			}
			
			// Add some textfields
			var tf:TextFormat = new TextFormat("Arial", 16, 0x333333, true);
			var tfSorted:TextField = new TextField();
			tfSorted.defaultTextFormat = tf;
			tfSorted.autoSize = TextFieldAutoSize.CENTER;
			tfSorted.x = stage.stageWidth / 2;
			tfSorted.text = "Mostly Sorted Ascending";
			buffer.addChild(tfSorted);
			
			var tfRandom:TextField = new TextField();
			tfRandom.defaultTextFormat = tf;
			tfRandom.autoSize = TextFieldAutoSize.CENTER;
			tfRandom.x = stage.stageWidth / 2;
			tfRandom.y = 200;
			tfRandom.text = "Random";
			buffer.addChild(tfRandom);
			
			var tfReverse:TextField = new TextField();
			tfReverse.defaultTextFormat = tf;
			tfReverse.autoSize = TextFieldAutoSize.CENTER;
			tfReverse.x = stage.stageWidth / 2;
			tfReverse.y = 400;
			tfReverse.text = "Mostly Sorted Descending";
			buffer.addChild(tfReverse);
			
			// Add restart button
			var styles:StyleSheet = new StyleSheet();
			styles.parseCSS("p{fontWeight:bold;fontSize:16;fontFamily:Arial;}a:link{color:#333333}a:hover{color:#FFAACC;}");
			var tfRestart:TextField = new TextField();
			tfRestart.border = true;
			tfRestart.styleSheet = styles;
			tfRestart.autoSize = TextFieldAutoSize.CENTER;
			tfRestart.htmlText = "<p><a href='#'>Restart</a></p>";
			
			var butRestart:SimpleButton = new SimpleButton(tfRestart, tfRestart, tfRestart, tfRestart);
			butRestart.x = stage.stageWidth/2 - butRestart.width;
			butRestart.y = 570;
			buffer.addChild(butRestart);
			butRestart.addEventListener(MouseEvent.CLICK, restart);
			
			// Start the timers
			timerSorted.start();
			timerRandom.start();
			timerReverse.start();
			
			addChild(buffer);
		}
		
		private function changeColor( mc:MovieClip, color:uint ):void
		{
			var w:int = mc.width;
			var h:int = mc.height;
			mc.graphics.beginFill(color, 1);
			mc.graphics.drawRect(0, 0, w, h);
			mc.graphics.endFill();
		}
		
		private function begin( me:MouseEvent ):void
		{
			// Instantiate variables
			restart(null);
			
			// Begin mainloop
			addEventListener(Event.ENTER_FRAME, mainLoop);
			
			// Remove start button
			stage.removeEventListener(MouseEvent.CLICK, begin);
			removeChildAt(0);
		}
		
	}
	
}

