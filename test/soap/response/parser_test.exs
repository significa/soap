defmodule Soap.Response.ParserTest do
  use ExUnit.Case
  alias Soap.Response.Parser

  test "correct response parsed successful" do
    xml_body = Fixtures.load_xml("send_service/SendMessageResponse.xml")
    correctly_parsed_response = %{response: %{message: "Hello!"}}

    assert Parser.parse(xml_body, :success) == correctly_parsed_response
  end

  test "correct response parsed successful with attributes" do
    xml_body = Fixtures.load_xml("send_service/SendMessageResponseComplex.xml")
    correctly_parsed_response = %{response: %{message: %{id: "1234567890", date: "2025-03-25", text: "Hello!"}}}

    assert Parser.parse(xml_body, :success) == correctly_parsed_response
  end
end
