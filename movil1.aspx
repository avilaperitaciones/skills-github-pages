<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><title>
	Página principal
</title><link href="Styles/Site.css" rel="stylesheet" type="text/css">
    </head>
<body>
    <form method="post" action="./PeritacionDigitalA.aspx?e=48259476" id="ctl01">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTEwMDUyNjYzMjhkZLdHd4NO9d0WQrkeuuCjp7iAzVAAds290mhs/24/h8Vy">
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="1B8946B0">
</div>
    <div class="page">
        <div class="header">


            <div class="clear hideSkiplink">
            </div>
        </div>
        <div class="main">
            
<script type="text/javascript" src="../../www.ced-pericial.es/CR/Scripts/jquery-1.12.3.min.js"></script> 
<script type="text/javascript" src="../../www.ced-pericial.es/CR/Scripts/mootools-core-1.4.5-nocompat.js"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="../../www.ced-pericial.es/cr/Scripts/gps.js"></script>
<script type="text/javascript">



    function foto() {

        if (bandera == 1) {
            bandera = 0;
            img_canvas();

            var image = document.getElementById("img").toDataURL("image/jpeg", 0.92);
            var imageadaptada = image.replace('data:image/jpeg;base64,', '');

            sendDataAjaxVideo(imageadaptada);

            document.getElementById("img").value = "";
            Dispose = true;

        }


    }


    function EnvioCoordenadas(Coordenadas) {
        var actionData = "{'Coordenadas': '" + Coordenadas + "'}";
        $.ajax(
            {
                url: "Default.aspx/GetCoordenadas",
                data: actionData,
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8"
            });
    };

    function EnvioCoordenadasPostal(Postal) {
        var actionData = "{'Postal': '" + Postal + "'}";
        $.ajax(
            {
                url: "Default.aspx/GetCoordenadasPostal",
                data: actionData,
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8"
            });
    };

    function geoFindMe() {
        var content = document.getElementById("out");

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (objPosition) {
                var lon = objPosition.coords.longitude;
                var lat = objPosition.coords.latitude;

                informacion = lon.toString() + "  " + lat.toString();

                EnvioCoordenadas(informacion);
                postal(lon, lat);

            }, function (objPositionError) {
                switch (objPositionError.code) {
                    case objPositionError.PERMISSION_DENIED:

                        informacion = "No se ha permitido el acceso a la posición del usuario";
                        break;
                    case objPositionError.POSITION_UNAVAILABLE:

                        informacion = "No se ha podido acceder a la información de su posición";
                        break;
                    case objPositionError.TIMEOUT:

                        informacion = "El servicio ha tardado demasiado tiempo en responder";
                        break;
                    default:

                        informacion = "Error desconocido";
                }
            }, {
                maximumAge: 75000,
                timeout: 15000
            });
        }
        else {

            informacion = "Su navegador no soporta la API de geolocalización";
        }
    }

    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        return false;
    }

    function sendDataAjaxVideo(nombre) {

        var exp = getQueryVariable("e"); //10digitos     
        nombre = nombre.toString() + "@" + exp.toString();
        var actionData = "{'nombre': '" + nombre + "'}";

        $.ajax(
            {
                url: "Default.aspx/GetDataAjaxVideo",
                async: false,
                data: actionData,
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8"
            }).done(bandera = 1);
        Dispose = true;
    };


    function EstablecerUso(nombre) {

        var actionData = "{'nombre': '" + nombre + "'}";

        $.ajax(
            {
                url: "Default.aspx/EstablecerUso",
                async: false,
                data: actionData,
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8"
            }).done(bandera = 1);
        Dispose = true;
    };


    jQuery(document).ready(function () {
        $('#BModificada').click(function () {
            var image = document.getElementById("img");

            isUploadSupported();


        });
    });


    function img_canvas() {

        var canvas = document.querySelector('#img');
        var MAX_WIDTH = 640;
        var MAX_HEIGHT = 480;

        var width = myVideo.videoWidth;
        var height = myVideo.videoHeight;
        //if (width!=0){ alert(width);}
        if (width > height) {
            if (width > MAX_WIDTH) {
                height *= MAX_WIDTH / width;
                width = MAX_WIDTH;
            }
        } else {
            if (height > MAX_HEIGHT) {
                width *= MAX_HEIGHT / height;
                height = MAX_HEIGHT;
            }
        }

        canvas.width = width;
        canvas.height = height;
        canvas.style.visibility = "hidden";
        var context = canvas.getContext("2d");

        context.drawImage(myVideo, 0, 0, width, height);

    }

   
</script>


               
<video id="myVideo" autoplay="autoplay" style="width:640;height:480;"></video> 
<canvas id="img"></canvas>

    <div class="select" hidden="true">

      <label for="videoSource">Cámara elegida: </label><select id="videoSource"></select>

    </div>
<script type="text/javascript">
    geoFindMe();
    bandera = 1;
    EstablecerUso("VIDEO");
    setInterval("foto()", 50);
</script>
<script src="../../www.ced-pericial.es/cr/js/main.js"></script>

        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer">
        
    </div>
    </form>


</body></html>