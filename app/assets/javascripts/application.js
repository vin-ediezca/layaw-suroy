// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets



$(document).on('turbolinks:load', function() {


  // Get the modal
  var modal = document.getElementById('myModal');

  // Get the image and insert it inside the modal - use its "alt" text as a caption
  var img = $('.myImg');
  var modalImg = $("#img01");
  var captionText = document.getElementById("caption");
  $('.myImg').click(function(){
      modal.style.display = "block";
      var newSrc = this.src;
      modalImg.attr('src', newSrc);
      captionText.innerHTML = this.alt;
  });

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("modal-close")[0];

  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
    modal.style.display = "none";
  }


});



// Unfinished script for progressBar 
/*$(document).ready(function() {
  
  $('#upload-form').on('submit', function() {
    
    event.preventDefault();
    
    var formData = new FormData($('#upload-form')[0]);
    
    $.ajax({
      xhr : function() {
        var xhr = new window.XMLHttpRequest();
        
        xhr.upload.addEventListener('progress', function(e) {
          
          if (e.lengthComputable) {
            
            console.log('Bytes Loaded: ' + e.loaded);
            console.log('Total Size: ' + e.total);
            console.log('percentage Uploaded: ' + (e.loaded / e.total))
            
            var percent = Math.round((e.loaded / e.total) * 100);
            
            $('#progressBar').attr('aria-valuenow', percent).css('width'. percent + '%').text(percent + '%');
            
          }
          
        });
        
        return xhr;
      },
      type : 'POST',
      url : '/tags/' + #{@tag.id} + '/edit',
      data : formData,
      processData : false,
      contentType : false,
      success : function() {
        alert('File uploaded');
      }
    });
    
  });
  
});*/