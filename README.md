# Ping Pong API & Stats
The pertinent endpoints are listed.

## Player

#### GET /player
Players index.

#### POST /player
Creates a new player.
Required args: `name`

#### GET /player/:id
Player show. Returns `games_played_count`, `win_percentage`, `games_since_last_played`

#### GET /player/:id/history/:opposing_player_id'
Player vs player history. Returns `win_percentage`, `avg_total_points`, `total_games`

## Game

#### GET /game/:id
Game show. Returns `scoreboard`, `serving`, `game_winner`, `finished`

#### POST /game
Creates a new game.
Required args: `player_1_id`, `player_2_id`
Optional args: `service` 1 or 2 (as in player 1 or player 2; defaults to 1)

#### PUT /game/:id
Force change of service.
Optional args: `service`

## Score

#### POST /score
Create a new score.
Requires args: `player_id`, `game_id`

#### DELETE /score/:game_id
Removes the last point scored, and "unfinishes" the game, if applicable". Can be repeated down to 0-0.
