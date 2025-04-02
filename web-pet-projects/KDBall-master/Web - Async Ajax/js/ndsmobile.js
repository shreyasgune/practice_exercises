/* GLOBAL VARIABLES */
var retrieveDataURL = 'http://129.192.151.6:80/welcome/api/call/run/retrieve_nds_data';
var dataDict = {};
var charts = {};
var latlong = new google.maps.LatLng(39.50, -98.35);    //Default Google map latlong
var mapZoom = 3;                                        //Default Google map zoom
var markerDict = {};                                    // The markerDict exists so that a Marker object can be quickly located based on Site latLong information
var markerArray = [];                                   //We need an array with all Markers for MarkerClusterer
var markerCluster;
var infoWindow;                                         //Needs to be global so that we can close previous Info Window before creating a new one, otherwise jQuery Tabs break
var chosenSite = 'WTL01994';                            //Default Site for sitesDetailPage
var region = 'South Central';                           //Default Region for marketPage
var currentDashboardMarket = 'Dallas';
var chosenMarketDateRange = '1';
var marketDetailsType = 'RF_NotReady';
var marketDetailsCarrier = 'carrier1';
var currentReport = 'LTE Summary';
var stateToRegionDict = {
    'US-IL': 'Central', 'US-WI': 'Central', 'US-MI': 'Central', 'US-IN': 'Central', 'US-OH': 'Central', 'US-PA': 'Central',
    'US-AR': 'South Central', 'US-OK': 'South Central', 'US-TX': 'South Central',
    'US-NY': 'North East', 'US-MA': 'North East', 'US-ME': 'North East', 'US-NH': 'North East', 'US-VT': 'North East', 'US-RI': 'North East', 'US-CT': 'North East',
    'US-TN': 'South East', 'US-KY': 'South East', 'US-AL': 'South East', 'US-MS': 'South East', 'US-LA': 'South East', 'US-GA': 'South East', 'US-FL': 'South East', 'US-NC': 'South East', 'US-SC': 'South East',
    'US-CA': 'West', 'US-HI': 'West', 'US-AK': 'West'
};
var regionToListOfMarketsDict = {
    'Central': 'Chicago,Indianpolis,Pittsburgh,Wisconsin',
    'South Central': 'Arkansas,Austin,Corpus Christi,Dallas,Houston,Marble Falls,North Texas,Oklahoma,San Antonio',
    'North East': 'New England,Upstate New York,Virginia',
    'South East': 'Alabama,Atlanta,Georgia,Florida North,Florida South,Louisiana,Louisville,Mississippi,Nashville,Carolinas,Puerto Rico,Tennesse & Kentucky,Knoxville,Memphis',
    'West': 'Alaska,Los Angeles,San Diego,San Francisco,Hawaii'
};

/* GLOBAL SETTINGS */
$(document).ajaxStart(function () {
    $.mobile.loading('show');
});

$(document).ajaxStop(function () {
    $.mobile.loading('hide');
});

$(window).on("orientationchange", function () {
    if ('sitesmap' in charts) {
        latlong = charts['sitesmap'].getCenter();
        mapZoom = charts['sitesmap'].getZoom();
        delete charts['sitesmap'];
    }
    setTimeout(function () {
        $(document).trigger('pagecontainershow');
    }, 300);
});

$(document).on("pagecreate", function (event) {
    $("#panelMenuLeft").panel().enhanceWithin();
    $("#panelMenuRight").panel().enhanceWithin();
    $("[data-role='header']").toolbar({ theme: "a" });
    //var page = event.target.id;
});

$(document).on("pagecontainershow", function () {
    var page = $(':mobile-pagecontainer').pagecontainer('getActivePage')[0].id;

    // Section to always have page content be full height
    var fullHeight = $.mobile.getScreenHeight();
    var headerHeight = $(".ui-header").outerHeight(true);
    var contentHeight = (fullHeight - headerHeight);
    if (page == "marketRegionsPage" || page == "marketPage" || page == "nationalStatusPage") {
        contentHeight = (fullHeight - 2 * headerHeight);
    }
    $('.MainContainer').height(contentHeight);

    // Handlers for each specific page
    switch (page) {
        case 'loginPage':
            $("[data-role='header']").css('visibility', 'hidden');
            $("#panelMenuButton").css('visibility', 'hidden');
            break;
        case 'mainPage':
            $("[data-role='header']").css('visibility', 'visible');
            $("#panelMenuButton").css('visibility', 'hidden');
            $("#pageTitle").html("NDS Smart");
            break;
        case 'sitesMapPage':
            $('#pageTitle').html("AT&T Sites Map (USA)");
            $("[data-role='header']").css('visibility', 'visible');
            $("#panelMenuButton").css('visibility', 'visible');

            // Populate Panel Menu
            $('#menuTitle').siblings().remove();
            var html = '<ul data-role="listview">';
            html += '<li data-icon="recycle"><a href="#" onclick="cycleMapType()">Cycle Map</a></li>';
            html += '<li data-icon="search"><a href="#" onclick="openSearchPopup()">Search Site</a></li></ul>';
            $('#panelMenuLeft .ui-panel-inner').append(html).listview().trigger('create');
            $('#menuTitle').html('Map Options');

            sitesMapPage();
            break;
        case 'siteDetailsPage':
            $('#pageTitle').html(chosenSite + " Site Details");
            $("[data-role='header']").css('visibility', 'visible');
            $("#panelMenuButton").css('visibility', 'visible');

            // Populate Panel Menu
            $('#menuTitle').siblings().remove();
            var html = '<ul data-role="listview">';
            html += '<li data-icon="back"><a href="#" data-rel="back">Back</a></li></ul>';
            $('#panelMenuLeft .ui-panel-inner').append(html).listview().trigger('create');
            $('#menuTitle').html(chosenSite); s
            break;
        case 'marketRegionsPage':
            $('#pageTitle').html("AT&T Regions (USA)");
            $("[data-role='header']").css('visibility', 'visible');
            $("#panelMenuButton").css('visibility', 'hidden');

            marketRegionsPage();

            $("#market_regions_tooltip").show("fast");
            setTimeout(function () {
                $("#market_regions_tooltip").hide("slow");
            }, 5000);
            break;
        case 'marketPage':
            $('#pageTitle').html(currentDashboardMarket);
            $("[data-role='header']").css('visibility', 'visible');
            $("#panelMenuButton").css('visibility', 'visible');

            // Populate Panel Menu
            var listOfMarkets = regionToListOfMarketsDict[region];
            var marketArray = listOfMarkets.split(',');
            marketArray.sort();
            $('#menuTitle').siblings().remove();
            var html = '<ul data-role="listview">';
            for (var i = 0; i < marketArray.length; i++) {
                html += '<li><a href="#" onclick="changeMarket(\'' + marketArray[i] + '\')">' + marketArray[i] + '</a></li>';
            }
            html += '<li data-icon="back"><a href="#" data-rel="back">Back To Map</a></li></ul>';
            $('#panelMenuLeft .ui-panel-inner').append(html).listview().trigger('create');
            $('#pageTitle').html(currentDashboardMarket);
            $('#menuTitle').html(region);

            marketPage(currentDashboardMarket);

            $("#market_tooltip").show("fast");
            setTimeout(function () {
                $("#market_tooltip").hide("slow");
            }, 5000);
            break;
        case 'marketDetailsPage':
            $('#pageTitle').html(currentDashboardMarket + " Details");
            $("[data-role='header']").css('visibility', 'visible');
            $("#panelMenuButton").css('visibility', 'visible');

            // Populate Panel Menu
            $('#menuTitle').siblings().remove();
            var html = '<ul data-role="listview">';
            html += '<li><a href="#" onclick="changeMarketTable(\'' + currentDashboardMarket + '\', \'RF_NotReady\', \'' + marketDetailsCarrier + '\')">RF Not Ready</a></li>';
            html += '<li><a href="#" onclick="changeMarketTable(\'' + currentDashboardMarket + '\', \'RSSI\', \'' + marketDetailsCarrier + '\')">RSSI</a></li>';
            html += '<li><a href="#" onclick="changeMarketTable(\'' + currentDashboardMarket + '\', \'RBS\', \'' + marketDetailsCarrier + '\')">Alarms</a></li>';
            html += '<li><a href="#" onclick="changeMarketTable(\'' + currentDashboardMarket + '\', \'VSWR\', \'' + marketDetailsCarrier + '\')">VSWR</a></li>';
            html += '<li><a href="#" onclick="changeMarketTable(\'' + currentDashboardMarket + '\', \'PLMN\', \'' + marketDetailsCarrier + '\')">PLMN</a></li>';
            html += '<li data-icon="back"><a href="#" data-rel="back">Back</a></li></ul>';
            $('#panelMenuLeft .ui-panel-inner').append(html).listview().trigger('create');
            $('#menuTitle').html(currentDashboardMarket);

            marketDetailsPage();
            break;
        case 'nationalStatusPage':
            $('#pageTitle').html("AT&T National Status (USA)");
            $("[data-role='header']").css('visibility', 'visible');
            $("#panelMenuButton").css('visibility', 'visible');

            // Populate Panel Menu
            $('#menuTitle').siblings().remove();
            var html = '<ul data-role="listview">';
            html += '<li><a href="#" onclick="changeNationalView(\'region\')">Region View</a></li>';
            html += '<li><a href="#" onclick="changeNationalView(\'market\')">Market View</a></li></ul>';
            $('#panelMenuLeft .ui-panel-inner').append(html).listview().trigger('create');
            $('#menuTitle').html('Views');

            //draw map
            nationalStatusPage();
            break;
        case 'reportsPage':
            $('#pageTitle').html(currentReport + " Report");
            $("[data-role='header']").css('visibility', 'visible');
            $("#panelMenuButton").css('visibility', 'visible');

            // Populate Panel Menu
            $('#menuTitle').siblings().remove();
            var html = '<ul data-role="listview">';
            html += '<li><a href="#" onclick="drawReportTable(\'LTE Summary\')">LTE Summary</a></li>';
            html += '<li><a href="#" onclick="drawReportTable(\'LTE Alarms\')">Alarms</a></li>';
            html += '<li><a href="#" onclick="drawReportTable(\'LTE RSSI\')">RSSI</a></li>';
            html += '<li><a href="#" onclick="drawReportTable(\'LTE VSWR\')">VSWR</a></li></ul>';
            $('#panelMenuLeft .ui-panel-inner').append(html).listview().trigger('create');
            $('#menuTitle').html("Reports");

            reportsPage();
            break;
    }
});

function refreshData() {
    //---- Specific handler for google map
    if (charts['sitesmap']) {
        latlong = charts['sitesmap'].getCenter();
        mapZoom = charts['sitesmap'].getZoom();
    }
    //------------------------------------
    dataDict = {};
    charts = {};
    $("#panelMenuRight").panel("close");

    setTimeout(function () {
        $(document).trigger('pagecontainershow');
    }, 300);
}

function createDetailsTable(dataArray) {
    var table = new google.visualization.DataTable();
    var columnArray = dataArray[0];
    for (var i = 0; i < columnArray.length; i++) {
        table.addColumn('string', columnArray[i]);
    }
    var rowsArray = dataArray.slice(1, dataArray.length);
    if (rowsArray.length > 0) {
        for (var i = 0; i < rowsArray.length; i++) {
            for (var j = 0; j < rowsArray[i].length; j++) {
                if (typeof rowsArray[i][j] != 'string')
                    rowsArray[i][j] = '' + rowsArray[i][j];
            }
        }
        table.addRows(rowsArray);
    }
    return table;
}



/* LOGIN PAGE */
function checkLogin() {
    $('#pageTitle').html("AT&T National Health (USA)");
    $(":mobile-pagecontainer").pagecontainer("change", "#mainPage", {
        transition: "flow"
    });
}

function logOut() {
    dataDict = {};
    charts = {};
    latlong = new google.maps.LatLng(39.50, -98.35);
    mapZoom = 3;
    $(":mobile-pagecontainer").pagecontainer("change", "#loginPage", {
        transition: "flow",
        reverse: true
    });
}



/* MAIN PAGE */
function cardClicked(targetPage) {
    $(":mobile-pagecontainer").pagecontainer("change", "#" + targetPage, {
        transition: "pop"
    });
}



/* SITES MAP PAGE */
function sitesMapPage() {
    if (!('sites' in dataDict)) {
        getSitesMapPageData();
    }
    else {
        drawSitesMap();
    }
}

function getSitesMapPageData() {
    $.ajax({
        url: retrieveDataURL,
        dataType: 'json',
        data: { market: "map" },
        success: function (ajax_data) {
            dataDict['sites'] = ajax_data;
            drawSitesMap();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Error: Sites could not be loaded!");
        }
    });
}

function drawSitesMap() {
    if (!('sitesmap' in charts)) {
        markerDict = {};
        markerArray = [];

        var mapOptions = {
            zoom: mapZoom,
            center: latlong,
            disableDefaultUI: true
        };

        charts['sitesmap'] = new google.maps.Map(document.getElementById('sites_map_container'), mapOptions);

        for (var i = 0; i < dataDict['sites'].length; i++) {
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(dataDict['sites'][i][1], dataDict['sites'][i][2]),
                map: charts['sitesmap'],
                title: dataDict['sites'][i][0],
                icon: "images/site-icon.png"
            });
            marker.index = i; //This is needed so that we can find the row in dataDict['sites'] that represents any given Marker
            markerArray.push(marker);
            markerDict[(marker.getPosition()).toString()] = marker;
            google.maps.event.addListener(marker, 'click', markerListenerFunction);
        }
        markerCluster = new MarkerClusterer(charts['sitesmap'], markerArray);
    }
}

function openSearchPopup() {
    // Marker infowindow blocks new popups
    if (infoWindow) {
        infoWindow.close();
        infoWindow = false;
    }
    $("#panelMenuLeft").panel("close");
    setTimeout(function () { //New popup needs to wait until the last popup widget is destroyed fully
        $("#searchPopup").popup("open", { "positionTo": "window" });
    }, 300);
}

function markerListenerFunction() {
    if (infoWindow) {
        infoWindow.close();
    }

    var index = this.index;
    //Creates HTML code for the InfoWindow. This window includes divs: tabs, tabs-1, tabs-2, tabs-3.
    var htmlCode = '<div><p><strong>Site: </strong>' + dataDict['sites'][index][0] + '</p><p><strong>Address: </strong>' + dataDict['sites'][index][3] + '</p><p><strong>Site Details: </strong><a href="#" onclick="goToSiteDetailsPage(\'' + dataDict['sites'][index][0] + '\')">details</a></p></div>';
    infoWindow = new google.maps.InfoWindow({
        content: htmlCode
    });
    infoWindow.open(charts['sitesmap'], markerArray[index]);
}

function findMarker() {
    $("#searchPopup").popup("close");
    var found = false;
    var value = $("#sitenameInput").val().toUpperCase().trim();
    for (var i = 0; i < dataDict['sites'].length; i++) {
        if (value == dataDict['sites'][i][0]) {
            var latLng = new google.maps.LatLng(dataDict['sites'][i][1], dataDict['sites'][i][2]);
            charts['sitesmap'].panTo(latLng);//GOTCHA! panTo is smoother than setCenter
            charts['sitesmap'].setZoom(15);
            var tempMarker = markerDict[latLng.toString()];
            google.maps.event.trigger(tempMarker, 'click');//This will trigger the markerListenerFunction causing the infoWindow for that Marker to open
            return;
        }
    }
    if (!found) {
        alert('Site not found!');
    }
}

function goToSiteDetailsPage(sitename) {
    chosenSite = sitename;
    $(":mobile-pagecontainer").pagecontainer("change", "#siteDetailsPage", {
        transition: "pop"
    });
}

function cycleMapType() {
    var currentType = charts['sitesmap'].getMapTypeId();
    if (currentType == 'roadmap')
        charts['sitesmap'].setMapTypeId('satellite');
    if (currentType == 'satellite')
        charts['sitesmap'].setMapTypeId('hybrid');
    if (currentType == 'hybrid')
        charts['sitesmap'].setMapTypeId('terrain');
    if (currentType == 'terrain')
        charts['sitesmap'].setMapTypeId('roadmap');
}



/* SITE DETAILS PAGE */



/* MARKET REGIONS PAGE */
function marketRegionsPage() {
    drawRegionsMap();
}

function drawRegionsMap() {
    var data = google.visualization.arrayToDataTable([
            ['State', 'Region-Markets'],
            ['US-IL', 1], ['US-IN', 1], ['US-WI', 1], ['US-OH', 1], ['US-PA', 1], ['US-MI', 1],                                             //North Central Color Code 1
            ['US-NY', 2], ['US-MA', 2], ['US-ME', 2], ['US-NH', 2], ['US-VT', 2], ['US-RI', 2], ['US-CT', 2], ['US-VA', 2], ['US-WV', 2],   //North East Color Code 2
            ['US-AR', 3], ['US-TX', 3], ['US-OK', 3],                                                                                       //South Central Color Code 3
            ['US-TN', 4], ['US-KY', 4], ['US-AL', 4], ['US-MS', 4], ['US-LA', 4], ['US-GA', 4], ['US-FL', 4], ['US-NC', 4], ['US-SC', 4],   //South East Color Code 4
            ['US-CA', 5], ['US-HI', 5], ['US-AK', 5],                                                                                       //West Color Code 5
    ]);
    var options =
    {
        region: "US",
        resolution: "provinces",
        colorAxis: { colors: ['darkgreen', 'orange', 'red', 'blue', 'purple'] }, //This will be set to display the health of the market
        backgroundColor: { fill: 'transparent' },
        legend: 'none'
    };

    if (!('regions' in charts)) {
        charts['regions'] = new google.visualization.GeoChart(document.getElementById('market_regions_container'));
    }

    charts['regions'].draw(data, options);

    //events trigger
    google.visualization.events.removeAllListeners(charts['regions']);
    google.visualization.events.addOneTimeListener(charts['regions'], 'select', function () {
        var selectedItem = charts['regions'].getSelection()[0];
        if (selectedItem) {
            var StateID = data.getValue(selectedItem.row, 0);
            region = stateToRegionDict[StateID];
            var listOfMarkets = regionToListOfMarketsDict[region];
            var marketArray = listOfMarkets.split(',');
            marketArray.sort();
            currentDashboardMarket = marketArray[0];

            $(":mobile-pagecontainer").pagecontainer("change", "#marketPage", {
                transition: "pop"
            });
        }
    });
}



/* MARKET PAGE */
function marketPage(market) {
    if (!('marketMetrics' in dataDict) || !(market in dataDict['marketMetrics'])) {
        getMarketPageData(market);
    }
    else {
        drawMarketChart(market);
    }
}

function getMarketPageData(market) {
    $.ajax({
        url: retrieveDataURL,
        dataType: 'json',
        data: { market: market },
        success: function (ajax_data) {
            if (!('marketMetrics' in dataDict)) {
                dataDict['marketMetrics'] = {};
            }
            dataDict['marketMetrics'][market] = {};

            dataDict['marketMetrics'][market]['ndsmetric_day'] = google.visualization.arrayToDataTable([
                    ['Metric', '1C', '2C'],
                    ['Total', ajax_data['lteMarketDataDay'][0][2], ajax_data['lteMarketDataDay'][1][2]],
                    ['RF Not Ready', ajax_data['lteMarketDataDay'][0][0], ajax_data['lteMarketDataDay'][1][0]],
                    ['RSSI NOK', ajax_data['lteMarketDataDay'][0][3], ajax_data['lteMarketDataDay'][1][3]],
                    ['RBS Alarms NOK', ajax_data['lteMarketDataDay'][0][4], ajax_data['lteMarketDataDay'][1][4]],
                    ['VSWR NOK', ajax_data['lteMarketDataDay'][0][5], ajax_data['lteMarketDataDay'][1][5]],
                    ['PLMN NOK', ajax_data['lteMarketDataDay'][0][6], ajax_data['lteMarketDataDay'][1][6]],
                    ['Baseline NOK', ajax_data['lteMarketDataDay'][0][7], ajax_data['lteMarketDataDay'][1][7]]
            ]);

            dataDict['marketMetrics'][market]['PLMN'] = {};
            dataDict['marketMetrics'][market]['PLMN']['carrier1'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['PLMN']['carrier1']);
            dataDict['marketMetrics'][market]['PLMN']['carrier2'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['PLMN']['carrier2']);
            dataDict['marketMetrics'][market]['RBS'] = {};
            dataDict['marketMetrics'][market]['RBS']['carrier1'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['RBS']['carrier1']);
            dataDict['marketMetrics'][market]['RBS']['carrier2'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['RBS']['carrier2']);
            dataDict['marketMetrics'][market]['RF_NotReady'] = {};
            dataDict['marketMetrics'][market]['RF_NotReady']['carrier1'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['RF_NotReady']['carrier1']);
            dataDict['marketMetrics'][market]['RF_NotReady']['carrier2'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['RF_NotReady']['carrier2']);
            dataDict['marketMetrics'][market]['RSSI'] = {};
            dataDict['marketMetrics'][market]['RSSI']['carrier1'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['RSSI']['carrier1']);
            dataDict['marketMetrics'][market]['RSSI']['carrier2'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['RSSI']['carrier2']);
            dataDict['marketMetrics'][market]['VSWR'] = {};
            dataDict['marketMetrics'][market]['VSWR']['carrier1'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['VSWR']['carrier1']);
            dataDict['marketMetrics'][market]['VSWR']['carrier2'] = createDetailsTable(ajax_data['lteMarketDataDay'][2]['VSWR']['carrier2']);

            dataDict['marketMetrics'][market]['ndsmetric_week'] = google.visualization.arrayToDataTable([
                    ['Metric', '1C', '2C'],
                    ['Total', ajax_data['lteMarketDataWeek'][0][2], ajax_data['lteMarketDataWeek'][1][2]],
                    ['RF Not Ready', ajax_data['lteMarketDataWeek'][0][0], ajax_data['lteMarketDataWeek'][1][0]],
                    ['RSSI NOK', ajax_data['lteMarketDataWeek'][0][3], ajax_data['lteMarketDataWeek'][1][3]],
                    ['RBS Alarms NOK', ajax_data['lteMarketDataWeek'][0][4], ajax_data['lteMarketDataWeek'][1][4]],
                    ['VSWR NOK', ajax_data['lteMarketDataWeek'][0][5], ajax_data['lteMarketDataWeek'][1][5]],
                    ['PLMN NOK', ajax_data['lteMarketDataWeek'][0][6], ajax_data['lteMarketDataWeek'][1][6]],
                    ['Baseline NOK', ajax_data['lteMarketDataWeek'][0][7], ajax_data['lteMarketDataWeek'][1][7]]
            ]);
            dataDict['marketMetrics'][market]['ndsmetric_month'] = google.visualization.arrayToDataTable([
                    ['Metric', '1C', '2C'],
                    ['Total', ajax_data['lteMarketDataMonth'][0][2], ajax_data['lteMarketDataMonth'][1][2]],
                    ['RF Not Ready', ajax_data['lteMarketDataMonth'][0][0], ajax_data['lteMarketDataMonth'][1][0]],
                    ['RSSI NOK', ajax_data['lteMarketDataMonth'][0][3], ajax_data['lteMarketDataMonth'][1][3]],
                    ['RBS Alarms NOK', ajax_data['lteMarketDataMonth'][0][4], ajax_data['lteMarketDataMonth'][1][4]],
                    ['VSWR NOK', ajax_data['lteMarketDataMonth'][0][5], ajax_data['lteMarketDataMonth'][1][5]],
                    ['PLMN NOK', ajax_data['lteMarketDataMonth'][0][6], ajax_data['lteMarketDataMonth'][1][6]],
                    ['Baseline NOK', ajax_data['lteMarketDataMonth'][0][7], ajax_data['lteMarketDataMonth'][1][7]]
            ]);
            dataDict['marketMetrics'][market]['ndsmetric_quarter'] = google.visualization.arrayToDataTable([
                    ['Metric', '1C', '2C'],
                    ['Total', ajax_data['lteMarketDataQuarter'][0][2], ajax_data['lteMarketDataQuarter'][1][2]],
                    ['RF Not Ready', ajax_data['lteMarketDataQuarter'][0][0], ajax_data['lteMarketDataQuarter'][1][0]],
                    ['RSSI NOK', ajax_data['lteMarketDataQuarter'][0][3], ajax_data['lteMarketDataQuarter'][1][3]],
                    ['RBS Alarms NOK', ajax_data['lteMarketDataQuarter'][0][4], ajax_data['lteMarketDataQuarter'][1][4]],
                    ['VSWR NOK', ajax_data['lteMarketDataQuarter'][0][5], ajax_data['lteMarketDataQuarter'][1][5]],
                    ['PLMN NOK', ajax_data['lteMarketDataQuarter'][0][6], ajax_data['lteMarketDataQuarter'][1][6]],
                    ['Baseline NOK', ajax_data['lteMarketDataQuarter'][0][7], ajax_data['lteMarketDataQuarter'][1][7]]
            ]);
            drawMarketChart(market);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Error: Market could not be loaded!");
        }
    });
}

function drawMarketChart(market) {
    if (!('market' in charts)) {
        charts['market'] = new google.visualization.ColumnChart(document.getElementById('market_container'));
    }

    var options = {
        title: 'NDS Metrics : Yesterday',
        backgroundColor: { fill: 'transparent' },
        colors: ['#08C', 'aquamarine'],
        dataOpacity: 0.7,
        tooltip: { trigger: 'selection' },
        animation: {
            duration: 500,
            easing: 'out'
        }
    };
    
    google.visualization.events.removeAllListeners(charts['market']);

    switch (chosenMarketDateRange) {
        case '1':
            var data = dataDict['marketMetrics'][market]['ndsmetric_day'];
            charts['market'].draw(data, options);

            //events trigger
            google.visualization.events.addListener(charts['market'], 'select', function () {
                var selectedItem = charts['market'].getSelection()[0];
                switch (selectedItem.row) {
                    case 0:
                        //Total
                        return;
                        break;
                    case 1:
                        //RF Not Ready
                        marketDetailsType = 'RF_NotReady';
                        if (selectedItem.column == 1)
                            marketDetailsCarrier = 'carrier1';
                        else
                            marketDetailsCarrier = 'carrier2';
                        break;
                    case 2:
                        //RSSI NOK
                        marketDetailsType = 'RSSI';
                        if (selectedItem.column == 1)
                            marketDetailsCarrier = 'carrier1';
                        else
                            marketDetailsCarrier = 'carrier2';
                        break;
                    case 3:
                        //RBS NOK
                        marketDetailsType = 'RBS';
                        if (selectedItem.column == 1)
                            marketDetailsCarrier = 'carrier1';
                        else
                            marketDetailsCarrier = 'carrier2';
                        break;
                    case 4:
                        //VSWR NOK
                        marketDetailsType = 'VSWR';
                        if (selectedItem.column == 1)
                            marketDetailsCarrier = 'carrier1';
                        else
                            marketDetailsCarrier = 'carrier2';
                        break;
                    case 5:
                        //PLMN NOK
                        marketDetailsType = 'PLMN';
                        if (selectedItem.column == 1)
                            marketDetailsCarrier = 'carrier1';
                        else
                            marketDetailsCarrier = 'carrier2';
                        break;
                    case 6:
                        // Baseline NOK
                        break;
                }
                $(":mobile-pagecontainer").pagecontainer("change", "#marketDetailsPage", {
                    transition: "pop"
                });
            });
            break;
        case '7':
            var data = dataDict['marketMetrics'][market]['ndsmetric_week'];
            options['title'] = 'NDS Metrics : Past 7 days';
            charts['market'].draw(data, options);
            break;

        case '30':
            var data = dataDict['marketMetrics'][market]['ndsmetric_month'];
            options['title'] = 'NDS Metrics : Past 30 days';
            charts['market'].draw(data, options);
            break;

        case '120':
            var data = dataDict['marketMetrics'][market]['ndsmetric_quarter'];
            options['title'] = 'NDS Metrics : Past 120 days';
            charts['market'].draw(data, options);
            break;
    }
}

function changeMarket(market) {
    $("#panelMenuLeft").panel("close");
    currentDashboardMarket = market;
    $('#pageTitle').html(currentDashboardMarket);
    marketPage(market);
}

function marketDateChanged(date) {
    chosenMarketDateRange = date;
    marketPage(currentDashboardMarket);
}



/* MARKET DETAILS PAGE */
function marketDetailsPage() {
    drawMarketTable(currentDashboardMarket, marketDetailsType, marketDetailsCarrier);
}

function changeMarketTable(market, type, carrier) {
    $("#panelMenuLeft").panel("close");
    drawMarketTable(market, type, carrier)
}

function drawMarketTable(market, type, carrier) {
    if (!('market_details' in charts)) {
        charts['market_details'] = new google.visualization.Table(document.getElementById('market_details_container'));
    }
    var data = dataDict['marketMetrics'][market][type][carrier];

    var options = {
        page: 'enable',
        pageSize: 50,
        pagingSymbol: { prev: 'prev', next: 'next' },
        pagingButtonsConfiguration: 'auto'
    };

    charts['market_details'].draw(data, options);

    //Redraw table to fit as may rows as possible without y-overflow
    setTimeout(function () {
        var headerHeight = $("#market_details_container tr").outerHeight(true);
        var avgCellHeight = 0;
        var numTD = 0;
        $("#market_details_container td").each(function () {
            var $this = $(this);
            var height = $this.outerHeight(true);
            avgCellHeight += height;
            numTD++;
        });
        avgCellHeight = Math.floor(avgCellHeight / numTD);
        var chartHeight = $("#market_details_container").height();
        var pageDivHeight = $("#market_details_container .google-visualization-table-div-page").outerHeight(true);
        var tableTotalHeight = chartHeight - pageDivHeight;
        var dynamicPageSize = 0;
        var tableSize = headerHeight;
        while (tableSize < tableTotalHeight) {
            tableSize += avgCellHeight;
            dynamicPageSize++;
        }
        options['pageSize'] = dynamicPageSize - 2;
        charts['market_details'].draw(data, options);
    }, 300);
}



/* NATIONAL STATUS PAGE */
function nationalStatusPage() {
    if (!('national' in dataDict)) {
        getNationalStatusPageData();
    }
}

function getNationalStatusPageData() {
    /* Reference :: (with the ISO_3166-2:US Code 
                            Central 
                                Illinois ( US-IL) - Wisconsin (US-WI)
                                Michigan(US-MI) - Indiana(US-IN)
                                Ohio (US-OH) - Western Pennsylvania (US-PA)
                                
                            South Central	
                                Arkansas(US-AR) - Oklahoma (US-OK)
                                North Texas (US-TX)
                                South Texas (US-TX)
                            
                            North East 
                                New York / Upstate NY (US-NY)
                                New England (US-MA , US-ME , US-NH , US-VT , US-RI , US-CT)
                                Virginia (US-VA) / West Virginia (US-WV)
    
                            Southeast 
                                Tennessee (US-TN) / Kentucky (US-KY)
                                Alabama (US-AL) / Mississippi(US-MS) / Louisiana (US-LA)
                                Georgia (US-GA)
                                North Florida (US-FL)
                                South Florida (US-FL)
                                North Carolina (US-NC) / South Carolina (US-SC)
                                    
                            West
                                San Diego (US-CA) / Hawaii (US-HI) / Alaska (US-AK)
                                Los Angeles (US-CA)
                                San Francisco (US-CA) / Sacramento (US-CA)
    */
    $.ajax({
        url: retrieveDataURL,
        dataType: 'json',
        data: { market: "region" },
        success: function (ajax_data) {
            dataDict['national'] = google.visualization.arrayToDataTable([
                ['State', 'RF Not Ready Sites'],

                ['US-IL', ajax_data['central']], ['US-IN', ajax_data['central']], ['US-WI', ajax_data['central']], ['US-OH', ajax_data['central']], ['US-PA', ajax_data['central']], ['US-MI', ajax_data['central']],    //North Central Color Code 1
                ['US-NY', ajax_data['north_east']], ['US-MA', ajax_data['north_east']], ['US-ME', ajax_data['north_east']], ['US-NH', ajax_data['north_east']], ['US-VT', ajax_data['north_east']], ['US-RI', ajax_data['north_east']], ['US-CT', ajax_data['north_east']], ['US-VA', ajax_data['north_east']], ['US-WV', ajax_data['north_east']], // North East Color Code 2

                ['US-AR', ajax_data['south_central']], ['US-TX', ajax_data['south_central']], ['US-OK', ajax_data['south_central']],   //South Central Color Code 3
                ['US-TN', ajax_data['south_east']], ['US-KY', ajax_data['south_east']], ['US-AL', ajax_data['south_east']], ['US-MS', ajax_data['south_east']], ['US-LA', ajax_data['south_east']], ['US-GA', ajax_data['south_east']], ['US-FL', ajax_data['south_east']], ['US-NC', ajax_data['south_east']], ['US-SC', ajax_data['south_east']], // South East Color Code 4

                ['US-CA', ajax_data['west']], ['US-HI', ajax_data['west']], ['US-AK', ajax_data['west']], //West Color Code 5
            ]);
            drawNationalView('region');
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Error: National data could not be loaded!");
        }
    });
}

function drawNationalView(type) {
    var data = dataDict['national'];

    var options =
    {
        region: "US",
        resolution: "provinces",
        colorAxis: { colors: ['green', 'yellow', 'red'] }, //This will be set to display the health of the market
        backgroundColor: { fill: 'transparent' },
        tooltip: { trigger: 'selection' }
    };

    if (!('national' in charts)) {
        charts['national'] = new google.visualization.GeoChart(document.getElementById('national_status_container'));
    }

    charts['national'].draw(data, options);
}

function changeNationalView(type) {
    $("#panelMenuLeft").panel("close");
    drawNationalView(type);
}



/* REPORTS PAGE */
function reportsPage() {
    if (!('reports' in dataDict)) {
        getReportsPageData();
    }
    else {
        drawReportTable(currentReport);
    }
}

function getReportsPageData() {
    $.ajax({
        url: retrieveDataURL,
        dataType: 'json',
        data: { market: 'reports' },
        success: function (ajax_data) {
            dataDict['reports'] = {};
            dataDict['reports']['LTE Summary'] = createDetailsTable(ajax_data['lteSummaryTable']);
            dataDict['reports']['LTE Alarms'] = createDetailsTable(ajax_data['lteAlarmsTable']);
            dataDict['reports']['LTE RSSI'] = createDetailsTable(ajax_data['lteRSSITable']);
            dataDict['reports']['LTE VSWR'] = createDetailsTable(ajax_data['lteVSWRTable']);
            drawReportTable(currentReport);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Error: Report data could not be loaded!");
        }
    });
}

function drawReportTable(report_name) {
    $("#panelMenuLeft").panel("close");
    $('#pageTitle').html(report_name + " Report");
    currentReport = report_name;
    var data = dataDict['reports'][report_name];

    if (!('reports' in charts)) {
        charts['reports'] = new google.visualization.Table(document.getElementById('reports_container'));
    }

    var options = {
        page: 'enable',
        pageSize: 50,
        pagingSymbol: { prev: 'prev', next: 'next' },
        pagingButtonsConfiguration: 'auto'
    };

    charts['reports'].draw(data, options);

    //Redraw table to fit as may rows as possible without y-overflow
    setTimeout(function () {
        var headerHeight = $("#reports_container tr").outerHeight(true);
        var avgCellHeight = 0;
        var numTD = 0;
        $("#reports_container td").each(function () {
            var $this = $(this);
            var height = $this.outerHeight(true);
            avgCellHeight += height;
            numTD++;
        });
        avgCellHeight = Math.floor(avgCellHeight / numTD);
        var chartHeight = $("#reports_container").height();
        var pageDivHeight = $("#reports_container .google-visualization-table-div-page").outerHeight(true);
        var tableTotalHeight = chartHeight - pageDivHeight;
        var dynamicPageSize = 0;
        var tableSize = headerHeight;
        while (tableSize < tableTotalHeight) {
            tableSize += avgCellHeight;
            dynamicPageSize++;
        }
        options['pageSize'] = dynamicPageSize - 2;
        charts['reports'].draw(data, options);
    }, 300);
}