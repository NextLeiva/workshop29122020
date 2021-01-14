Feature: Create Booking
  Este servicio es utilizado para poder
  registrar una reserva nueva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario Outline: Verificar petición correcta de la creacion de 7 reservas que reciba 200
      Given path '/booking'
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
      When method POST
      Then status 200
      And match response.booking.firstname == '<firstname>'
      And match response.booking.lastname == '<lastname>'
      And match response.booking.totalprice == <totalprice>
      And match response.booking.depositpaid == <depositpaid>
      And match response.booking.bookingdates.checkin == '<checkin>'
      And match response.booking.bookingdates.checkout == '<checkout>'
      And match response.booking.additionalneeds == '<additionalneeds>'
      And match response.bookingid == '#number'
      And match response.booking.firstname == "#string"
      And match response.booking.lastname == "#string"
      And match response.booking.totalprice == '#number'
      And match response.booking.depositpaid == '#boolean'
      And match response.booking.bookingdates.checkin == "#string"
      And match response.booking.bookingdates.checkout == "#string"
      And match response.booking.additionalneeds == "#string"

      Examples:
        |firstname|lastname|totalprice|depositpaid|checkin   |checkout  |additionalneeds|
        |Eduardito|Victorio|100       |true       |2021-02-10|2021-02-25|   Lunch       |
        |Oscar    |Gomez   |50        |false      |2021-02-10|2021-02-05|   Breakfast   |
        |Rubi     |Bautista|80        |true       |2021-02-10|2021-05-14|   Lunch       |
        |Jonathan |Lazaro  |40        |true       |2022-02-10|2025-02-15|   Dinner      |
        |Cesar    |Mendoza |50        |false      |2023-02-10|2029-02-15|   Lunch       |
        |Cristian |Palomino|95        |true       |2021-02-10|2021-02-15|   Breakfast   |
        |Gianny   |Alfaro  |65        |true       |2021-02-10|2021-02-15|   Lunch       |