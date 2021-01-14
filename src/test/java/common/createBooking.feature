Feature: Create Booking
  Este servicio es utilizado para poder
  registrar una reserva nueva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar petición correcta para crear una reserva reciba 200
      Given path '/booking'
      And request
      """
       {
        "firstname" : "Eduardo",
        "lastname" : "Victorio",
        "totalprice" : 100,
        "depositpaid" : true,
        "bookingdates" : {
          "checkin" : "2021-02-10",
          "checkout" : "2021-02-15"
       },
        "additionalneeds" : "Lunch"
        }
      """
      When method POST
      Then status 200
      And match response.booking.firstname == 'Eduardo'
      And match response.booking.lastname == 'Victorio'
      And match response.booking.totalprice == 100
      And match response.booking.depositpaid == true
      And match response.booking.bookingdates.checkin == '2021-02-10'
      And match response.booking.bookingdates.checkout == '2021-02-15'
      And match response.booking.additionalneeds == 'Lunch'