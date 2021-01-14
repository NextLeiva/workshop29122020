Feature: Get Booking
  Este servicio es utilizado para el listado de 1 reserva
  a través de el codigoID de la reserva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar petición correcta con una reserva id reciba cod 200
      * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
      * def bookingId = CreateBookingResponse.response.bookingid
      Given path '/booking/' + bookingId
      When method GET
      Then status 200
      And match response.firstname == 'Eduardo'