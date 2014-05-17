
<!-- bublesort.php -->
<html>
<head>
<title>PHP bublesort: not as resource effective as quick sort by  splitting in  arrray in two at mid point </title>
</head>
<body>


<?php

 
//  four ways to code loop to perform repetitive actions
//  In pracice only about 3 are used, be aware of the forth


/*  bublesort sudo  code  syntax
 
1. either a while or for loop passing on each element and moving to right 
2. Second for loop to compare each element to elent to its right and move if greater or  stop if condition is not met
3. pass url or _GET debug = 1 variable to see debub, else dont' or pass 0 to not see it 
*/




 //var_dump($_GET);
 print("<hr> debug =  " . $_GET['debug'] . "<hr>" ); 



 
 if 		(	isset($_GET['debug']) &&   ($_GET['debug']) == '1' 	)    	{  		$debug =  1;  		}       
 elseif		(  	isset($_GET['debug']) &&   ($_GET['debug']) == '0'   ) 		{    	$debug =  0;   	} 
 else   																		{    	$debug =  0; 					 	}

 
  print("<hr> debug =  " . $debug . "<hr>" ); 
 



$arr 	=   array(7,5,3,1);   												// Simple array, may affect stop variable in else
			if ($debug === 1)   print("INITIAL ARRAY NO BUBBLE SORT"); var_dump($arr);

$arrlen	=	count($arr);
			if ($debug === 1) print( "Initial array length:  "   .  $arrlen. "<hr> " );  		// print array len

$whileCount  	= 0;  // default count passes on while
$forCount 	 	= 0;  // default count on for loop
$ifCount		= 0;  // default coutn on if condition to exit
$elsecount		= 0;	// default count on else exit condition



			if ($debug = 10) $debug = true; 

 
 
 
print("<br> START BUBBLE SORT W/ WHILE LOOP:  <BR>");
 
do {     		// while stop is not true or equal to  false
 
 	 $stop = true;  		// set stop to true so while continues
 	 
 	 $whileCount++;
 	 				if ($debug === 1)  print($stop . " ==1 <hr>" );
 	 
 	 
 	// loop  over 		 
 	 for(  $a=0; $a < ($arrlen - 1); $a++  ) {  // is a counter  up to arr len - 1
					
			$forCount++;
			
					if ($debug === 1) print($stop . " ==  iside for <hr>" );
	 				 		// first array index already set by for loop
	   		$b =  $a++;   	// set second array, this array index will be len -1 because array starts at 0
	        	
	  				if ($debug === 1) print( "array indeces"  . $a . $b . "<hr>"  );  
	 			 	if ($debug === 1) print( "array values at index or key: "  .   $arr[$a] . $arr[$b]	 . "<hr>"  );  
					if ($debug === 1) var_dump($arr); 
	  
	  // if lef element value is > right element value 
	  if (  $arr[$a] > $arr[$b]  )
	     {  $ifCount++; 		
	      	     	if ($debug === 1) print($stop . " ==  3 <hr>" );
	           	//swap  move this code to dumb swap function later and pass a  & a+1 ANd  arr for swap and return arr for now simple
	        	$tempItem  		= $arr[a];  		// set  first array allemnt to temp for a position 1
				$arr[a] 		= $arr[b];			// reset value  on position 2
				$arr[b] 		= $tempItem;		// reset value on position 1

			   	$stop  = true;  // because element 1 is > element 2, condition is true, so continue while statement passess over for loop
			
				//if ($debug === 1)  print($stop);
	     }
	     
	     // break for loop for this iteration of element comparison if right side is greater
	     elseif (  $arr[$b] > $arr[$a]  )
	      { 		$elsecount++;
	                break;  
	                 
	      }   

		 // break and stop if elment position 1 is > than  elment position 0
	     elseif (  $arr[1] > $arr[0]  )
	     { 		$elsecount++;
	            $stop = false;   
	      }  // when elment value to the right is not greater, cease by setting stop
	     
	     else {  };    
	     
	}  	// for end
	
} 	// do end 

while (  !$stop );    		// while stop is not true or equal to  false






if ( $debug  ===  1 )  {
print("WHILE COUNT:  " . $whileCount.  " <BR>: " );
print("FOR COUNT:  " . $forCount.  " <BR>: " );
print("IF COUNT:  " . $ifCount.  " <BR>: " );
print("ELSE COUNT:  " . $elsecount.  " <BR>: " );

}


print("FINAL BUBBLE SORTED ARRAY <BR>: " );

var_dump($arr); 

 
 
 
?>


</body>

</html>

