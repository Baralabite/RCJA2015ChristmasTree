CON

  L1Pin = 0
  L2Pin = 1

OBJ

  PWM: "PWM"

PUB Start

  DIRA[2]~
  PWM.Start

PUB setLights(pin, percent)

  PWM.PWM(pin, percent, 100-percent)

PUB setStar(signal)

  PWM.Servo(20, signal)

PUB getButton

  return INA[2]

