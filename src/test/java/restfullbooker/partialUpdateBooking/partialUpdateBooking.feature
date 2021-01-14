Feature: Partial Update Booking
  Este servicio es utilizado para poder
  actualizar una reserva de manera parcial

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar petición correcta para actualizar parcialmente una reserva reciba 200
      * def CreateTokenResponse = call read('classpath:common/createToken.feature')
      * def accessToken = CreateTokenResponse.response.token
      * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
      * def bookingId = CreateBookingResponse.response.bookingid
      Given path '/booking/' + bookingId
      And cookie token = accessToken
      And request
      """
        {
            "firstname" : "Eduardo",
            "lastname" : "Victorino"
        }
      """
      When method PATCH
      Then status 200
      And match response.firstname == 'Eduardo'
      And match response.lastname == 'Victorino'
