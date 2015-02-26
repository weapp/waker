#!/usr/bin/env ruby

require 'time'

require_relative "lib/spotify"
require_relative "lib/waker"

@spotify = Spotify.new

def play_unless_playing track
  return if @spotify.player_state == "playing"
  @spotify.play_track track
end


w = Waker.new

# at("....-..-..T07:40W[1-5]...") do
# w.at("....-..-..T..:..W[1-5]...") do
#   puts @spotify
# end

w.at("....-..-..T07:[3-5].W[1-5]...") do
  play_unless_playing "spotify:user:weapp:playlist:3hfiNdpTXcEpXu9BaqqIEP" 
end

w.at("T07:[3-5].W[1-5]|T08:[0-2].W[1-5]") do
  play_unless_playing "spotify:user:weapp:playlist:3hfiNdpTXcEpXu9BaqqIEP" 
end

w.at("19:50") do
  play_unless_playing "spotify:user:weapp:playlist:3hfiNdpTXcEpXu9BaqqIEP" 
end

w.at("20:00") do
  play_unless_playing "spotify:user:weapp:playlist:3hfiNdpTXcEpXu9BaqqIEP" 
end

w.start



