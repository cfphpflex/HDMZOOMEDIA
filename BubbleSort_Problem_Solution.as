 
<?xml version="1.0" encoding="utf-8"?>
<mx:Application xmlns:mx="http://www.adobe.com/2006/mxml"
				xmlns:com="com.*"  width="100%" 			height="100%"
				layout="absolute"  creationComplete="init()" 				viewSourceURL="srcview/index.html">
	<mx:Script>
		<![CDATA[
			
			
		
			
		public function init():void
			{
			import com.GradientCanvas;
			
			import mx.collections.ArrayCollection;
			//import com.getBubbleSort;
		 
		
		
			
			
			
			
		// function to swap values in array	
		function swap( a:int, b:int, arr:Array ):Array 
			{   var tempItem:int = arr[a];  		// set temp for a position 1
				arr[a] 			 = arr[b];			// reset value  on position 2
				arr[b] 			 = tempItem;		// reset value on position 1
				
				return arr;  // return array
			} 
			
			
		// bubbleSwuap  function  to process array per problem logic	
		function bubbleSwap(arrayLen:int, arr:Array):Array  
			{
				for (  var i:int = 0; i < ( arrayLen - 1); i++    ) 
				{  // arrayLen minus 1 because we determined  number of passess is len - 1, final pass is not necessary, by pass meaning loop additionally, if the sorted 
					 
					
					for (  var a:int = 0; a < (arrayLen - 1); a++    ) 
					{  // arrayLen minus 1 because aray starts with 0 element position
						var b:int = a+1; // set  second element position
						
						if (arr[b] < arr[a])   // if the element being swaped forward is greater than the next element position to the right, move it to the right by calling swap funciton
						{  
							arr = swap( a, b, arr );  //call swap function
						}
						else{  // break;  //  break loop  interferes with sorting larger seed arrays
						}  
					}
				}
				
				return arr;   // return array
				//mx.controls.Alert.show(" Pass "+ i + "Final Bubble Sorted Array:     " +  arr );
				
			}
		
		
		 function alertShow(message, finalArray):void 
			{    
			    mx.controls.Alert.show(message + finalArray);
				   
			}
		
		
			
			    var arr:Array 			= new Array(2,500,300,99,77,180,5,33,3,22,1);  	//  initial array
				var arr2:Array 			= new Array(2,500,300,99,77,180,5,33,3,22,1);   //  for array DESCENDING  sort
				var arrayLen:int 		= arr.length; 		 	   						// set aray length
				 
				var finalArray:Array 	= bubbleSwap(arrayLen, arr);		//  declare final Array variable calling bubbleSwap function and passing array and len arguments into it for copy
				 
				var message:String =  "Final Bubble Sorted Array "   ;  // make a message
				alertShow( message , finalArray );   // display alert message
				
				//var message2:String =  "Final Bubble Sorted Array "   ;  // make a message
				
				//arr2.sort(Array.DESCENDING | Array.CASEINSENSITIVE); // does not work
				
				//alertShow( message2, arr2 );   // display alert message
				
				  
		}
			
		]]>
		
	</mx:Script>
	
	 
	<mx:Style source="./assets/css/styles.css"/>
 
	<com:GradientCanvas xmlns:mx="http://www.adobe.com/2006/mxml" 			 
		horizontalScrollPolicy="off"
		verticalScrollPolicy="off"
		styleName="titleBar7"
		id="secondlayer"   
		height="98%"  
		width="100%"  x="0" y="-1">
		 
		
		
		
			 
		<mx:Label   styleName="titleBar7" id="test"  text="Initial Array:  2,500,300,99,77,180,5,33,3,22,1  " />
	</com:GradientCanvas>
	
</mx:Application>
