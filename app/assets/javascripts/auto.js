  function auto(global_prefix, data_or_url,selectedArray){ 
    var data = null;
    var url = null;
    var to_select =  $("#" + global_prefix + "_to_select");
    var tips = $("#" + global_prefix + "_tips");
    var selected = $("#" + global_prefix + "_selected");

    if(getObjectClass(data_or_url) == "String"){
      url = data_or_url;
    }else{
      data = data_or_url;
    }
    
    initSelectedArray();
    init();

    function init(){
      to_select.keyup(function(){
        var input = to_select.val();
        if(getObjectClass(data_or_url) == "String"){
          $.get(url, {keyword: input}, function(ajax_data){
            data = ajax_data;
            registevent(input);
          });
        }else{
          registevent(input);
        }
     });
    }

    function match(input){
     return data[input] != undefined 
    }

    function select(obj){
     if(!haveSelected(obj.html())){
        selected.append($("<li>" + obj.html() + "<a href=''>X</a></li>")); 
        selectedArray.push(obj.html()); 
        flashInput();
        selected.find("li a").click(function(){
          $(this).parent().remove();
          selectedArray.remove(obj.html());
          flashInput();
          return false;
        });
     }
    }

    function haveSelected(to_select){
      var selected = false;
      for(var i=0;i<selectedArray.length;i++){
        if(selectedArray[i] == to_select ){
           return true;
        }
      }
      return false;
    }

    function ajax_request(url, args){
      $.get(url,args , function(){

      })
    }

    function registevent(input){
      tips.html("");
      if(match(input)){
        for(var j=0; j < data[input].length; j++){
          tips.append($("<li>" + data[input][j] + "</li>"));
        }
        tips.find("li").click(function(){
          select($(this));
          tips.hide();
        });
      }
      tips.show();
    }

    function getObjectClass(obj) {   
      if (obj && obj.constructor && obj.constructor.toString) {    
        var arr = obj.constructor.toString().match(/function\s*(\w+)/);   
        if (arr && arr.length == 2) {   
          return arr[1];   
        }   
      }     
      return undefined;   
    } 

    function initSelectedArray(){
      for(var i=0;i<selectedArray.length;i++){
        selected_element = $("<li>" + selectedArray[i] + "<a href=''>X</a></li>");
        var selected_element_value = selectedArray[i];
        selected_element.find('a').click(function(){
          selectedArray.remove(selected_element_value);
          flashInput();
          $(this).parent().remove();
          return false;
        });
        selected.append(selected_element);
      } 
    }

    function flashInput(){
      inputs = '';
      for(var i=0;i<selectedArray.length;i++){
        inputs += selectedArray[i];
        if(i<selectedArray.length -1){
          inputs += ',';
        }
      }
      //should add by app
      $("#journal_receivers").val(inputs);
    }

    Array.prototype.remove = function(b) { 
      var a = this.indexOf(b); 
      if (a >= 0) { 
      this.splice(a, 1); 
      return true; 
      } 
      return false; 
    }; 

  }