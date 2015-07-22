CON

  _clkmode = xtal1 + pll8x
  _xinfreq = 10_000_000

OBJ

  PWM: "PWM"
  Serial: "Serial"

PUB Main | a

  PWM.start
  Serial.init(31, 30, 9600)

  DIRA[0..1]~~
  DIRA[2]~

  repeat
    'waitcnt(clkfreq/10+cnt)

    if INA[2] == 0
      OUTA[1]~~
    else
      OUTA[1]~

    waitcnt(clkfreq/2+cnt)
    Serial.bin(INA[2], 1)

  repeat
    repeat a from 0 to 100
      'PWM.servo(0, a, 1000)
      PWM.PWM(1, a, 100-a)
      waitcnt(clkfreq/100+cnt)
    repeat a from 100 to 0
      PWM.PWM(1, a, 100-a)
      waitcnt(clkfreq/100+cnt)
    repeat a from 700 to 2300
      PWM.Servo(20, a)
      waitcnt(clkfreq/1000+cnt)
    repeat a from 2300 to 700
      PWM.servo(20, a)
      waitcnt(clkfreq/1000+cnt)
