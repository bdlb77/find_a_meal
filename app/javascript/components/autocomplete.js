function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var eventAddress = document.getElementById('address');

    if (eventAddress) {
      var autocomplete = new google.maps.places.Autocomplete(eventAddressn, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(eventAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
