CON

  _CLKMODE = xtal1 + pll8x
  _XINFREQ = 10_000_000

OBJ

  Tree: "Tree"
  Serial: "Serial"

VAR

  long time

  long stack[40]

PUB Main | a

  Tree.start
  Tree.setStar(1500)
  Serial.init(31, 30, 19200)
  repeat while INA[2] == 0
  cognew(globalCounter, @stack)

  R1

  Tree.setStar(1500)
  repeat

PUB R1 | i, j, a, b


  repeat until time > 41+60
    repeat i from 0 to 100
      Tree.setLights(1, i)
      Tree.setStar((i*8)+1100)
      if time > 42+60
        Tree.setLights(1, 0)
        quit
      waitcnt(clkfreq/100+cnt)
    repeat i from 100 to 0
      Tree.setLights(1, i)
      Tree.setStar((i*8)+1100)                        
      if time > 42+60
        Tree.setLights(1, 0)
        quit                               
      waitcnt(clkfreq/100+cnt)


  MS(800)

  a := 1300
  b := 1700

  Tree.setStar(a)
  Tree.setLights(1, 100)                            
  MS(200)
  Tree.setLights(1, 0)
  MS(300)

  Tree.setStar(b)
  Tree.setLights(1, 100)
  MS(200)
  Tree.setLights(1, 0)
  MS(1200)

  Tree.setStar(a)
  Tree.setLights(1, 100)
  MS(200)
  Tree.setLights(1, 0)
  MS(300)

  Tree.setStar(b)
  Tree.setLights(1, 100)
  MS(200)
  Tree.setLights(1, 0)
  MS(950)

  i := TRUE
  
  repeat 5
    if i == TRUE
      Tree.setStar(a)
      i := FALSE
    else
      Tree.setStar(b)
      i := TRUE
    Tree.setLights(1, 100)
    MS(200)
    Tree.setLights(1, 0)
     
    MS(200)

  MS(100)
    
  repeat 5
    if i == TRUE
      Tree.setStar(a)
      i := FALSE
    else
      Tree.setStar(b)
      i := TRUE
    Tree.setLights(1, 100)
    MS(200)
    Tree.setLights(1, 0)
     
    MS(300)

  MS(2500)
  Tree.setStar(1500)
  
  repeat 50
    Tree.setLights(1, 100)
    waitcnt(clkfreq/20+cnt)
    Tree.setLights(1, 0)
    waitcnt(clkfreq/20+cnt)
  
  
    
    

PUB S(n)

  repeat n
    waitcnt(clkfreq/1+cnt)

PUB MS(n)

  waitcnt((clkfreq/1000)*n+cnt)

PUB globalCounter

  time := 8'27+60
  
  repeat
    waitcnt(clkfreq/1+cnt)
    time++
    
    