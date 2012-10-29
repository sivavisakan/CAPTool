i = 1;
$(document).ready(function(e){
		$("#listInfo").on('click','.expanderHead',function(e){
    		var index = e.currentTarget.getAttribute('data-index');
    		debugger;
    		//var $ec = $('.expanderContent')[index];
    		var sliderId = '#ec'+index;
    		$(sliderId).slideToggle();
    		var sign = e.currentTarget.getElementsByClassName('expanderSign')[0].innerHTML;
    		if (sign == "+"){
    			e.currentTarget.getElementsByClassName('expanderSign')[0].innerHTML = '-';
    		}
    		else {
    			e.currentTarget.getElementsByClassName('expanderSign')[0].innerHTML = '+';
    		}
    	});
    });
    
    $('.timepicker-default').timepicker();
    $('.date').datepicker();
//    function addTable(){
//		$('#t1').clone().appendTo('#listInfo');
//}
    function addTable(){
    	debugger;
    	var $block = $('#t1').clone();
    	debugger;
    	i++;
    	$block.find('.expanderHead').attr('id','eh'+i);
    	$block.find('.expanderHead').attr('data-index',i);
    	$block.find('.expanderContent').attr('id','ec'+i);
    	$block.find('.expanderContent').attr('data-index',i);
    	$block.appendTo('#listInfo');
    	console.log('The index value currently is' + i);
    }
    