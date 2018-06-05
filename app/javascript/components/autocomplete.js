function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var eventLocation = document.getElementById('location');

    if (eventLocation) {
      var autocomplete = new google.maps.places.Autocomplete(eventLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(eventLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
