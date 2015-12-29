$(document).ready(function(){
	// $(".btn-default").click(function(){
	// 	$(this).siblings(".hidden-content").show();

	// });
	$('a[data-toggle="popover"]').click(function(){
		
		$('[data-toggle="popover"]').popover();  
		
	});

	$(document).on('click', '.btn-default',function(){
		
		$(".col-md-4").fadeOut(300);
		
	});
	$(document).on('mouseover', '.btn-primary',function(){
		
		$(this).siblings(".hidden-content").toggle(300);
		
	});


	
});