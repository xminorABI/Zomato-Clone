function initMap() {
    // The location of Uluru
  
  let lati= document.getElementById("restId1")
  let longi=document.getElementById("restId2")
  const uluru = {lat: parseFloat(lati.textContent), lng: parseFloat(longi.textContent)}
    // The map, centered at Uluru
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 15,
      center: uluru,
    });
    // The marker, positioned at Uluru
    const marker = new google.maps.Marker({
      position: uluru,
      map: map,
    });
  
  }
  
  window.initMap = initMap;
