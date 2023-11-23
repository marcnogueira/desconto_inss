// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require Chart.min

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import Chart from 'chart.js/auto';

document.addEventListener('turbolinks:load', () => {
  var ctx = document.getElementById('proponents_chart').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: JSON.parse(ctx.canvas.dataset.labels),
      datasets: [{
        data: JSON.parse(ctx.canvas.dataset.data),
      }]
    },
  });
})
