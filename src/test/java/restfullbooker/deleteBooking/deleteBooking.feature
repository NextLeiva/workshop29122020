Feature: Delete Booking
  Este servicio es utilizado para
  poder eliminar una reserva

  Background:
    * url baseUrl

    Scenario: Verificar petición correcta para eliminar una reserva reciba 201
      * def CreateTokenResponse = call read('classpath:common/createToken.feature')
      * def accessToken = CreateTokenResponse.response.token
      * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
      * def bookingId = CreateBookingResponse.response.bookingid
      Given path '/booking/' + bookingId
      And cookie token = accessToken
      When method DELETE
      Then status 201

      Given path '/booking/' + bookingId
      And header Accept = 'application/json'
      When method GET
      Then status 404