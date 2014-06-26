// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker





    $(document).ready(function(){
    $('#tabs div').hide(); // Hide all divs
    $('#tabs div:first').show(); // Show the first div
    $('#tabs ul li:first').addClass('active'); // Set the class for active state
    $('#tabs ul li a').click(function(){ // When link is clicked
    $('#tabs ul li').removeClass('active'); // Remove active class from links
    $(this).parent().addClass('active'); //Set parent of clicked link class to active
    var currentTab = $(this).attr('href'); // Set currentTab to value of href attribute
    $('#tabs div').hide(); // Hide all divs
    $(currentTab).show(); // Show div with id equal to variable currentTab
    return false;
    });
    });

	var profiles =
	{

		window800:
		{
			height:800,
			width:800,
			status:1
				
		},

		window200:
		{
			height:200,
			width:200,
			status:1,
			resizable:0
		},

		windowCenter:
		{
			height:300,
			width:400,
			center:1
		},

		windowNotNew:
		{
			height:300,
			width:400,
			center:1,
			createnew:0
		},

		windowCallUnload:
		{
			height:300,
			width:400,
			center:1,
			onUnload:unloadcallback
		},

	};

	function unloadcallback(){
		alert("unloaded");
	};


   	$(function()
	{
   		$(".popupwindow").popupwindow(profiles);
   	});


