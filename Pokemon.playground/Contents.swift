//: Playground - noun: a place where people can play

import UIKit

class Pokemon {
  var health = 100
  var level = 1
  var type: String
  var name: String
  
  init (name: String, type: String) {
    self.name = name
    self.type = type
  }
  
  func levelUp() {
    level++
  }
}


class Pikachu: Pokemon {
  // electric type
  
  func thunderShock(enemyPokemon: Pokemon) -> Int {
    let damage = 40
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}

class Raichu: Pikachu {
  // electric type
  
  func thunderbolt(enemyPokemon: Pokemon) -> Int {
    let damage = 90
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}



class Jigglypuff: Pokemon {
  // normal/fairy type
  
  func pound(enemyPokemon: Pokemon) -> Int {
    let damage = 40
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}

class Wigglytuff: Jigglypuff {
  // normal/fairy type
  
  func lastResort(enemyPokemon: Pokemon) -> Int {
    let damage = 140
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}


class Venonat: Pokemon {
  // bug/poison type
  
  func tackle(enemyPokemon: Pokemon) -> Int {
    let damage = 50
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}

class Venomoth: Venonat {
  // bug/poison type
  
  func bugBuzz(enemyPokemon: Pokemon) -> Int {
    let damage = 90
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}


class Meowth: Pokemon {
  // normal type
  
  func scratch(enemyPokemon: Pokemon) -> Int {
    let damage = 40
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}

class Persian: Meowth {
  // normal type
  
  func slash(enemyPokemon: Pokemon) -> Int {
    let damage = 70
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}

class Tentacool: Pokemon {
  // water/poison type
  
  func acid(enemyPokemon: Pokemon) -> Int {
    let damage = 40
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}

class Tentacruel: Tentacool {
  // water/poison type
  
  func sludgeWave(enemyPokemon: Pokemon) -> Int {
    let damage = 95
    let enemyHealth = enemyPokemon.health
    return (enemyHealth - damage)
  }
}

var eddie = Pikachu(name: "eddie", type: "electric")

var myTenty = Tentacool(name: "kait", type: "poison")

eddie.thunderShock(myTenty)

var kitty = Persian(name: "fart", type: "normal")

eddie.thunderShock(kitty)

var oneMeanBastard = Tentacruel(name: "Burt", type: "water")

oneMeanBastard.sludgeWave(eddie)


















