// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


//= require popper
//= require bootstrap-sprockets
//= require Chart.min

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require('jquery')

import Chart from 'chart.js/auto';

document.addEventListener('turbolinks:load', () => {
  var ctx = document.getElementById('proponents_chart')
  if (ctx !== null) {
    var proponent_chart = ctx.getContext('2d');
    new Chart(proponent_chart, {
      type: 'pie',
      data: {
        labels: JSON.parse(proponent_chart.canvas.dataset.labels),
        datasets: [{
          data: JSON.parse(proponent_chart.canvas.dataset.data),
        }]
      },
    });
  };
  $("#proponent_salary").on("change", function() {
    $.ajax({
        url: '/proponents/update_discount',
        data: { salary: $(this).val() },
        dataType: 'script'
    })
  });
})


