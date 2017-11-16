window.onload = function () {
  let chartsContainer = document.getElementById('chartsContainer')
  var getCharts = new XMLHttpRequest()

  getCharts.onload = function () {
    let charts = Object.values(JSON.parse(this.response))

    charts.forEach(function (chart) {
      let node = document.createElement('div')

      node.innerHTML = '<div class="chart">' +
        (chart.icon ? `<img src="${chart.icon}"/>` : '') +
        '</div>'

      chartsContainer.appendChild(node)
    })
  }

  getCharts.open("GET", "/js/charts.json")
  getCharts.send()
}
