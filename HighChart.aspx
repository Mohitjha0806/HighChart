<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighChart.aspx.cs" Inherits="HighChart.HighChart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HighChart</title>
    <link href="bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <style>.highcharts-figure,
.highcharts-data-table table {
    min-width: 310px;
    max-width: 800px;
    margin: 1em auto;
}

#container {
    height: 400px;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
    padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}

.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <figure class="highcharts-figure">
                <div id="containerClient" runat="server"></div>
                <p class="highcharts-description">
                    Chart showing product quantities for different dates.
                </p>
            </figure>
        </div>
    </form>
</body>
</html>
