$( document ).ready(function() {
  
  translation_keys = (function(){
  
    $('#translations .save').click(function(ev){
      /*replace these*/
      var id                  = 5,
          updated_definition  = "something",
          $save_button        = $(this);
          
      jQuery.ajax({
        url: '/translation_keys/'+ id,
        type: 'PUT',
        data: {
          'id': id,
          'value': updated_definition
        },
        success: function(data,textStatus) {
          alert('updated');
          $save_button.hide();
        }
      });
    });
    
    
    $('#translations .definition').click( function(ev){
      $(this).closest('.translation_pair').find('.save').show();
    });
  
    return {
    
    };
  }());
  
});