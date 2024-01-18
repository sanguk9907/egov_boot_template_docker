let member_hei1 = $('#member_register_box1').innerHeight() - 30;
let member_hei2 = $('#member_register_box1').innerHeight() - 51;

if(win_wid >= 1024) {
	$('.common_graph_box').css('height', member_hei1);
		
	if(win_wid >= 1300) {
		$('.common_graph_box').css('height', member_hei2);
	}
}
else {
	$('.common_graph_box').css('height', 'auto');
}

$(window).on('resize', function() {
	let win_wid = $(window).innerWidth();
	let member_hei1 = $('#member_register_box1').innerHeight() - 30;
	let member_hei2 = $('#member_register_box1').innerHeight() - 51;
	
	if(win_wid >= 1024) {
		$('.common_graph_box').css('height', member_hei1);
		
		if(win_wid >= 1300) {
			$('.common_graph_box').css('height', member_hei2);
		}
	}
	else {
		$('.common_graph_box').css('height', 'auto');
	}
})