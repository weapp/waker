#!/usr/bin/env ruby

require_relative "osascript_adapter"

class Spotify
  include OsascriptAdapter
  
  commands :player_state, :artist_of_current_track, 
          :album_of_current_track, :disc_number_of_current_track,
          :duration_of_current_track, :played_count_of_current_track,
          :track_number_of_current_track, :starred_of_current_track,
          :popularity_of_current_track, :id_of_current_track,
          :name_of_current_track, :album_artist_of_current_track,
          :spotify_url_of_current_track, :player_position, :repeating,
          :shuffling, :sound_volume, :next_track, :previous_track,
          :playpause, :pause, :stop, :play, :name, :frontmost, :version,
          :quit

  setters :player_position, :repeating, :sound_volume

  functions :play_track
end

# @spotify = Spotify.new

# @spotify.player_state
# @spotify.artist_of_current_track
# @spotify.album_of_current_track
# @spotify.disc_number_of_current_track
# @spotify.duration_of_current_track
# @spotify.played_count_of_current_track
# @spotify.track_number_of_current_track
# @spotify.starred_of_current_track
# @spotify.popularity_of_current_track
# @spotify.id_of_current_track
# @spotify.name_of_current_track
# @spotify.album_artist_of_current_track
# @spotify.spotify_url_of_current_track


# @spotify.player_position
# @spotify.repeating
# @spotify.shuffling
# @spotify.sound_volume

# @spotify.name
# @spotify.frontmost
# @spotify.version

# @spotify.sound_volume
# @spotify.sound_volume = 40

# @spotify.sound_volume
# @spotify.sound_volume = 10

# @spotify.sound_volume
# @spotify.sound_volume = 100

# @spotify.play_track "spotify:track:3941McqnrX9blUEelPxgot"
# sleep(1.0/24.0)
# @spotify.pause

