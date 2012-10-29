i = 0;
j = 0;
var $modelInfoBlock,$modelResourceBlock;
$(document).ready(function(e){
		
		$('#t2').hide();
		$modelResourceBlock = $('#resource0').clone();
		$("#listInfo").on('click','.expanderHead',function(e){
    		var index = e.currentTarget.getAttribute('data-index');
    		// var $ec = $('.expanderContent')[index];
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
		$("#listInfo").on('click','.resourceExpanderHead',function(e){			
			var index = e.currentTarget.getAttribute('data-index');
			var sliderId = '#rec'+index;
			$(sliderId).slideToggle();
			var sign = e.currentTarget.getElementsByClassName('expanderSign')[0].innerHTML;
			if (sign == "+"){
				e.currentTarget.getElementsByClassName('expanderSign')[0].innerHTML = '-';
			}
			else {
				e.currentTarget.getElementsByClassName('expanderSign')[0].innerHTML = '+';
			}
		});
		
		$("#listInfo").on('click','.arb',function(e){
			debugger;
			var index = e.currentTarget.getAttribute('data-index');
			var $block = $('#resource0').clone();
			//var $block = $modelResourceBlock;
			j++;
			//$block.find('.resourceEntry').attr('id','resource'+j);
			$block.find('.resourceExpanderHead').attr('id','reh'+j);
			$block.find('.resourceExpanderHead').attr('data-index',j);
			$block.find('.resourceExpanderContent').attr('id','rec'+j);
			$block.find('.resourceExpanderContent').attr('data-index',j);
			$block.appendTo('#resourceList'+index);
			console.log('The resource index value currently is j = ' + j);
			return false;
		});
		$('.timepicker-default').timepicker();
		$('.date').datepicker();
});
/**
 * Adds another Info block to the Form!
 */
function addInfoBlock(){
	var $block = $('#t1').clone();
	i++;
	$block.find('.expanderHead').attr('id','eh'+i);
	$block.find('.expanderHead').attr('data-index',i);
	$block.find('.expanderContent').attr('id','ec'+i);
	$block.find('.expanderContent').attr('data-index',i);
	j++;
	$block.find('.arb').attr('data-index',j);
	$block.find('#resourceList0').attr('id','resourceList'+j);
	$block.find('#resource0').attr('id','resource'+j);
	$block.find('.resourceExpanderHead').attr('id','reh'+j);
	$block.find('.resourceExpanderHead').attr('data-index',j);
	$block.find('.resourceExpanderContent').attr('id','rec'+j);
	$block.find('.resourceExpanderContent').attr('data-index',j);
	$block.appendTo('#listInfo');
	console.log('The index value  currently is' + i);
}
/**
 * Adds a resource block to the given information block
 * @returns
 */

    