CON

  _CLKMODE = xtal1 + pll8x
  _XINFREQ = 10_000_000

OBJ

  Tree: "Tree"

PUB Main | a

  Tree.start
  Tree.setStar(1500)

  repeat until Tree.getButton == 1
  repeat until Tree.getButton == 0

  repeat
    repeat a from 0 to 100


      Tree.setLights(1, a)
      Tree.setLights(0, a)
      waitcnt(clkfreq/100+cnt)
    repeat a from 100 to 0
      Tree.setLights(1, a)
      Tree.setLights(0, a)
      waitcnt(clkfreq/100+cnt)


  Tree.setStar(1500)
  repeat
