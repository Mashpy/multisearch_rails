// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('#wiki-container').hide();
  $('#imdb-container').hide();
  $('#rtomatoes-container').hide();
  $('#wiki-back').hide();
  $('#imdb-back').hide();
  $('#rtomatoes-back').hide();
  
  $("a.wiki").click(function(){
    $('#panel-wiki').hide();
    $('#wiki-container').show();
    $('#wiki-back').show();
  });
  
  $("a.imdb").click(function(){
    $('#panel-imdb').hide();
    $('#imdb-container').show();
    $('#imdb-back').show();
  });
  
  $("a.rtomatoes").click(function(){
    $('#pane-rtomatoes').hide();
    $('#rtomatoes-container').show();
    $('#rtomatoes-back').show();
  });
  
  $("#wiki-back").click(function(){
    $('#panel-wiki').show();
    $('#wiki-container').hide();
    $(this).hide();
  });
  
  $("#imdb-back").click(function(){
    $('#panel-imdb').show();
    $('#imdb-container').hide();
    $(this).hide();
  });
  
  $("#rtomatoes-back").click(function(){
    $('#pane-rtomatoes').show();
    $('#rtomatoes-container').hide();

    $(this).hide();
  });
});

