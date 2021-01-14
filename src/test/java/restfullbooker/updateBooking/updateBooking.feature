Feature: Update Booking
  Este servicio es utilizado para poder
  actualizar nuestra reserva a través de
  el código de una reserva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario Outline: Verificar petición correcta para actualizar una reserva reciba 200
      * def SchemaUtils = Java.type('com.intuit.karate.restfullbooker.util.SchemaUtils')
      * string schema = read('classpath:restfullbooker/updateBooking/updatebooking-schema.json')
      * def CreateTokenResponse = call read('classpath:common/createToken.feature')
      * def accessToken = CreateTokenResponse.response.token
      * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
      * def bookingId = CreateBookingResponse.response.bookingid
      Given path '/booking/' + bookingId
      And cookie token = accessToken
      And request
      """
        {
          "firstname" : "<firstname>",
          "lastname" : "<lastname>",
          "totalprice" : <totalprice>,
          "depositpaid" : <depositpaid>,
          "bookingdates" : {
              "checkin" : "<checkin>",
              "checkout" : "<checkout>"
          },
          "additionalneeds" : "<additionalneeds>"
        }
      """
      When method PUT
      Then status 200
      And match response.firstname == '<firstname>'
      And match response.lastname == '<lastname>'
      And match response.totalprice == <totalprice>
      And match response.depositpaid == <depositpaid>
      And match response.bookingdates.checkin == '<checkin>'
      And match response.bookingdates.checkout == '<checkout>'
      And match response.additionalneeds == '<additionalneeds>'
      And assert SchemaUtils.isValid(response, schema)

      Examples:
      |read('data/updatebooking-data.csv')|