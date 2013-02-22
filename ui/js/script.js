(function ($) {
	
	var host = 'https://ep-battle-manager.eu01.aws.af.cm/rest/game',
		urls = {
			listAll: '/listAll',
			list: '/list/{query}',
			attack: '/attack',
			update: '/update',
			gameState: '/state'
		},
		sampleSate = {"playerCharacters":[{"class":"game.PlayerCharacter","id":1,"armourPoints":3,"hp":50,"initialInitative":7,"name":"Zenek","skillLevels":[{"class":"SkillLevel","id":4},{"class":"SkillLevel","id":1}],"weapons":[{"class":"Weapon","id":1}]}],"nonPlayerCharacters":[{"class":"game.NonPlayerCharacter","id":2,"armourPoints":1,"hp":30,"initialInitative":3,"name":"Policeman1","skillLevels":[{"class":"SkillLevel","id":2},{"class":"SkillLevel","id":4}],"weapons":[{"class":"Weapon","id":1}]}]},
		$tableContainer = $('#table-container'),
		$logsContainer = $('#log-container'),
		
		
		init = function ()
		{
			var init_state;
			
			$.ajax({
				url: host + urls.gameState,
				dataType: 'json',
				success: function (response)
				{
					updateGameState(response);
				}
			});
			
			// updateGameState(sampleSate);
		},
		
		updateGameState = function(gameState, callback)
		{
			var callback = callback || null,
				characters = [],
				$characterTemplate = $('#character-template');
			// update table
			for (var i in gameState.nonPlayerCharacters)
				gameState.nonPlayerCharacters[i].nonPlayer = true;
			
			characters = gameState.playerCharacters.concat(gameState.nonPlayerCharacters);
			delete(gameState.nonPlayerCharacters);
			
			$tableContainer.html('');
			
			for (var i in characters)
			{
				$tableContainer.append(template(
					$characterTemplate.html(), 
					{
						'{character_name}': characters[i].name,
						'{character_hp}': characters[i].hp
					}
				));
			}
			// console.log(characters[0]);
			console.log(characters);
			// console.log($character_template.html());
			
			
			
			// update log
			// update ...
			
			callback();
		},
		
		template = function(html, map)
		{
			for(var i in map)
				html = html.replace(i, map[i])
			return html;
		},
		askHero = function(oportunity, callback)
		{
			/*
				oportunity: {
					question: "Do something!"
					responses: [
						{ name: 'Run!',
						  id: '1'},
						{ name: 'Fight!',
						 id: 2 },
						{ name: 'Say: Lalala!',
						 id: 3 }
					]
			*/
			// pokaż popup z pytaniem i odpowiedziami
			
			// 
			
			callback(response);
		};

		rollDice = function(maxValue) {
			var value = Math.floor(Math.random()*(maxValue)) + 1
			$('#diceValue').text(value)
			$('#diceModal').modal('show')
		}
		
		init();
})(jQuery);