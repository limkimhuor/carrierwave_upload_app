// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// (function() {
$(document).on("turbolinks:load", function() {

  $("#product_image").on("change", function(e) {
    read_URL(this, "avatar");
  })

  $("#product_cover_attributes_content").on("change", function(e) {
    read_URL(this, "cover");
  })

  function read_URL(input, type) {
    var preview = $("img#prev-" + type)[0];
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        preview.src = e.target.result;
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
});
// }());
