<!-- FORT Re-pricing Cross Reference Table  Created: 6/12/2013  by Emiliano Gaytan


PER SPECS:  Admin Changes

1.	Add new menu item, Products -> Maritz Exceptions (visible when in ICE storefronts only)
2.	Display a grid, similar to the product grid, but using a query similar to this:

SELECT itemSKU_vc As ItemSKU, ItemNumber_vc As ItemNumber, itemDescription_vc As ItemDescription, 
	ItemMSRP_mon As MSRP, recommendedSell_mon As Price, 
	ICE_recommendedSell_mon As ICE Sell Price, ICE_active_bol As Active
FROM [maritz].[dbo].maritz_catalog
ORDER BY itemDescription_vc

3.	Make only the last two fields available for editing using CFGridUpdate:
a.	Sell Price (field with 2 decimals)
b.	Active (checkbox)
4.	Add a search box at the top of the grid (see http://www.raymondcamden.com/index.cfm/2010/4/29/Can-you-search-a-CFGRID + comments below)
-->
 
<html>
<head>
<title>  Test JGrid   </title>

	<link rel="stylesheet" type="text/css" media="screen" href="http://www.coldfusion-ria.com/Test/KSPersonal/jquery/css/cupertino/jquery-ui-1.7.2.custom.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="http://www.coldfusion-ria.com/Test/KSPersonal/jquery/css/ui.jqgrid.css" />
	
	
	<script src="http://www.coldfusion-ria.com/Test/KSPersonal/jquery/js/jquery-1.3.2.min.js" type="text/javascript"></script>
	<script src="http://www.coldfusion-ria.com/Test/KSPersonal/jquery/js/i18n/grid.locale-en.js" type="text/javascript"></script>
	<script src="http://www.coldfusion-ria.com/Test/KSPersonal/jquery/js/jquery.jqGrid.min.js" type="text/javascript"></script>

           
            
            <link rel="stylesheet" type="text/css" media="screen" href="http://coldfusion-ria.com/test/themes/basic/grid.css" />
            <link rel="stylesheet" type="text/css" media="screen" href="http://coldfusion-ria.com/test/themes/jqModal.css" />
            <script src="http://coldfusion-ria.com/test/jquery.js" type="text/javascript"></script>
            <script src="http://coldfusion-ria.com/test/jquery.jqGrid.js" type="text/javascript"></script>
            <script src="http://coldfusion-ria.com/test/jqModal.js" type="text/javascript"></script>
            <script src="http://exotoolz.com/js/jdgrid/src/jqDnR.js" type="text/javascript"></script>
            
          
            
            
        <script type="text/javascript">
        
                       // alert("test");
        
                                            
                                            $(document).ready(function()
                                    		{	
                                    			$("#list").jqGrid(
                                    			{
                                    				url:'Users3.cfc?method=getUsers', //CFC that will return the users
                                    				datatype: 'json', //We specify that the datatype we will be using will be JSON
                                    				colNames:['ID','media id','photographer id' ], //Column Names
                                    				//The Column Model to define the data. Note you can make columns non sortable, specify width, alignment, etc.
                                    				colModel :[
                                    					{name:'id',index:'id', width:75, sorttype:"int",editable:false,searchoptions:{sopt:['eq','lt','le','gt','ge']}},
                                    					{name:'device_uid',index:'device_uid', width:150, sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'photographer_id',index:'photographer_id', width:150, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}} 
                                    				],//searchoptions parameter is used to limit the operators available during search
                                    				pager: $('#pager'), //The div we have specified, tells jqGrid where to put the pager
                                    				rowNum:20, //Number of records we want to show per page
                                    				rowList:[20,30,40,50], //Row List, to allow user to select how many rows they want to see per page
                                    				sortorder: "asc", //Default sort order
                                    				sortname: "ID", //Default sort column
                                    				viewrecords: true, //Shows the nice message on the pager
                                    				imgpath: 'http://coldfusion-ria.com/test/', //Image path for prev/next etc images
                                    				caption: 'Users', //Grid Name
                                    				recordtext: "Record {0} - {1} of {2}",//Pager information to show
                                    				rownumbers: true,//Show row numbers
                                    				rownumWidth: "40",//Width of the row numbers column
                                    				sortable: true,
                                    				height:'auto', //I like auto, so there is no blank space between. Using a fixed height can mean either a scrollbar or a blank space before the pager
                                    				mtype:'POST',	
                                    				toolbar:[true,"top"], //Shows the toolbar at the top. We will use it to display user feedback
                                    				//The JSON reader. This defines what the JSON data returned from the CFC should look like
                                    				jsonReader: {
                                    					root: "ROWS", //our data
                                                        page: "PAGE", //current page
                                                        total: "TOTAL", //total pages
                                                        records:"RECORDS", //total records
                                    					userdata:"USERDATA", //Userdata we will pass back for feedback
                                    					cell: "", //Not Used
                                    					id: "0" //Will default to first column
                                    					},
                                    				editurl:"Users3.cfc?method=addeditUser" //The Add/Edit function call				
                                    				}				
                                    			).navGrid('#pager',
                                    				{
                                    					search:true,searchtitle:"Search",//title set for hover over display
                                    					edit:true,edittitle:"Edit User",
                                    					add:true,addtitle:"Add User",
                                    					del:true,deltitle:"Delete User"
                                    				},
                                    			// Edit Options. savekey parameter will keybind the Enter key to submit.
                                    			{editCaption:"Edit User",edittext:"Edit",closeOnEscape:true, savekey: [true,13],errorTextFormat:commonError,width:"450"
                                    				,reloadAfterSubmit:true,bottominfo:"Fields marked with (*) are required",top:"60",left:"70"}, 
                                    			{addCaption:"Add User",closeOnEscape:true,savekey: [true,13],errorTextFormat:commonError,width:"450"
                                    				,reloadAfterSubmit:true,bottominfo:"Fields marked with (*) are required",top:"60",left:"70"}, //Add Options
                                    			{url:"Users3.cfc?method=delUser",caption:"Delete User",closeOnEscape:true,errorTextFormat:commonError,top:"60",left:"70",
                                    				reloadAfterSubmit:true}, //Delete Options
                                    			 //Search Options. multipleSearch parameter lets it know we are going to use the new advanced search feature
                                    			{errorTextFormat:commonError,Find:"Search",closeOnEscape:true,caption:"Search Users",multipleSearch:true,closeAfterSearch:true}
                                    			);			
                                    		
                                    		//Function will be called when add/edit encounters an error. The returned message is what will be shown to user	
                                    		function commonError(data)
                                    		{			
                                    			return "Error Occured during Operation. Please try again";
                                    		}
                                    			
                                    		}
                                    	);

                                                 
                                                // alert("test2");
        </script>
        
</head>


<body>
    <table id="list" class="scroll"> <div id="pager" class="scroll" style="text-align:center;">
</body>

    
</html>



<!---

trash

  FORT Re-pricing Cross Reference Table  Created: 6/12/2013  by Emiliano Gaytan


PER SPECS:  Admin Changes

1.	Add new menu item, Products -> Maritz Exceptions (visible when in ICE storefronts only)
2.	Display a grid, similar to the product grid, but using a query similar to this:

SELECT itemSKU_vc As ItemSKU, ItemNumber_vc As ItemNumber, itemDescription_vc As ItemDescription, 
	ItemMSRP_mon As MSRP, recommendedSell_mon As Price, 
	ICE_recommendedSell_mon As ICE Sell Price, ICE_active_bol As Active
FROM [maritz].[dbo].maritz_catalog
ORDER BY itemDescription_vc

3.	Make only the last two fields available for editing using CFGridUpdate:
a.	Sell Price (field with 2 decimals)
b.	Active (checkbox)
4.	Add a search box at the top of the grid (see http://www.raymondcamden.com/index.cfm/2010/4/29/Can-you-search-a-CFGRID + comments below)


              MY trash
            
            <link rel="stylesheet" type="text/css" media="screen" href="http://coldfusion-ria.com/test/themes/basic/grid.css" />
            <link rel="stylesheet" type="text/css" media="screen" href="http://coldfusion-ria.com/test/themes/jqModal.css" />
            <script src="http://coldfusion-ria.com/test/jquery.js" type="text/javascript"></script>
            <script src="http://coldfusion-ria.com/test/jquery.jqGrid.js" type="text/javascript"></script>
            <script src="http://coldfusion-ria.com/test/jqModal.js" type="text/javascript"></script>
            <script src="http://exotoolz.com/js/jdgrid/src/jqDnR.js" type="text/javascript"></script>
            
                       					{name:'ItemNumber_vc',index:'ItemNumber_vc', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'itemDescription_vc',index:'itemDescription_vc', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'ItemMSRP_mon',index:'ItemMSRP_mon', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'recommendedSell_mon',index:'recommendedSell_mon', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'ICE_active_bol',index:'ICE_active_bol', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'ICE_itemCost_mon',index:'ICE_itemCost_mon', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}}
										
										
										
										
          
            
            
			<cfdump var="#cgi.SCRIPT_NAME#" label="name script" />
					
			 Get maritz records    
		 	<cfquery name="qryCheck" datasource="800wine"> 
				SELECT maritz_catalog_id_int, itemSKU_vc, ItemNumber_vc, itemDescription_vc,	ItemMSRP_mon, recommendedSell_mon,	ICE_recommendedSell_mon, ICE_active_bol,  ICE_itemCost_mon
					FROM [maritz].[dbo].maritz_catalog
					where maritz_catalog_id_int <  300
					ORDER BY itemDescription_vc
			</cfquery>  


			  <cfdump var="#qryCheck#" label="qryCheck"> 
		 
	 
		
		   more trsh
		
		
		,'ItemMSRP_mon','recommendedSell_mon','ICE_active_bol','ICE_itemCost_mon'
		
		
                                    					{name:'ItemMSRP_mon',index:'ItemMSRP_mon', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'recommendedSell_mon',index:'recommendedSell_mon', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                    						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'ICE_active_bol',index:'ICE_active_bol', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']},
                                           						editable:true,edittype:"text",editoptions:{size:50},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    					{name:'ICE_itemCost_mon',index:'ICE_itemCost_mon', width:100, align:"left",sorttype:"text",searchoptions:{sopt:['eq','bw','ew','cn']}
										
			
			                        				    
            	<cfgridcolumn name="itemSKU_vc" 				header="SKU"   			 		select="no"   	type="number"     		 headerBold = "yes"		  		width="55"									/>
			 	<cfgridcolumn name="ItemNumber_vc" 				header="Number"     			select="no"   	type="string"  			 headerBold = "yes"				width="55" 									/>
				<cfgridcolumn name="itemDescription_vc" 		header="Description"     		select="no"  	type="string"  			 headerBold = "yes"				width="380"  autoExpand = "yes" 							/>
				<cfgridcolumn name="ItemMSRP_mon" 				header="MSRP"     				select="no"   	type="currency"		  	 headerBold = "yes"				width="60"	 headeralign="right"      dataAlign = "right"    	/>
				<cfgridcolumn name="ICE_itemCost_mon" 			header="ICE Cost"     			select="yes"   	type="currency"		  	 headerBold = "yes"				width="60"	 headeralign="right"      dataAlign = "right"    	/>
				<cfgridcolumn name="recommendedSell_mon" 		header="Sell Price"      		select="no"  	type="currency"			 headerBold = "yes"				width="60"	 headeralign="right"   	  dataAlign = "right"       />
				<cfgridcolumn name="ICE_recommendedSell_mon" 	header="ICE Sell Price"  		select="yes"    type="currency" 		 headerBold = "yes"	  			width="85"	 headeralign="right" 	  dataAlign = "right" 	 	/>
				<cfgridcolumn name="ICE_active_bol" 			header="Active"   				select="yes"  	type="Boolean" 			 headerBold = "yes"				width="50"	 headeralign="center"     dataAlign = "center" 		/>   
	    </cfgrid>right
			
			
						,'Active				
		
		
		                                 				    
                                        				<cfset arrUsers[i] = [#maritz_catalog_id_int#,#itemSKU_vc#,#ItemNumber_vc#,#itemDescription_vc#,#ItemMSRP_mon##,
                                        				#ICE_itemCost_mon#
                                        				,#recommendedSell_mon#,#ICE_recommendedSell_mon#,#ICE_active_bol]>



                                    						
                                    						


 
				 
		
--->
 

 