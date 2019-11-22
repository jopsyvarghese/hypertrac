// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var newOpen = document.getElementById("newOpen").value;
var inProgress = document.getElementById("inProgress").value;
var onHold = document.getElementById("onHold").value;
var redirected = document.getElementById("redirected").value;
var completed = document.getElementById("completed").value;

var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["New/Open", "In Progress", "On Hold", "Redirected", "Completed"],
    datasets: [{
      data: [newOpen, inProgress, onHold, redirected, completed],
      backgroundColor: ['#D85C4C', '#4C60E5', '#44C7D5', '#E59C3A', '#47C95A'],
      hoverBackgroundColor: ['#5B0807', '#5B0807', '#5B0807', '#5B0807', '#5B0807'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
