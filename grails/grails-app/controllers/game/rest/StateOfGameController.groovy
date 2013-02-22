package game.rest

import game.NonPlayerCharacter
import game.PlayerCharacter
import grails.converters.JSON

class StateOfGameController {
    def state() {
        List<PlayerCharacter> playerCharacters = PlayerCharacter.findAll()
        List<NonPlayerCharacter> nonPlayerCharacters = NonPlayerCharacter.findAll()

        render([playerCharacters:playerCharacters,
                nonPlayerCharacters:nonPlayerCharacters] as JSON)
    }
}
