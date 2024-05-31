mov dx, 0x3f8 ; puerto del UART
mov al, 'A'
out dx, al ; enviar 'A' al dispositivo UART