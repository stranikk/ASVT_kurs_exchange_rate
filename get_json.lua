http.get("https://currate.ru/api/?get=rates&pairs=USDRUB,EURRUB,GBPRUB,JPYRUB,BYNRUB,AEDRUB&key=acc8acfca04def72286b74eb452f1a1a", nil, function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      response="HTTP/1.0 200 OK\r\nServer: NodeMCU\r\nContent-Type: application/json\r\n\r\n"
      response=response..data
      uart.alt(0)
      uart.setup(0, 115200, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)
      uart.write(0, "Hello, world\n")
    end

  end)

return response
