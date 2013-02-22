class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/rest/game/state" (controller: "stateOfGame", action: 'state')

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
